//
//  ViewController.swift
//  Final Challenge
//
//  Created by david florczak on 11/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit
import CoreData

class CampaignListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var campaigns = [Campaign]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        campaigns.append(Campaign(name: "The Amazing Campaign", cover: "cellBackground.blue", characters: [Character(characterClass: nil, race: nil, subrace: nil, abilities: nil, name: "Robert", level: 1, avatar: "image-1"),Character(characterClass: nil, race: nil, subrace: nil, abilities: nil, name: "Roberta", level: 1, avatar: "image-2"),Character(characterClass: nil, race: nil, subrace: nil, abilities: nil, name: "Roberto", level: 1, avatar: "image-3"),Character(characterClass: nil, race: nil, subrace: nil, abilities: nil, name: "Robertino", level: 1, avatar: "image-4"),]))
//        campaigns.append(Campaign(name: "The Amazing Campaign", cover: "cellBackground.blue", characters: [Character(characterClass: nil, race: nil, subrace: nil, abilities: nil, name: "Robert", level: 1, avatar: "image-1"),Character(characterClass: nil, race: nil, subrace: nil, abilities: nil, name: "Roberta", level: 1, avatar: "image-3"),Character(characterClass: nil, race: nil, subrace: nil, abilities: nil, name: "Roberto", level: 1, avatar: "image-3"),Character(characterClass: nil, race: nil, subrace: nil, abilities: nil, name: "Robertino", level: 1, avatar: "image-2"),]))
//        campaigns.append(Campaign(name: "The Amazing Campaign", cover: "cellBackground.blue", characters: [Character(characterClass: nil, race: nil, subrace: nil, abilities: nil, name: "Robert", level: 1, avatar: "image-1"),Character(characterClass: nil, race: nil, subrace: nil, abilities: nil, name: "Roberta", level: 1, avatar: "image-1"),Character(characterClass: nil, race: nil, subrace: nil, abilities: nil, name: "Roberto", level: 1, avatar: "image-1"),Character(characterClass: nil, race: nil, subrace: nil, abilities: nil, name: "Robertino", level: 1, avatar: "image-1"),]))
        
        table.register(CampaignTableViewCell.nib(), forCellReuseIdentifier: CampaignTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
    
    //Mark: Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campaigns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CampaignTableViewCell.identifier, for: indexPath) as! CampaignTableViewCell
        
        cell.configure(with: campaigns[indexPath.row].characters, name: campaigns[indexPath.row].name, nextSessionDate: "next session here", backgroundImageName: campaigns[indexPath.row].cover!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126.0
    }
}



