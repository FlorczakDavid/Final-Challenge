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

class CharacterSheet {
    var abilityScores: [AbilityScore]
    var skills: [Score]
    var savingThrows: [Score]
    var proficiencies: [Descriptable]
    var languages: [Descriptable]
    var classTraits: [Descriptable]
    var features: [Descriptable]
    
    // Inventory
    var equipment: [InventoryItem]
    var money: [String: Int]
    var weight: VariableTrait
    
    // Spellcasting
    var spellcastingAbility: String
    var spellSaveDC: Int
    var spellAtackBonus: Int
    var spellList: SpellList?  // How to break the link?
    
    // Stand-alone
    var proficiencyBonus: Int
    var passiveWisdom: Int
    var armorClass: Int // If you are not wearing armor, then your AC is 10 plus your Dexterity Modifier.
    var initiative: Int // Initiative is your ability to act quickly in the face of danger. When you roll for Initiative, you roll a d20 and add your initiative modifier. Your dexterity modifier is also your initiative modifier.
    var speed: Int
    
    // Variable traits
    var hasInspiration: Bool
    var hitPoints: HitPoints // You gain the hit points from your new class as described for levels after 1st. You gain the 1st-level hit points for a class only when you are a 1st-level character.
    var hitDice: VariableTrait
    var hitDie: Dice // The hit die of the class.
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
        for unit in MoneyUnits.allCases {
            self.money[unit.rawValue] = 0
        }
        self.weight = VariableTrait()
        self.spellcastingAbility = ""
        self.spellSaveDC = 0
        self.spellAtackBonus = 0
        self.spellList = nil
        self.proficiencyBonus = 0
        self.passiveWisdom = 0
        self.armorClass = 0
        self.initiative = 0
        self.speed = 0
        self.hasInspiration = false
        self.hitPoints = HitPoints(value: 0, maximum: 0, temporary: nil)
        self.hitDice = VariableTrait()
        self.hitDie = Dice(.d6)
        self.deathSaves = DeathSaves()
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
}

// Santa's little helpers
extension CharacterSheet {
    
    // Adding an equipment to the inventory using proper data fields
    func addCompendiumEquipment(equipment: Equipment, quantity: Int = 1) {
        var inventoryItem = InventoryItem(name: equipment.name)
        inventoryItem.description = equipment.description ?? ""
        inventoryItem.quantity = quantity
        inventoryItem.weight = equipment.weight
        inventoryItem.category = .other
        
        if equipment is Weapon {
            let abilityName = (equipment as! Weapon).weaponRange == "Melee" ? "Strength" : "Dexterity"
            inventoryItem.category = .weapon
            inventoryItem.attack = Attack(
                damageType: (equipment as! Weapon).damage.type,
                damage: (equipment as! Weapon).damage.dice,
                extraDamage: (equipment as! Weapon).damage.bonus,
                ability: abilityScores.itemByName(abilityName)!,
                proficiencyBonus: self.proficiencyBonus)
            inventoryItem.properties += (equipment as! Weapon).properties.joined(separator: ", ")
        } else if equipment is Armor {
            inventoryItem.category = .armor
            inventoryItem.armor = Defence(
                armorCategory: (equipment as! Armor).armorCategory,
                armorClass: (equipment as! Armor).armorClass)
            
        }
        inventoryItem.properties = equipment.cost?.description ?? ""
        
        self.equipment.append(inventoryItem)
    }
    
    // Adding a spell to the CS
    func addCompendiumSpell(spell: Spell) {
        let spellLevel = spell.level
        if var sl = self.spellList {
            sl.spells[spellLevel].append(spell)
        }
    }
    
    // Updates saving throws according to existing ability scores
//    func updateSavingThrows() {
//        self.savingThrows = []
//        for ability in abilityScores {
//            let newSavingThrow = Score(name: ability.name, modifier: ability.modifier, isProficient: false, connectedAbility: ability)
//            self.savingThrows.append(newSavingThrow)
//        }
//    }
}

extension Array where Element: Descriptable {
    // Returns the first found item by name. Otherwise returns nil
    func itemByName(_ name: String) -> Element? {
        return self.filter({ $0.name == name })[0]
    }
}

struct DummyDescriptable: Descriptable {
    var name: String = ""
    var description: String = ""
}

class AbilityScore: Descriptable, Rollable {
    var name: String
    var shortName: String
    var description: String
    var value: Int
    var modifier: Int
    
