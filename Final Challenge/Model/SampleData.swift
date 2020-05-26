//
//  SampleData.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 26/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

// Place for sample characters
struct Sample {
    var compendium = Compendium()
    
    var denis: CharacterBuilder!
    
    init() {
        guard let abilities = compendium.abilities else {
            return
        }
        
        denis = CharacterBuilder(abilities: abilities)
        
        denis.characterSheet.abilityScores[0].value = 8
        denis.characterSheet.abilityScores[0].modifier = -1
        denis.characterSheet.abilityScores[1].value = 10
        denis.characterSheet.abilityScores[1].modifier = 0
        denis.characterSheet.abilityScores[2].value = 16
        denis.characterSheet.abilityScores[2].modifier = 3
        denis.characterSheet.abilityScores[3].value = 18
        denis.characterSheet.abilityScores[3].modifier = 4
        denis.characterSheet.abilityScores[4].value = 14
        denis.characterSheet.abilityScores[4].modifier = 2
        denis.characterSheet.abilityScores[5].value = 10
        denis.characterSheet.abilityScores[5].modifier = 0
    }
}



