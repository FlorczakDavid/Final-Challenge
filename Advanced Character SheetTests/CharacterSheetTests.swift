//
//  Advanced_Character_SheetTests.swift
//  Advanced Character SheetTests
//
//  Created by Денис Матвеев on 25/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//
// https://www.raywenderlich.com/960290-ios-unit-testing-and-ui-testing-tutorial

import XCTest
@testable import Advanced_Character_Sheet

class CharacterSheetTests: XCTestCase {
    
    var sut: CharacterSheet! // System Under Test (SUT), or the object this test case class is concerned with testing.
    
    private let abilityModifierRange = -5...10
    private let abilityValueRange = 1...30
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let compendium = Compendium()
        
        guard let abilities = compendium.abilities,
            let skills = compendium.skills else {
            return
        }
        
        sut = CharacterBuilder(abilities: abilities, skills: skills).characterSheet
        
        // Randomizing ability modifiers and values
        for ability in sut.abilityScores {
            ability.modifier = Int.random(in: abilityModifierRange)
            ability.value = Int.random(in: abilityValueRange)
        }
        sut.proficiencyBonus = Int.random(in: 2...10)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        // Cleaning up
        sut = nil
    }
    
    func testCSExists() throws {
        XCTAssertNotNil(sut)
    }
    
    func testAbilityRolls() throws {
        // It’s good practice to format the test into given, when and then sections:
        // Given: Here, you set up any values needed. In this example, you create a guess value so you can specify how much it differs from targetValue.
        // When: In this section, you’ll execute the code being tested: Call check(guess:).
        // Then: This is the section where you’ll assert the result you expect with a message that prints if the test fails. In this case, sut.scoreRound should equal 95 (100 – 5).
        XCTAssertLessThan(sut.abilityScores.first!.roll().result, 20 + sut.abilityScores.first!.modifier, "Ability roll is out of range")
        XCTAssertGreaterThan(sut.abilityScores.first!.roll().result, abilityModifierRange.lowerBound, "Ability roll is out of range")
    }

    func testSkillRolls() throws {
        XCTAssertLessThan(sut.skills.first!.roll().result, 20 + sut.skills.first!.modifier, "Skill roll is out of range")
    }
    
    func testSkillModifiers() throws {
        for skill in sut.skills {
            XCTAssertEqual(skill.modifier, skill.connectedAbility.modifier + (skill.isProficient ? sut.proficiencyBonus : 0))
            sut.abilityScores.itemByName(skill.connectedAbility.name)?.modifier = Int.random(in: abilityModifierRange)
            skill.isProficient = Bool.random()
            XCTAssertEqual(skill.modifier, skill.connectedAbility.modifier + (skill.isProficient ? sut.proficiencyBonus : 0))
            skill.connectedAbility.modifier = Int.random(in: abilityModifierRange)
            skill.isProficient = Bool.random()
            XCTAssertEqual(skill.modifier, skill.connectedAbility.modifier + (skill.isProficient ? sut.proficiencyBonus : 0))
        }
    }
    
    func testSavingThrowModifiers() throws {
        var index = 0
        for ability in sut.abilityScores {
            let savingThrow = sut.savingThrows[index]
            savingThrow.isProficient = Bool.random()
            XCTAssertEqual(savingThrow.modifier, ability.modifier + (savingThrow.isProficient ? sut.proficiencyBonus : 0))
            index += 1
        }
    }

    func testItemByNameAccessibility() {
        XCTAssertNotNil(sut.abilityScores.itemByName("Strength"))
    }
    
    func testAbilityShortName() {
        let abilityScore = AbilityScore(name: "Strength")
        XCTAssertEqual(abilityScore.shortName, "STR")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
