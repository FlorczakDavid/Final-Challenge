//
//  CharacterSelectionTableViewCell.swift
//  Final Challenge
//
//  Created by david florczak on 22/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class CharacterSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var levelupButton: UIButton!
    @IBOutlet weak var playerToken: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    static let identifier = "CharacterSelectionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CharacterSelectionTableViewCell", bundle: nil)
    }

    func configure(with character: Character) {
        
        if let chrToken = UIImage(named: character.avatar ?? "") {
            self.playerToken.image = chrToken
        } else {
            self.playerToken.image = UIImage(systemName: "person.circle")
        }
        
        self.playerNameLabel.text = character.name
    }
    
    @IBAction func levelingUp(_ sender: Any) {
        // comming soon
    }
    
}
