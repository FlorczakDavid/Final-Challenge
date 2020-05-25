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
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let compendium = Compendium()
        
        guard let abilities = compendium.abilities else {
            return
        }
        
        sut = CharacterBuilder(abilities: abilities).characterSheet
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
        XCTAssertGreaterThan(sut.abilityScores.first!.roll().result, 0, "Ability roll is out of range")
    }

    func testItemByNameAccessibility() {
        XCTAssertNotNil(sut.abilityScores.itemByName("Strength"))
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
