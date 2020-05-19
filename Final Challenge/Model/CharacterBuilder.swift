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
        willSet(newValue) {
            // Setting up character according to the new race
            characterSheet.speed = newValue.speed
            if subrace == nil {
                for bonus in race.abilityBonuses {
                    characterSheet.abilityScores.modifiers[bonus.ability.name] = bonus.bonus
                }
                
                // WARNING: Adding to the general lists, but in this case we want be able to track added traits
                // and remove them, if we change the race. Should we have separate lists for race and class traits
                // or just don't care?
                characterSheet.proficiencies.append(contentsOf: race.startingProficiencies)
                characterSheet.languages.append(contentsOf: race.startingLanguages)
                characterSheet.features.append(contentsOf: race.traits)
            }
        }
    }
    
    var subrace: Subrace?
    var background: CharacterBackground?
    var abilities: [Ability]?
    var characterSheet: CharacterSheet
    
    init(race: Race, subrace: Subrace?) {
        // Creating a blank CS
        self.characterSheet = CharacterSheet()
        
        self.race = race
        self.subrace = subrace
    }
}
