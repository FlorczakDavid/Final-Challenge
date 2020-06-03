//
//  SkillsTableViewCell.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 27/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class FeaturesTableViewCell: UITableViewCell {

    @IBOutlet weak var modifierButton: UIButton!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    let actionButtonColor = UIColor(red: 60 / 255,
                                    green: 66 / 255,
                                    blue: 73 / 255,
                                    alpha: 0.8)
        //UIColor.darkGray.withAlphaComponent(0.7)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        actionButton.layer.cornerRadius = 10
        actionButton.backgroundColor = actionButtonColor
        modifierButton.backgroundColor = .clear
        modifierButton.layer.cornerRadius = 8
        modifierButton.layer.borderWidth = 2
        modifierButton.layer.borderColor = actionButtonColor.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionButtonTouchUpInside(_ sender: UIButton) {
        sender.backgroundColor = actionButtonColor
    }
    
    @IBAction func actionButtonTouchDown(_ sender: UIButton) {
        sender.backgroundColor = .gray
    }
    
}
