//
//  CampaignDetailVIew.swift
//  Final Challenge
//
//  Created by david florczak on 14/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class CampaignDetailView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var receivedCampagn: Campaign!
    var characterToAccess: Character!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var myTestingLabel: UILabel!
    @IBOutlet weak var campainImage: UIImageView!
    @IBOutlet weak var charactersTable: UITableView!
    
    override func viewDidLoad() {
        myTestingLabel.text = receivedCampagn.name
        campainImage.image = UIImage(named: receivedCampagn.cover ?? "")
        
        charactersTable.register(CharacterSelectionTableViewCell.nib(), forCellReuseIdentifier: CharacterSelectionTableViewCell.identifier)
        
        charactersTable.register(CharacterSelectionAddCharacterTableViewCell.nib(), forCellReuseIdentifier: CharacterSelectionAddCharacterTableViewCell.identifier)
        
        charactersTable.delegate = self
        charactersTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receivedCampagn.characters.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row > receivedCampagn.characters.count-1 {
            let cell = charactersTable.dequeueReusableCell(withIdentifier: CharacterSelectionAddCharacterTableViewCell.identifier, for: indexPath) as! CharacterSelectionAddCharacterTableViewCell
            return cell
        }
        let cell = charactersTable.dequeueReusableCell(withIdentifier: CharacterSelectionTableViewCell.identifier, for: indexPath) as! CharacterSelectionTableViewCell
        
                    cell.configure(with: receivedCampagn.characters[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        charactersTable.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row > receivedCampagn.characters.count-1 {
            return
        }
        
        characterToAccess = receivedCampagn.characters[indexPath.row]
        performSegue(withIdentifier: "showCharacterSheet", sender: self)
        // need to add an if here for the campaign creation case which will change the identifier
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCharacterSheet" {
            let destinationViewController = segue.destination as! CharacterSheetView
            destinationViewController.receivedCharacter = characterToAccess
        }
    }
    
}
