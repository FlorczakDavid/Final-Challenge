//
//  Equipment.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 15/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

protocol Equipment {
    var name: String { get set }
    var description: String? { get set }
    var category: ItemCategory { get set } // The category of equipment this falls into
    var cost: Cost? { get set } // The cost of the equipment
    var weight: Double { get set }// How much the equipment weighs
}

struct Item: Equipment {
    var name: String
    var description: String?
    var category: ItemCategory
    var cost: Cost?
    var weight: Double
}

struct Weapon: Equipment {
    var name: String
    var description: String?
    var category: ItemCategory
    var cost: Cost?
    var weight: Double
    
    var weaponCategory: String // The category of weapon this falls into
    var weaponRange: String // Whether this is a Melee or Ranged weapon
    var categoryRange: String // A combination of weapon_category and weapon_range
    var damage: Damage // Includes data on dice, bonus, and damage type
    var range: Range // Includes the normal and long range for a weapon, only pertains to Ranged weapons
    var properties: [String] // A list of the properties this weapon has, for example: "Light", "Monk"
    
    struct Range {
        var normal: Int
        var long: Int?
    }
}

struct Armor: Equipment {
    var name: String
    var description: String?
    var category: ItemCategory
    var cost: Cost?
    var weight: Double
    
    var armorCategory: String // The category of armor this falls into "Light"
    var armorClass: ArmorClass // Details on how to calculate armor class
    var minStrength: Int // Minimum STR required to use this armor
    var hasStealthDisatvantage: Bool // Whether the armor gives disadvantage for Stealth
}

struct Damage {
    var dice: String // "1d4"
    var bonus: Int // 0
    var type: String // "Bludgeoning"
}

struct ArmorClass {
    var base: Int
    var dexterityBonus: Bool
    var maxBonus: String? // what type?
}

enum ItemCategory {
    case weapon
    case armor
    case other
}

struct Cost {
    var quantity: Int
    var unit: MoneyUnits
}

enum MoneyUnits: String {
    case copper = "CP"
    case silver = "SP"
    case electum = "EP"
    case gold = "GP"
    case platinum = "PP"
}
