//
//  CharacterSheet.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 15/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

protocol Descriptable {
    var name: String { get }
    var description: String { get }
}

protocol Variable {
    var value: Int { get set }
    var maximum: Int { get set }
}

struct CharacterSheet {
    var abilityScores: Scores
    var skills: Scores
    var savingThrows: Scores
    var proficiencies: [Descriptable]
    var languages: [Descriptable]
    var classTraits: [Descriptable]
    var features: [Descriptable]
    
    // Inventory
    var equipment: [Equipment] // How to break the link?
    var money: [String: Int]
    var weight: VariableTrait
    
    // Spellcasting
    var ability: String
    var spellSaveDC: Int
    var spellAtackBonus: Int
    var spells: SpellList?  // How to break the link?
    
    // Stand-alone
    var proficiencyBonus: Int
    var passiveWisdom: Int
    var armorClass: Int
    var initiative: Int
    var speed: Int
    
    // Variable traits
    var hasInspiration: Bool
    var hitPoints: HitPoints // You gain the hit points from your new class as described for levels after 1st. You gain the 1st-level hit points for a class only when you are a 1st-level character.
    var hitDice: VariableTrait
    var deathSaves: DeathSaves
    var experiencePoints: Int
    var customVariableTraits: [VariableTrait]
    
    // Personal
    var alignment: String
    var background: Descriptable
    var bio: Bio
    var characteristics: Characteristics
}

struct Scores {
    var scores: [String: Int]
    var modifiers: [String: Int]
    var proficiencies: [String: Int]?
}

struct VariableTrait: Variable {
    var value: Int
    var maximum: Int
}

struct HitPoints: Variable {
    var value: Int
    var maximum: Int
    var temporary: Int?
}

struct DeathSaves {
    var successes: VariableTrait
    var failures: VariableTrait
}

struct Bio {
    var appearance: Appearance
    var characterAppearanceDescription: String
    var alliesOrganizations: String
    var backstory: String
    var additionalFeaturesTraits: String
    var treasure: String
}

struct Appearance {
    var age: Int
    var size: String
    var height: Int
    var weight: Int
    var eyes: String
    var skin: String
    var hair: String
}

struct SpellList {
    var spells: [[Spell]] // Make a subscript?
    var spellSlots: [VariableTrait] // Index — level number (0 - cantrips), value — number of slots
}

struct Characteristics {
    var personalityTraits: String
    var ideals: String
    var bonds: String
    var flaws: String
}
