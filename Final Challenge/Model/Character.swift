//
//  Character.swift
//  CharacterSheet
//
//  Created by Денис Матвеев on 14/05/2020.
//  Copyright © 2020 Denis Matveev. All rights reserved.
//

import Foundation

// This is a temporary list of possible structures
// Later these should reside in separate files

struct Character {
    var avatar: String?
    var name: String
    var race: Descriptable
    var classes: [Descriptable]
    var levels: [Int]
    var sheet: CharacterSheet
    
//    init(class: CharacterClass, race: Race, subrace: Subrace?, abilities: [Ability]) {
//        // Create a new character here with all math stuff and dependencies
//    }
}
