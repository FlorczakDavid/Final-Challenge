//
//  Spellcasting.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 15/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct Spellcasting {
    let ability: Ability // Comes from the chosen class
    let spellSaveDC: Int // Spell save DC = 8 + your proficiency bonus + your ability modifier.
    let spellAtackBonus: Int // Spell attack modifier = your proficiency bonus + your Charisma modifier.
}

struct SpellLevel {
    let level: Int // 0 to 9, 0 is for cantrips
    let spellSlots: VariableTrait? // nil for cantrips
}
