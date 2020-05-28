//
//  SkillsTableViewCell.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 27/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class SkillsTableViewCell: UITableViewCell {

    @IBOutlet weak var modifierButton: UIButton!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        actionButton.layer.cornerRadius = 10
        modifierButton.backgroundColor = .clear
        modifierButton.layer.cornerRadius = 8
        modifierButton.layer.borderWidth = 2
        modifierButton.layer.borderColor = UIColor.darkGray.withAlphaComponent(0.7).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0))
    }

}
