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
    var roberta: CharacterBuilder!
    var andrea: CharacterBuilder!
    var david: CharacterBuilder!
    
    init() {
        guard let abilities = compendium.abilities,
            let skills = compendium.skills else {
            return
        }
        
        denis = CharacterBuilder(abilities: abilities, skills: skills)
        
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
        denis.characterSheet.proficiencyBonus = 3
        denis.characterSheet.skills[2].isProficient = true
        denis.characterSheet.skills[5].isProficient = true
        denis.characterSheet.skills[8].isProficient = true
        denis.characterSheet.skills[10].isProficient = true
        denis.characterSheet.skills[11].isProficient = true
        denis.characterSheet.skills[14].isProficient = true
        denis.characterSheet.savingThrows.itemByName("Intelligence")?.isProficient = true
        denis.characterSheet.savingThrows.itemByName("Wisdom")?.isProficient = true
        denis.characterSheet.passiveWisdom = 15
        denis.characterSheet.armorClass = 10
        denis.characterSheet.initiative = 0
        denis.characterSheet.speed = 30
        denis.characterSheet.hitPoints = HitPoints(value: 37, maximum: 37)
        denis.characterSheet.hitDice = VariableTrait(value: 5, maximum: 5)
        denis.characterSheet.hitDie = Dice(.d6, times: 5)
        denis.characterSheet.money["GP"] = 73
        denis.characterSheet.features.append(contentsOf: [
            Feature(name: "Darkvision", description: "Dim=Bright, Dark=Dim(no color in Dark)", source: .race, sourceDescription: "Race - Half-Elf"),
            Feature(name: "Fey Ancestry", description: "Advantage vs. Charm effects and Immunity vs. Sleep", sourceDescription: "Ancient - Vampire"),
        ])
        
        roberta = CharacterBuilder(abilities: abilities, skills: skills)
        
        roberta.characterSheet.abilityScores[0].value = 8
        roberta.characterSheet.abilityScores[0].modifier = -1
        roberta.characterSheet.abilityScores[1].value = 18
        roberta.characterSheet.abilityScores[1].modifier = 4
        roberta.characterSheet.abilityScores[2].value = 16
        roberta.characterSheet.abilityScores[2].modifier = 3
        roberta.characterSheet.abilityScores[3].value = 8
        roberta.characterSheet.abilityScores[3].modifier = -1
        roberta.characterSheet.abilityScores[4].value = 8
        roberta.characterSheet.abilityScores[4].modifier = -1
        roberta.characterSheet.abilityScores[5].value = 18
        roberta.characterSheet.abilityScores[5].modifier = 4
        roberta.characterSheet.proficiencyBonus = 4
        roberta.characterSheet.skills[4].isProficient = true
        roberta.characterSheet.skills[7].isProficient = true
        roberta.characterSheet.skills[11].isProficient = true
        roberta.characterSheet.skills[13].isProficient = true
        roberta.characterSheet.skills[16].isProficient = true
        roberta.characterSheet.savingThrows.itemByName("Constitution")?.isProficient = true
        roberta.characterSheet.savingThrows.itemByName("Charisma")?.isProficient = true
        roberta.characterSheet.passiveWisdom = 13
        roberta.characterSheet.armorClass = 17
        roberta.characterSheet.initiative = 4
        roberta.characterSheet.speed = 30
        roberta.characterSheet.hitPoints = HitPoints(value: 41, maximum: 82)
        roberta.characterSheet.hitDice = VariableTrait(value: 10, maximum: 10)
        roberta.characterSheet.hitDie = Dice(.d6, times: 10)
        roberta.characterSheet.money["GP"] = 27
        roberta.characterSheet.money["SP"] = 5
        
        andrea = CharacterBuilder(abilities: abilities, skills: skills)
        
        andrea.characterSheet.abilityScores[0].value = 8
        andrea.characterSheet.abilityScores[0].modifier = -1
        andrea.characterSheet.abilityScores[1].value = 10
        andrea.characterSheet.abilityScores[1].modifier = 0
        andrea.characterSheet.abilityScores[2].value = 16
        andrea.characterSheet.abilityScores[2].modifier = 3
        andrea.characterSheet.abilityScores[3].value = 18
        andrea.characterSheet.abilityScores[3].modifier = 4
        andrea.characterSheet.abilityScores[4].value = 14
        andrea.characterSheet.abilityScores[4].modifier = 2
        andrea.characterSheet.abilityScores[5].value = 10
        andrea.characterSheet.abilityScores[5].modifier = 0
        andrea.characterSheet.proficiencyBonus = 3
        andrea.characterSheet.skills[2].isProficient = true
        andrea.characterSheet.skills[5].isProficient = true
        andrea.characterSheet.skills[8].isProficient = true
        andrea.characterSheet.skills[10].isProficient = true
        andrea.characterSheet.skills[11].isProficient = true
        andrea.characterSheet.skills[14].isProficient = true
        andrea.characterSheet.savingThrows.itemByName("Intelligence")?.isProficient = true
        andrea.characterSheet.savingThrows.itemByName("Wisdom")?.isProficient = true
        andrea.characterSheet.passiveWisdom = 15
        andrea.characterSheet.armorClass = 10
        andrea.characterSheet.initiative = 0
        andrea.characterSheet.speed = 30
        andrea.characterSheet.hitPoints = HitPoints(value: 37, maximum: 37, temporary: 10)
        andrea.characterSheet.hitDice = VariableTrait(value: 5, maximum: 5)
        andrea.characterSheet.hitDie = Dice(.d6, times: 5)
        andrea.characterSheet.money["GP"] = 73
        
        david = CharacterBuilder(abilities: abilities, skills: skills)
        
        david.characterSheet.abilityScores[0].value = 8
        david.characterSheet.abilityScores[0].modifier = -1
        david.characterSheet.abilityScores[1].value = 10
        david.characterSheet.abilityScores[1].modifier = 0
        david.characterSheet.abilityScores[2].value = 16
        david.characterSheet.abilityScores[2].modifier = 3
        david.characterSheet.abilityScores[3].value = 18
        david.characterSheet.abilityScores[3].modifier = 4
        david.characterSheet.abilityScores[4].value = 14
        david.characterSheet.abilityScores[4].modifier = 2
        david.characterSheet.abilityScores[5].value = 10
        david.characterSheet.abilityScores[5].modifier = 0
        david.characterSheet.proficiencyBonus = 3
        david.characterSheet.skills[2].isProficient = true
        david.characterSheet.skills[5].isProficient = true
        david.characterSheet.skills[8].isProficient = true
        david.characterSheet.skills[10].isProficient = true
        david.characterSheet.skills[11].isProficient = true
        david.characterSheet.skills[14].isProficient = true
        david.characterSheet.savingThrows.itemByName("Intelligence")?.isProficient = true
        david.characterSheet.savingThrows.itemByName("Wisdom")?.isProficient = true
        david.characterSheet.passiveWisdom = 15
        david.characterSheet.armorClass = 10
        david.characterSheet.initiative = 0
        david.characterSheet.speed = 30
        david.characterSheet.hitPoints = HitPoints(value: 7, maximum: 37, temporary: 15)
        david.characterSheet.hitDice = VariableTrait(value: 5, maximum: 5)
        david.characterSheet.hitDie = Dice(.d6, times: 5)
        david.characterSheet.money["GP"] = 73
    }
}



