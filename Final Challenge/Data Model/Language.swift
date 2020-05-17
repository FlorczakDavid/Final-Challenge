//
//  Language.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 15/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation

struct Language: Descriptable {
    var name: String
    var description: String
    var isExotic: Bool
    var typicalSpeakers: [String]? // Races that tend to speak this language
    var script: String? // The script used for writing in this language
}
