//
//  CompendiumTests.swift
//  Advanced Character SheetTests
//
//  Created by Денис Матвеев on 26/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import XCTest
@testable import Advanced_Character_Sheet

class CompendiumTests: XCTestCase {
    
    var sut: Compendium!
    
    override func setUpWithError() throws {
        sut = Compendium()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testAbilitiesAreCorrect() throws {
        guard let abilities = sut.abilities else {
            return
        }
        
        XCTAssertEqual(abilities.first!.name, "Strength")
        XCTAssertEqual(abilities.first!.shortName, "STR")
        XCTAssertEqual(abilities.last!.name, "Charisma")
        XCTAssertEqual(abilities.last!.shortName, "CHA")
    }
    
    func testSkillsAreCorrect() throws {
        guard let skills = sut.skills else {
            return
        }
        
        XCTAssertEqual(skills.first!.name, "Acrobatics")
        XCTAssertEqual(skills.last!.name, "Survival")
    }
}
