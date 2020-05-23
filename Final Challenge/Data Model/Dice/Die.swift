//
//  Die.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 20/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

enum Die: Int, CaseIterable {
    case d2 = 2 // A coin. Just in case
    case d4 = 4
    case d6 = 6
    case d8 = 8
    case d10 = 10
    case d12 = 12
    case d20 = 20
    case d100 = 100
    
    // Rolls once and returns a number between 1 and this dice type.
    func roll<G: RandomNumberGenerator>(using generator: inout G) -> Int {
        return Int.random(in: 1...self.rawValue, using: &generator)
    }
    
    // Rolls once and returns a number between 1 and this dice type.
    func roll() -> Int {
        var rng = SystemRandomNumberGenerator()
        return roll(using: &rng)
    }
    
    // Rolls the specified number of times and returns an array of numbers between 1 and this dice type.
    func roll(_ times: Int) -> [Int] {
        var rolls = [Int](repeating: 0, count: times) // preallocating is much faster than appending
        
        for index in 0 ..< times {
            rolls[index] = roll()
        }
        return rolls
    }
    
}

// Returns the number of die sides with "d" prepended.
extension Die: CustomStringConvertible {
    var description: String {
        return "d\(rawValue)"
    }
    
}
