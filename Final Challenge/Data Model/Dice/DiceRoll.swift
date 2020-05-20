//
//  DiceRoll.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 20/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

// Encapsulates a result with its intermediate values.
struct DiceRoll: CustomStringConvertible {
    
    // The result of the roll.
    let result: Int
    
    // A string representing the intermediate values of the dice roll.
    // For example, a "3d6" might return "(4+1+5)".
    let description: String
    
    // Creates a roll with its accompanying description of intermediate values.
    init(_ result: Int, _ description: String) {
        self.result = result
        self.description = description
    }
    
}
