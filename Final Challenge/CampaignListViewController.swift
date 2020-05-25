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
    var campaignToSend: Campaign!
    var compendium = Compendium()
    var sample = Sample()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campaigns.append(Campaign(name: "Deni's Quest",
        cover: "cellBackground.blue",
        characters: [Character(avatar: "Image-2",
                               name: "Denis Super Tester",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: sample.denis.characterSheet),
                     Character(avatar: "Image-1",
                               name: "Denis",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: CharacterSheet()),
                     Character(avatar: "Image-4",
                               name: "Denis",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: CharacterSheet()),
                     Character(avatar: "Image",
                               name: "Denis",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: CharacterSheet())]))
        campaigns.append(Campaign(name: "David's Quest",
        cover: "cellBackground.blue",
        characters: [Character(avatar: "Image-4",
                               name: "Denis",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: CharacterSheet()),
                     Character(avatar: "Image",
                               name: "Denis",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: CharacterSheet()),
                     Character(avatar: "Image",
                               name: "Denis",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: CharacterSheet()),
                     Character(avatar: "Image-1",
                               name: "Denis",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: CharacterSheet())]))
        campaigns.append(Campaign(name: "Robi's Quest",
        cover: "cellBackground.blue",
        characters: [Character(avatar: "Image-1",
                               name: "Denis",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: CharacterSheet()),
                     Character(avatar: "Image-1",
                               name: "Denis",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: CharacterSheet()),
                     Character(avatar: "Image-1",
                               name: "Denis",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: CharacterSheet()),
                     Character(avatar: "Image-1",
                               name: "Denis",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: CharacterSheet()),
                               Character(avatar: "Image-1",
                                         name: "Denis",
                                         race: DummyDescriptable(name: "Superior Human", description: ""),
                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                                         levels: [99],
                                         sheet: CharacterSheet()),
                               Character(avatar: "Image-1",
                                         name: "Denis",
                                         race: DummyDescriptable(name: "Superior Human", description: ""),
                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                                         levels: [99],
                                         sheet: CharacterSheet()),
                               Character(avatar: "Image-1",
                                         name: "Denis",
                                         race: DummyDescriptable(name: "Superior Human", description: ""),
                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                                         levels: [99],
                                         sheet: CharacterSheet()),
                               Character(avatar: "Image-1",
                                         name: "Denis",
                                         race: DummyDescriptable(name: "Superior Human", description: ""),
                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                                         levels: [99],
                                         sheet: CharacterSheet()),
                               Character(avatar: "Image-1",
                                         name: "Denis",
                                         race: DummyDescriptable(name: "Superior Human", description: ""),
                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                                         levels: [99],
                                         sheet: CharacterSheet()),
                               Character(avatar: "Image-1",
                                         name: "Denis",
                                         race: DummyDescriptable(name: "Superior Human", description: ""),
                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                                         levels: [99],
                                         sheet: CharacterSheet()),
                               Character(avatar: "Image-1",
                                         name: "Denis",
                                         race: DummyDescriptable(name: "Superior Human", description: ""),
                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                                         levels: [99],
                                         sheet: CharacterSheet()),
                               Character(avatar: "Image-1",
                                         name: "Denis",
                                         race: DummyDescriptable(name: "Superior Human", description: ""),
                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                                         levels: [99],
                                         sheet: CharacterSheet())]))
        

        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        campaignToSend = campaigns[indexPath.row]
        performSegue(withIdentifier: "fromCampaignListToDetails", sender: self)
        // need to add an if here for the campaign creation case which will change the identifier
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromCampaignListToDetails" {
            let destinationViewController = segue.destination as! CampaignDetailView
            destinationViewController.receivedCampagn = campaignToSend
        }
    }
}



