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

struct Campaign {
    var name: String
    var cover: String? // URL? UIImage?
    var characters: [Character]
    // Add date and frequency
}

struct Character {
    var avatar: String?
    var name: String
    var race: Race
    var classes: [CharacterClass]
    var levels: [Int]
    var sheet: CharacterSheet
}

protocol Descriptable {
    var name: String { get set }
    var description: String { get set }
}

struct Race: Descriptable {
    var name: String
    var description: String
}

struct CharacterClass: Descriptable {
    var name: String
    var description: String
}

protocol Variable {
    var value: Int { get set }
    var maximum: Int { get set }
}

struct CharacterSheet {
    var abilityScores: AbilityScores
    var skills: [Skill]
    var savingThrows: [Skill]
    var proficiencies: [Proficiency]
    var languages: [Language]
    var classTraits: [Trait]
    var features: [Trait]
    
    // Inventory
    var equipment: [Item]
    var money: Money
    var weight: VariableTrait
    
    // Spellcasting
    var spellcasting: Spellcasting? // Grouped everything in one struct
    
    // Stand-alone
    var proficiencyBonus: Int // Depends on level and class?
    var passiveWisdom: Int // How to calculate?
    var armorClass: Int
    var initiative: Int
    var speed: Int
    
    
    // Variable traits
    var hasInspiration: Bool
    var hitPoints: HitPoints
    var hitDice: VariableTrait
    var deathSaves: DeathSaves
    var experiencePoints: Int
    var customVariableTraits: [VariableTrait]
    
    // Personal
    var alignment: String // Enum?
    var background: String
    var bio: Bio
    // Group these four?
    var personalityTraits: String
    var ideals: String
    var bonds: String
    var flaws: String
}

struct Trait: Descriptable {
    var name: String
    var description: String
}


struct AbilityScores {
    var scores: [Ability: Int]
    var modifiers: [Ability: Int]
}

struct Ability: Hashable, Descriptable {
    var name: String
    var description: String
    var shortName: String
}

struct Skill: Descriptable {
    var name: String
    var description: String
    var bonus: Int
    var hasProficiency: Bool
    var associatedAbility: Ability
}

struct Proficiency: Descriptable {
    var name: String
    var description: String
    var type: ItemType // The general category of the proficiency: Weapon, Armor, Other
}

struct Language: Descriptable {
    var name: String
    var description: String
    var isExotic: Bool
    var typicalSpeakers: [String]? // Races that tend to speak this language
    var script: String? // The script used for writing in this language
}

struct HitPoints: Variable {
    var value: Int
    var maximum: Int
    var temporary: Int?
}

struct VariableTrait: Variable {
    var value: Int
    var maximum: Int
}

struct DeathSaves {
    var successes: VariableTrait
    var failures: VariableTrait
}

struct Item {
    var name: String
    var description: String?
    var type: ItemType
    var attack: String? // Need to clarify
}

enum ItemType {
    case weapon
    case armor
    case other
}

struct Money {
    
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
    var size: String // Enum?
    var height: Int
    var weight: Int
    var eyes: String
    var skin: String
    var hair: String
}

struct Spellcasting {
    var ability: Ability // How to define?
    var spellSaveDC: Int // How to define?
    var spellAtackBonus: Int // How to define?
    var spells: SpellList
}

struct SpellList {
    var spells: [Spell] // Make a subscript!
    var levels: [SpellLevel]
}

struct Spell: Descriptable {
    var name: String
    var description: String
    var higherLevel: String?
    var level: Int // 0 to 9, 0 is for cantrips
    // …Attack, damage?
    var range: String // "90 feet"
    var components: [String] // "V", "S", "M". Future enum
    var material: String // "Powdered rhubarb leaf and an adder's stomach."
    var isRitual: Bool
    var duration: String // "1 minute"
    var requiresConcentration: Bool
    var castingTime: String // "One action"
    var school: String // "Evocation"
    // … Classes, subclasses?
}

struct SpellLevel {
    var level: Int // 0 to 9, 0 is for cantrips
    var spellSlots: VariableTrait? // nil for cantrips
}
