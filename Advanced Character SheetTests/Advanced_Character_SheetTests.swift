//
//  Advanced_Character_SheetTests.swift
//  Advanced Character SheetTests
//
//  Created by Денис Матвеев on 25/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import XCTest
@testable import Advanced_Character_Sheet

class Advanced_Character_SheetTests: XCTestCase {
    let compendium = Compendium()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAbilities() throws {
        guard let abilities = compendium.abilities else {
            return
        }
        
        XCTAssertEqual(abilities.first!.name, "Strength")
        XCTAssertEqual(abilities.first!.shortName, "STR")
        XCTAssertEqual(abilities.last!.name, "Charisma")
        XCTAssertEqual(abilities.last!.shortName, "CHA")
        
        var char = CharacterBuilder(abilities: abilities)
        
        XCTAssertNotNil(char.characterSheet)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
