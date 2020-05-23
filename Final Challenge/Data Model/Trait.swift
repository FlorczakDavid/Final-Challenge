//
//  Trait.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 22/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct Trait: Descriptable {
    let name: String
    let description: String
    let races: [Race]
    let subraces: [Subrace]
}
