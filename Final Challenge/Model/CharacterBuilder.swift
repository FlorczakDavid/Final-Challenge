//
//  CharacterBuilder.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 18/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

// This module should be used for creation and editing a character. It connects Data model with Model

struct CharacterBuilder {
    var characterClass: CharacterClass?
    var race: Race {
        willSet {
            
        }
    }
    var subrace: Subrace?
    var abilities: [Ability]?
    var characterSheet: CharacterSheet?
    
    init(race: Race) {
        self.race = race
        
    }
}
