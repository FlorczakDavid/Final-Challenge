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
    
    var abilities: [Ability]! {
        willSet(newAbilities) {
            for ability in newAbilities {
                let newAbilityScore = AbilityScore(name: ability.name, description: ability.description)
                characterSheet.abilityScores.append(newAbilityScore)
                characterSheet.savingThrows.append(Score(name: ability.name, description: "", isProficient: false, connectedAbility: newAbilityScore))
            }
        }
    }
    
    var skills: [Skill]! {
        willSet(newSkills) {
            for skill in newSkills {
                guard let ability = characterSheet.abilityScores.itemByName(skill.ability) else {
                    return
                }
                characterSheet.skills.append(Score(
                    name: skill.name,
                    description: skill.description,
                    isProficient: false,
                    connectedAbility: ability))
            }
        }
    }
    
    var race: Race? {
        willSet(newRace) {
            guard let newRace = newRace else {
                return
            }
            
            // Setting up character according to the new race
            characterSheet.speed = newRace.speed
            
            for bonus in newRace.abilityBonuses {
                if let abilityFound = characterSheet.abilityScores.itemByName(bonus.ability.name) {
                    abilityFound.value += bonus.bonus
                }
            }
            
            // Refreshes saving throw list according to new ability scores
            //characterSheet.updateSavingThrows()
            
            // WARNING: Adding to the general lists, but in this case we want be able to track added traits
            // and remove them, if we change the race. Should we have separate lists for race and class traits
            // or just don't care?
            characterSheet.proficiencies.append(contentsOf: newRace.startingProficiencies)
            characterSheet.languages.append(contentsOf: newRace.startingLanguages)
            characterSheet.features.append(contentsOf: newRace.traits)
        }
    }
    
    var subrace: Subrace? {
        willSet(newSubrace) {
            guard let newSubrace = newSubrace else {
                return
            }
            for bonus in newSubrace.abilityBonuses {
                if let abilityFound = characterSheet.abilityScores.itemByName(bonus.ability.name) {
                    abilityFound.value += bonus.bonus
                }
            }
            
            characterSheet.proficiencies.append(contentsOf: newSubrace.startingProficiencies)
            characterSheet.languages.append(contentsOf: newSubrace.startingLanguages)
            characterSheet.features.append(contentsOf: newSubrace.traits)
        }
    }
    
    var characterClass: CharacterClass? {
        willSet(newClass) {
            guard let newClass = newClass else {
                return
            }
            
            if let tempDie = Die(rawValue: newClass.hitDie) {
                characterSheet.hitDie = Dice(tempDie)
            }
            
            // TBD…
        }
    }
    
    var background: CharacterBackground?
    
    var characterSheet: CharacterSheet
    
//    init(race: Race, subrace: Subrace?, abilities: [Ability]) {
//        // Creating a blank CS
//        self.characterSheet = CharacterSheet()
//
//        self.abilities = abilities
//        self.race = race
//        self.subrace = subrace
//    }
    
    init(abilities: [Ability], skills: [Skill]) {
        self.characterSheet = CharacterSheet()
        
        // Workaround to avoid willSet not being called at the variable init
        ({ self.abilities = abilities
            self.skills = skills
        })()
    }
}
