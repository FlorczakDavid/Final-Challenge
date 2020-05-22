//
//  CharacterSelectionAddCharacterTableViewCell.swift
//  Final Challenge
//
//  Created by david florczak on 22/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class CharacterSelectionAddCharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var addCharacterButton: UIImageView!
    
    static let identifier = "CharacterSelectionAddCharacterTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CharacterSelectionAddCharacterTableViewCell", bundle: nil)
    }
    
}