    init(name: String, shortName: String = "", description: String = "", value: Int = 0, modifier: Int = 0) {
        self.name = name
        self.description = description
        self.value = value
        self.modifier = modifier
        
        if shortName == "" {
            self.shortName = name.prefix(3).uppercased()
        } else {
            self.shortName = shortName
        }
    }
    
    func roll() -> DiceRoll {
        return Dice(.d20, modifier: modifier).roll()
    }
}

class Score: Descriptable, Rollable {
    var name: String
    var description: String
    var modifier: Int {
        // TBD: How to get the proficiency bonus from CS?
        connectedAbility.modifier + (isProficient ? proficiencyBonus() : 0)
    }
    var proficiencyBonus: () -> Int // You gotta assign a closure of how to get the character sheet's proficiency bonus
    var isProficient: Bool
    var connectedAbility: AbilityScore
    
    init(name: String, description: String = "", isProficient: Bool, connectedAbility: AbilityScore) {
        self.name = name
        self.description = description
        //self.modifier = modifier
        self.isProficient = isProficient
        self.connectedAbility = connectedAbility
        self.proficiencyBonus = { return 0 }
    }
    
    func roll() -> DiceRoll {
        return Dice(.d20, modifier: modifier).roll()
    }
}

struct VariableTrait: Variable {
    var value: Int = 0
    var maximum: Int = 0
}

struct Attack {
    var damageType: String // "Bludgeoning", "Acid"
    var damage: Dice // "2d6"
    var extraDamage: Int = 0 // For example sneak attack — an extra die
    
    var ability: AbilityScore // Link to the ability: STR or DEX
    var proficiencyBonus: Int // How to make it a link to the character sheet's proficiency modifier???
    var attackModifier: Int {
        self.ability.modifier + self.proficiencyBonus
    }
    
    func attackRoll() -> DiceRoll {
        // The ability modifier used for a melee weapon attack is Strength, and the ability modifier used for a ranged weapon attack is Dexterity. Weapons that have the finesse or thrown property break this rule. For weapons with Finesse You may use either strength or dexterity, whichever you prefer.
        // Some spells also require an attack roll. The ability modifier used for a spell attack depends on the spellcasting ability of the spellcaster,
        // Proficiency Bonus. You add your proficiency bonus to your attack roll when you attack using a weapon with which you have proficiency, as well as when you attack with a spell.
        // If the total of the roll plus modifiers equals or exceeds the target's Armor Class (AC), the attack hits.
        
        // If the d20 roll for an attack is a 20, the attack hits regardless of any modifiers or the target's AC. In addition, the attack is a critical hit
        // If the d20 roll for an attack is a 1, the attack misses regardless of any modifiers or the target's AC.
        return Dice(.d20, modifier: ability.modifier + proficiencyBonus).roll()
    }
    
    mutating func damageRoll() -> DiceRoll {
        // When attacking with a weapon, you add your ability modifier—the same modifier used for the attack roll to the damage. A spell tells you which dice to roll for damage and whether to add any modifiers.
        // When you score a critical hit, you get to roll extra dice for the attack's damage against the target. Roll all of the attack's damage dice twice and add them together. Then add any relevant modifiers as normal. To speed up play, you can roll all the damage dice at once.
        // Extra damage - is a dice for different features like sneak attacks
        return Dice(damage.die, times: damage.times, modifier: damage.modifier + ability.modifier + extraDamage).roll()
    }
}

struct Defence {
    var armorCategory: ArmorCategory // light, medium, heavy, shield
    var armorClass: ArmorClass
}

struct InventoryItem: Descriptable {
    var name: String
    var description: String = ""
    var quantity: Int = 1
    var weight: Double = 0
    var properties: String = ""
    var category: EquipmentCategory = .other
    var equipped: Bool = false // Mostly for tracking if a shield or an armor is equipped and gives you AC
    var attack: Attack?
    var armor: Defence?
}

struct HitPoints: Variable {
    var value: Int
    var maximum: Int
    var temporary: Int?
}

struct DeathSaves {
    var successes: VariableTrait = VariableTrait(value: 0, maximum: 3)
    var failures: VariableTrait = VariableTrait(value: 0, maximum: 3)
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
    var spells = [[Spell]](repeating: [], count: 10)
    // Index is for level
    // Make a subscript?
    
    var spellSlots: [VariableTrait]
    // Index — level number (0 - cantrips, 1 - first level etc), value — number of slots available (2 out of 3)
    // For example spellSlots[1] = VariableTrait(value: 2, maximum: 3)
}

struct Characteristics {
    var personalityTraits: String
    var ideals: String
    var bonds: String
    var flaws: String
}
