//
//  Alignment.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 15/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct Alignment {
    let ethics: Ethics
    let morals: Morals
    
    var full: String {
        ethics.rawValue + " " + morals.rawValue
    }
}

enum Ethics: String {
    case lawful = "Lawful"
    case neutral = "Neutral"
    case chaotic = "Chaotic"
}

enum Morals: String {
    case good = "Good"
    case neutral = "Neutral"
    case evil = "Evil"
}
