//
//  Background.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 18/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct CharacterBackground: Descriptable {
    var name: String
    var description: String
    let startingProficiencies: [Proficiency] // Each background gives a character proficiency in two skills. In addition, most backgrounds give a character proficiency with one or more tools. If a character would gain the same proficiency from two different sources, he or she can choose a different proficiency of the same kind (skill or tool) instead.
    let startingLanguages: [Language]? // Some backgrounds also allow characters to learn additional languages beyond those given by race
    let startingEquipment: [Equipment]? // Each background provides a package of starting equipment. If you use the optional rule to spend coin on gear, you do not receive the starting equipment from your background.
    
    // A background contains suggested personal characteristics based on your background. You can pick characteristics, roll dice to determine them randomly, or use the suggestions as inspiration for characteristics of your own creation.
    let suggestedPersonalityTraits: [String]
    let suggestedIdeals: [String]
    let suggestedBonds: [String]
    let suggestedFlaws: [String]
}

