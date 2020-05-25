//
//  Character.swift
//  CharacterSheet
//
//  Created by Денис Матвеев on 14/05/2020.
//  Copyright © 2020 Denis Matveev. All rights reserved.
//

import Foundation

struct Character {
    var avatar: String?
    var name: String
    var race: Descriptable
    var classes: [Descriptable]
    var levels: [Int]
    var sheet: CharacterSheet
}
