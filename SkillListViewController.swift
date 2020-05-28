//
//  SkillListViewController.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 26/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class SkillListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var SkillsTableView: UITableView!
    
    var characterSheet: CharacterSheet?
    
    let cellReuseIdentifier = "SkillsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        SkillsTableView.delegate = self
        SkillsTableView.dataSource = self
        
        guard let cs = characterSheet else {
            return
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Table handling
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let cs = characterSheet else {
            return 0
        }
        
        return cs.skills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cs = characterSheet else {
            return SkillsTableViewCell()
        }
        
        guard let cell = self.SkillsTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? SkillsTableViewCell else {
            fatalError("The dequeued cell is not an instance of \(cellReuseIdentifier).")
        }
        let skill = cs.skills[indexPath.row]
        cell.actionButton.setTitle("\(skill.name)", for: .normal)
        cell.modifierButton.setTitle(skill.modifier.description, for: .normal)
        cell.actionButton.tag = indexPath.row
        cell.modifierButton.tag = indexPath.row
        return cell
        
    }
}
