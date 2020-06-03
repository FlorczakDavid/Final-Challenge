//
//  FeaturesTableViewCell.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 03/06/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class FeaturesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
