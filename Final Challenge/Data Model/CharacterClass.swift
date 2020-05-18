//
//  CharacterClass.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 15/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct CharacterClass: Descriptable {
    let name: String
    let description: String
    let hitDie: Int // The hit die of the class. (ex: 12 == 1d12)
    let proficiencyChoices: [Descriptable] // Starting proficiencies where the player must choose a certain number from the given list of proficiencies. Could be skill proficiency as well, so it is descriptable
    let proficiencyChoose: Int // Certain number from the given list of proficiencies the player must choose
    let proficiencies: [Proficiency] // Starting proficiencies all new characters of this class start with.
    let savingThrows: [Skill] // Saving throws that the class is proficient in
    let startingEquipment: [Equipment] // An object with the possible choices of equipment for new characters of this class.
    let startingEquipmentQuantities: [Int]
    let classLevels: [String: String] // All possible levels that this class can obtain (excluding subclass-specific features)
    let subclasses: [Subclass] // All possible subclasses that this class can specialize in.
    let spellcasting: Spellcasting // The reference object for the class's spellcasting. Contains information such as spells known, spellcasting ability, and cantrips known.
}

struct Subclass {
    // TBD
}
