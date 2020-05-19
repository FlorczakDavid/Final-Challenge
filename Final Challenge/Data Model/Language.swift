//
//  Language.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 15/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct Language: Descriptable {
    let name: String
    var description: String {
        // Hand-made language description
        get {
            let stringTypicalSpeakers = "Typical speakers: \(typicalSpeakers). "
            let stringScript = (script != nil) ? "The script used for writing in this language: \(String(describing: script)). " : ""
            let stringExotic = isExotic ? "It is an exotic language." : ""
            return stringTypicalSpeakers + stringScript + stringExotic
        }
    }
    let isExotic: Bool
    let typicalSpeakers: [String] // Races that tend to speak this language
    let script: String? // The script used for writing in this language
}
