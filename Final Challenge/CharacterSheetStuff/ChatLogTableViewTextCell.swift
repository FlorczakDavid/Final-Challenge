//
//  logChatTableViewTextCell.swift
//  Final Challenge
//
//  Created by david florczak on 24/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class ChatLogTableViewTextCell: UITableViewCell {

    //roll + reason (str, save, skill)
    //attack roll + name + info + description? + damage roll
    //DC + check name(Dex save, Str savec, etc) + description? + damage roll + info
    //spell card
    //Name + subtitle info + description
    //roll declaration ("rolling 4d6") + individual rolls + sum
    
    
    //roling dice case
    let myView = UIView()
    let myBackgroundView = UIView()
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    static let identifier = "ChatLogTableViewTextCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ChatLogTableViewTextCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//
//        addSubview(myView)
//        myView.backgroundColor = #colorLiteral(red: 0.1531910002, green: 0.16773507, blue: 0.1819261312, alpha: 1)
//
//        myView.translatesAutoresizingMaskIntoConstraints = false
//
//        let constraints = [myView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
//        myView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//        myView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
//        myView.widthAnchor.constraint(equalToConstant: 250.0)]
//
//        myView.clipsToBounds = true
//        myView.layer.cornerRadius = 10
//
//        NSLayoutConstraint.activate(constraints)
        titleLable.numberOfLines = 0
        subTitleLabel.numberOfLines = 0
        self.sizeToFit()
        self.backgroundColor = .clear
    }
}
