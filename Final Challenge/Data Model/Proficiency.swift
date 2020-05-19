//
//  Proficiency.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 18/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct Proficiency: Descriptable {
    let name: String
    let description: String
    let category: EquipmentCategory // The general category of the proficiency: Weapon, Armor, Other
    //let classes: [CharacterClass] // Classes that start with this proficiency.
    //let races: [Race] // Races that start with this proficiency.
}
