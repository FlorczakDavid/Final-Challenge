//
//  Race.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 14/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

// Should conform to codable
struct Race: Descriptable {
    let name: String
    let description: String
    let speed: Int // Base move speed for this race (in feet per round)
    let abilityBonuses: [AbilityBonus] // Racial bonuses to each of the six ability scores
    let alignment: String // Flavor description of likely alignments this race takes
    let age: String // Flavor description of possible ages for this race
    let size: String // Size class of this race
    let sizeDescription: String // Flavor description of height and weight for this race
    let startingProficiencies: [Proficiency] // Starting proficiencies for all new characters of this race
    let startingLanguages: [Language] // Starting languages for all new characters of this race
    let languagesDescription: String // Flavor description of the languages this race knows
    let traits: [Trait] // Racial traits that provide benefits to its members
    let subraces: [Subrace]
}

struct Subrace: Descriptable {
    let name: String
    let description: String
    let race: Race // The parent race for this subrace
    let abilityBonuses: [AbilityBonus] // Racial bonuses to each of the six ability scores
    let startingProficiencies: [Proficiency] // Starting proficiencies for all new characters of this race
    let startingLanguages: [Language] // Starting languages for all new characters of this race
    let traits: [Trait] // Racial traits that provide benefits to its members
}

struct Trait: Descriptable {
    let name: String
    let description: String
    let races: [Race]
    let subraces: [Subrace]
}
