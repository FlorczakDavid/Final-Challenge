//
//  Spell.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 15/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct Spell: Descriptable {
    var name: String
    var description: String
    var higherLevel: String?
    var level: Int // 0 to 9, 0 is for cantrips
    // …Attack, damage? or calculate it on hiegher levels?
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
