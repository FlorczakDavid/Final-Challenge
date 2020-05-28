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
    
    let screen = UIScreen.main.bounds
    
    var campaigns = [Campaign]()
    var campaignToSend: Campaign!
    var compendium = Compendium()
    var sample = Sample()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campaigns.append(Campaign(name: "The campain with a very long name that we happen to use for testing purposes",
        cover: "wall-3",
        characters: [Character(avatar: "Image-2",
                               name: "Denis",
                               race: DummyDescriptable(name: "Wizard Abjuration", description: ""),
                               classes: [DummyDescriptable(name: "Half-Elf", description: "Has a blue backpack")],
                               levels: [5],
                               sheet: sample.denis.characterSheet),
                     Character(avatar: "Image-1",
                               name: "Roberta",
                               race: DummyDescriptable(name: "Elf - Drow", description: ""),
                               classes: [DummyDescriptable(name: "Sorcerer - Black Draconic", description: "")],
                               levels: [10],
                               sheet: sample.roberta.characterSheet),
                     Character(avatar: "Image-4",
                               name: "Andrea",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: sample.andrea.characterSheet),
                     Character(avatar: "Image",
                               name: "David",
                               race: DummyDescriptable(name: "Superior Human", description: ""),
                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
                               levels: [99],
                               sheet: sample.david.characterSheet)]))
        campaigns.append(Campaign(name: "David's Quest",
        cover: "wall-1",
        characters: [
//            Character(avatar: "Image-4",
//                               name: "Denis",
//                               race: DummyDescriptable(name: "Superior Human", description: ""),
//                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                               levels: [99],
//                               sheet: CharacterSheet()),
//                     Character(avatar: "Image",
//                               name: "Denis",
//                               race: DummyDescriptable(name: "Superior Human", description: ""),
//                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                               levels: [99],
//                               sheet: CharacterSheet()),
//                     Character(avatar: "Image",
//                               name: "Denis",
//                               race: DummyDescriptable(name: "Superior Human", description: ""),
//                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                               levels: [99],
//                               sheet: CharacterSheet()),
//                     Character(avatar: "Image-1",
//                               name: "Denis",
//                               race: DummyDescriptable(name: "Superior Human", description: ""),
//                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                               levels: [99],
//                               sheet: CharacterSheet())
        ]))
//        campaigns.append(Campaign(name: "Robi's Quest",
//        cover: "wall-2",
//        characters: [Character(avatar: "Image-1",
//                               name: "Denis",
//                               race: DummyDescriptable(name: "Superior Human", description: ""),
//                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                               levels: [99],
//                               sheet: CharacterSheet()),
//                     Character(avatar: "Image-1",
//                               name: "Denis",
//                               race: DummyDescriptable(name: "Superior Human", description: ""),
//                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                               levels: [99],
//                               sheet: CharacterSheet()),
//                     Character(avatar: "Image-1",
//                               name: "Denis",
//                               race: DummyDescriptable(name: "Superior Human", description: ""),
//                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                               levels: [99],
//                               sheet: CharacterSheet()),
//                     Character(avatar: "Image-1",
//                               name: "Denis",
//                               race: DummyDescriptable(name: "Superior Human", description: ""),
//                               classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                               levels: [99],
//                               sheet: CharacterSheet()),
//                               Character(avatar: "Image-1",
//                                         name: "Denis",
//                                         race: DummyDescriptable(name: "Superior Human", description: ""),
//                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                                         levels: [99],
//                                         sheet: CharacterSheet()),
//                               Character(avatar: "Image-1",
//                                         name: "Denis",
//                                         race: DummyDescriptable(name: "Superior Human", description: ""),
//                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                                         levels: [99],
//                                         sheet: CharacterSheet()),
//                               Character(avatar: "Image-1",
//                                         name: "Denis",
//                                         race: DummyDescriptable(name: "Superior Human", description: ""),
//                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                                         levels: [99],
//                                         sheet: CharacterSheet()),
//                               Character(avatar: "Image-1",
//                                         name: "Denis",
//                                         race: DummyDescriptable(name: "Superior Human", description: ""),
//                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                                         levels: [99],
//                                         sheet: CharacterSheet()),
//                               Character(avatar: "Image-1",
//                                         name: "Denis",
//                                         race: DummyDescriptable(name: "Superior Human", description: ""),
//                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                                         levels: [99],
//                                         sheet: CharacterSheet()),
//                               Character(avatar: "Image-1",
//                                         name: "Denis",
//                                         race: DummyDescriptable(name: "Superior Human", description: ""),
//                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                                         levels: [99],
//                                         sheet: CharacterSheet()),
//                               Character(avatar: "Image-1",
//                                         name: "Denis",
//                                         race: DummyDescriptable(name: "Superior Human", description: ""),
//                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                                         levels: [99],
//                                         sheet: CharacterSheet()),
//                               Character(avatar: "Image-1",
//                                         name: "Denis",
//                                         race: DummyDescriptable(name: "Superior Human", description: ""),
//                                         classes: [DummyDescriptable(name: "Blue Packer", description: "Has a blue backpack")],
//                                         levels: [99],
//                                         sheet: CharacterSheet())]))
        
        table.register(CampaignTableViewCell.nib(), forCellReuseIdentifier: CampaignTableViewCell.identifier)
        table.register(CharacterSelectionAddCharacterTableViewCell.nib(), forCellReuseIdentifier: CharacterSelectionAddCharacterTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
    
    //Mark: Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campaigns.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row > campaigns.count-1 {
            let cell = table.dequeueReusableCell(withIdentifier: CharacterSelectionAddCharacterTableViewCell.identifier, for: indexPath) as! CharacterSelectionAddCharacterTableViewCell
            return cell
        }
        
        
        let cell = table.dequeueReusableCell(withIdentifier: CampaignTableViewCell.identifier, for: indexPath) as! CampaignTableViewCell
        
        cell.configure(with: campaigns[indexPath.row].characters, name: campaigns[indexPath.row].name, nextSessionDate: "next session here", backgroundImageName: campaigns[indexPath.row].cover!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height/6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > campaigns.count-1 {
            table.deselectRow(at: indexPath, animated: true)
            return
        }
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



