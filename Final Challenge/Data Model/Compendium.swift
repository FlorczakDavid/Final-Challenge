//
//  Configuration.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 18/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

// This module serves for collecting all the data in one place, encoding the jsons. It's like a DnD compendium data base
// The names of json files should match the class names. For example: skill.json, race.json
struct Compendium {
    let abilities: [Ability]
    let skills: [Skill]
    let races: [Race]?
    let subraces: [Subrace]?
    let classes: [CharacterClass]?
    let subclasses: [Subclass]?
    let backgrounds: [CharacterBackground]?
    let equipment: [Equipment]?
    let languages: [Language]?
    let spells: [Spell]?
    let proficiencies: [Proficiency]?
    let levels: Levels?
}
