//
//  CharacterIconCollectionViewCell.swift
//  Final Challenge
//
//  Created by david florczak on 20/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class CharacterIconCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "CharacterIconCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CharacterIconCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with character: Character) {
        self.imageView.image = UIImage(named: character.avatar ?? "placeholderImage")
        
    }

}
