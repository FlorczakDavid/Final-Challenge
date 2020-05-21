//
//  Dice.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 15/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct Dice: Rollable {
    let die: Die
    let times: Int
    let modifier: Int
    
    init(_ die: Die, times: Int = 1, modifier: Int = 0) {
        self.die = die
        self.times = times
        self.modifier = modifier
    }
    
    // Rolls with all times and modifiers and returns the sum and the description of rolls
    func roll() -> DiceRoll {
        let lastRoll: [Int] = roll()
        let result = lastRoll.reduce(0, +) + modifier
        let description = rollDescription(lastRoll)
        
        return DiceRoll(result, description)
    }
    
    // Rolls with all times and modifiers and returns the sum of rolls
    func roll() -> Int {
        let lastRoll: [Int] = roll()
        
        return lastRoll.reduce(0, +) + modifier
    }
    
    // Rolls N times and returns an array of dice rolled
    func roll() -> [Int] {
        return die.roll(times)
    }
    
    // Returns the last roll as a sequence of added numbers in parenthesis.
    internal func rollDescription(_ lastRoll: [Int]) -> String {
        var resultString: String
        
        var rolls = lastRoll
        let last = rolls.popLast()!
        if rolls.count == 0 {
            resultString = "\(last)"
        } else {
            resultString = "("
            for roll in rolls {
                resultString += "\(roll) + "
            }
            resultString += "\(last))"
        }
        
        return resultString
    }
}
