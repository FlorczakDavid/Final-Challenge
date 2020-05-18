//
//  Experience.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 18/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct Levels {
    let experiencePoints: [Int] // Index — level (starting from 1st), value — exp to reach. For example: 1st-0exp, 2nd-300exp,…
    let proficiencyBonus: [Int] // Index — level (starting from 1st), value — bonus. For example: 1st-+2, 5th-+3,…
}
