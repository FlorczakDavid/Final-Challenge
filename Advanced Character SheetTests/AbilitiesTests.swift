//
//  AbilitiesTests.swift
//  Advanced Character SheetTests
//
//  Created by Денис Матвеев on 25/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import XCTest
@testable import Advanced_Character_Sheet

class CharacterBuilderTests: XCTestCase {
    let compendium = Compendium()
    
    func tesAbilitiestDecoding() {
        guard let abilities = compendium.abilities else {
            return
        }
        
        var char = CharacterBuilder(abilities: abilities)
        
        XCTAssertEqual(abilities[0].name, "Strength")
    }

}
