//
//  Skill.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 17/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct Skill: Descriptable {
    var name: String
    var description: String
    var bonus: Int
    var hasProficiency: Bool
    var associatedAbility: Ability
}
