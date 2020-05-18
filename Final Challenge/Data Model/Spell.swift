//
//  Spell.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 15/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct Spell: Descriptable {
    let name: String
    let description: String
    let higherLevel: String?
    let level: Int // 0 to 9, 0 is for cantrips
    // …Attack, damage? or calculate it on hiegher levels?
    let range: String // "90 feet"
    let components: [String] // "V", "S", "M". Future enum
    let material: String // "Powdered rhubarb leaf and an adder's stomach."
    let isRitual: Bool
    let duration: String // "1 minute"
    let requiresConcentration: Bool
    let castingTime: String // "One action"
    let school: String // "Evocation"
    // … Classes, subclasses?
}
