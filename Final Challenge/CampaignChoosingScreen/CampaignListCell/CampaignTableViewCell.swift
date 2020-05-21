//
//  CampaignTableViewCell.swift
//  Final Challenge
//
//  Created by david florczak on 20/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class CampaignTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "CampaignTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CampaignTableViewCell", bundle: nil)
    }
    
    func configure(with characters: [Character], name: String, nextSessionDate: String, backgroundImageName: String) {
        
        self.campaginName.text = name
        self.nextSessionDate.text = nextSessionDate
        self.backgroundImage.image = UIImage(named: backgroundImageName)
        
        self.characters = characters
        characterCollectionView.reloadData()
    }
    
    @IBOutlet var characterCollectionView: UICollectionView!
    @IBOutlet var campaginName: UILabel!
    @IBOutlet var nextSessionDate: UILabel!
    @IBOutlet var backgroundImage: UIImageView!
    
    var characters = [Character]()

    override func awakeFromNib() {
        super.awakeFromNib()
        characterCollectionView.register(CharacterIconCollectionViewCell.nib(), forCellWithReuseIdentifier: CharacterIconCollectionViewCell.identifier)
        characterCollectionView.delegate = self
        characterCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
//: MARK - Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = characterCollectionView.dequeueReusableCell(withReuseIdentifier: CharacterIconCollectionViewCell.identifier, for: indexPath) as! CharacterIconCollectionViewCell
        
        cell.configure(with: characters[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 33, height: 33)
    }
    
    
}
