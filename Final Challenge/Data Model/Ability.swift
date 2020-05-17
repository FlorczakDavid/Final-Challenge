//
//  Ability.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 17/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct AbilityBonus {
    let ability: Ability
    let bonus: Int
}

struct Ability: Hashable, Descriptable {
    var name: String
    var description: String
    var shortName: String
}
