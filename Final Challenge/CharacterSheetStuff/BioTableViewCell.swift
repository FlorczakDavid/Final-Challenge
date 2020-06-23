//
//  BioTableViewCell.swift
//  Final Challenge
//
//  Created by david florczak on 05/06/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit


class BioTableViewCell: UITableViewCell {
    
    weak var delegate: BioTableViewCellDelegate?
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var bioPartNameLabel: UILabel!
    
    var bioDescription = UITextView()
    
    var isInfoDisplayed = false
    static let identifier = "BioTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "BioTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        
        bioPartNameLabel.clipsToBounds = true
        bioPartNameLabel.layer.cornerRadius = 10
        
        bioDescription.frame = CGRect(
            x: 50,
            y: bioPartNameLabel.frame.maxY,
            width: bioPartNameLabel.frame.width-50,
            height: 0
        )
        
        contentView.addSubview(bioDescription)
        
        bioDescription.clipsToBounds = true
        bioDescription.layer.cornerRadius = 10
        if #available(iOS 11.0, *) {
            bioDescription.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
        
//        let path = UIBezierPath(roundedRect: bioDescription.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 10, height: 10))
//
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//
//        bioDescription.layer.mask = mask
        
//        let description = UITextView(frame: CGRect(
//            x: 50,
//            y: self.infoButton.frame.maxY + self.infoButton.frame.height,
//            width: self.frame.width-100,
//            height: self.frame.height)
//        )
//        
//        description.backgroundColor = .red
//        self.addSubview(description)
        
        
        
        if #available(iOS 11.0, *) {
            bioPartNameLabel.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .largeTitle), size: 30)
        } else {
            bioPartNameLabel.font = UIFont(name: "SF Pro Text", size: 30)
        }
        
    }
    @IBAction func infoButtonTapped(_ sender: Any) {
        
        delegate?.didTapDetailButton(onCell: self)
        
//        isInfoDisplayed.toggle()
//
//        let image = isInfoDisplayed ? #imageLiteral(resourceName: "eye- opened info") : #imageLiteral(resourceName: "eye - info element")
//        infoButton.setImage(image, for: .normal)
//
//        let description = UITextView(frame: CGRect(
//            x: 50,
//            y: self.infoButton.frame.maxY + self.infoButton.frame.height,
//            width: self.frame.width-100,
//            height: self.frame.height)
//        )
//        description.backgroundColor = .red
//        self.addSubview(description)
    }
    
}

protocol BioTableViewCellDelegate: class {
    func didTapDetailButton(onCell: BioTableViewCell)
}
