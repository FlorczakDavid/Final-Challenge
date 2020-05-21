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

// If it has a check roll: ability check, saving throw, attack roll
protocol Rollable {
    func roll() -> DiceRoll
}

// If it has a damage roll
protocol HasAttack {
    func damage() -> DiceRoll
}

struct CharacterSheet {
    var abilityScores: [Score]
    var skills: [Score]
    var savingThrows: [Score]
    var proficiencies: [Descriptable]
    var languages: [Descriptable]
    var classTraits: [Descriptable]
    var features: [Descriptable]
    
    // Inventory
    var equipment: [Equipment] // How to break the link?
    var money: [String: Int]
    var weight: VariableTrait
    
    // Spellcasting
    var spellcastingAbility: String
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
    
    init() {
        // Returns a blank character sheet
        self.abilityScores = []
        self.skills = []
        self.savingThrows = []
        self.proficiencies = []
        self.languages = []
        self.classTraits = []
        self.features = []
        self.equipment = []
        self.money = [:]
        self.weight = VariableTrait()
        self.spellcastingAbility = ""
        self.spellSaveDC = 0
        self.spellAtackBonus = 0
        self.spells = nil
        self.proficiencyBonus = 0
        self.passiveWisdom = 0
        self.armorClass = 0
        self.initiative = 0
        self.speed = 0
        self.hasInspiration = false
        self.hitPoints = HitPoints(value: 0, maximum: 0, temporary: nil)
        self.hitDice = VariableTrait()
        self.deathSaves = DeathSaves(successes: VariableTrait(), failures: VariableTrait())
        self.experiencePoints = 0
        self.customVariableTraits = []
        self.alignment = ""
        self.background = DummyDescriptable()
        self.bio = Bio(appearance: Appearance(age: 0, size: "", height: 0, weight: 0, eyes: "", skin: "", hair: ""),
                       characterAppearanceDescription: "",
                       alliesOrganizations: "",
                       backstory: "",
                       additionalFeaturesTraits: "",
                       treasure: "")
        self.characteristics = Characteristics(personalityTraits: "", ideals: "", bonds: "", flaws: "")
    }
    
    // Updates saving throws according to existing ability scores
    mutating func updateSavingThrows() {
        self.savingThrows = []
        for ability in abilityScores {
            let newSavingThrow = Score(name: ability.name, modifier: ability.modifier, hasProficiency: false)
            self.savingThrows.append(newSavingThrow)
        }
    }
}

struct DummyDescriptable: Descriptable {
    var name: String = ""
    var description: String = ""
}

class Score: Descriptable, Rollable {
    var name: String
    var description: String
    var value: Int
    var modifier: Int
    var hasProficiency: Bool?
    
    init(name: String, description: String = "", value: Int = 0, modifier: Int = 0, hasProficiency: Bool?) {
        self.name = name
        self.description = description
        self.value = value
        self.modifier = modifier
        self.hasProficiency = hasProficiency
    }
    
    func roll() -> DiceRoll {
        return Dice(.d20, modifier: modifier).roll()
    }
}

struct VariableTrait: Variable {
    var value: Int = 0
    var maximum: Int = 0
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
