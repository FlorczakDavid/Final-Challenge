//
//  Configuration.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 18/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

// This module serves for collecting all the data in one place, encoding the jsons. It's like a DnD compendium data base
// The names of json files should match the class names. For example: skill.json, race.json
struct Compendium {
    var abilities: [Ability]?
    var skills: [Skill]?
    var races: [Race]?
    var subraces: [Subrace]?
    var classes: [CharacterClass]?
    var subclasses: [Subclass]?
    var backgrounds: [CharacterBackground]?
    var equipment: [Equipment]?
    var languages: [Language]?
    var spells: [Spell]?
    var proficiencies: [Proficiency]?
    var levels: Levels?

    // JSON files should have the same name as the section
    //i.e abilities -> abilities.json
    init() {
        self.abilities = load("abilities.json")
        self.skills = load("skills.json")
    }
    
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
