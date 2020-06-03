//
//  logChatTableVIewCharacterCell.swift
//  Final Challenge
//
//  Created by david florczak on 24/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class ChatLogTableViewCharacterCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let test = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        test.backgroundColor = .red
//        test.superview.angle
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
