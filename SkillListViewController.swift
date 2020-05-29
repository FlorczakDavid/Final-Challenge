//
//  SkillListViewController.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 26/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class SkillListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {
    
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
        cell.actionButton.setTitle("\(skill.name) (\(skill.connectedAbility.shortName))", for: .normal)
        cell.actionButton.addTarget(self, action: #selector(actionButtonClicked), for: .touchUpInside)
        cell.actionButton.tag = indexPath.row
        
        cell.modifierButton.setTitle(skill.modifier.description, for: .normal)
        cell.modifierButton.backgroundColor = skill.isProficient ? UIColor(cgColor: cell.modifierButton.layer.borderColor!) : .clear
        cell.modifierButton.addTarget(self, action: #selector(modifierButtonClicked), for: .touchUpInside)
        cell.modifierButton.tag = indexPath.row
        return cell
        
    }
    
    @objc func modifierButtonClicked(_ sender: UIButton) {
        
        guard let cs = characterSheet else {
            return
        }
        
        let selectedSkill = cs.skills[sender.tag]
        selectedSkill.isProficient.toggle()
        SkillsTableView.reloadData()
    }
    
    @objc func actionButtonClicked(_ sender: UIButton) {
        
        guard let cs = characterSheet else {
            return
        }
        let selectedSkill = cs.skills[sender.tag]
        let selectedSkillRoll = selectedSkill.roll()
                
//        let ac = UIAlertController(title: "\(selectedSkill.name)", message: "\(selectedSkillRoll.result) (\(selectedSkillRoll.description))", preferredStyle: .actionSheet)
//
//        present(ac, animated: true)
        
        
        
        //get the button frame
        let buttonFrame = sender.frame
         
        //Configure the presentation controller
        let popoverContentController = self.storyboard?.instantiateViewController(withIdentifier: "PopoverViewController") as? PopoverViewController
        //popoverContentController?.modalPresentationStyle = .popover
        popoverContentController?.popupText = "\(selectedSkillRoll.result) (\(selectedSkillRoll.description))"
        popoverContentController?.popupTitle = "\(selectedSkill.name)"
        //showDetailViewController(popoverContentController!, sender: self)
        present(popoverContentController!, animated: true, completion: nil)

//        if let popoverPresentationController = popoverContentController?.popoverPresentationController {
//            popoverPresentationController.permittedArrowDirections = .any
//            popoverPresentationController.sourceView = sender
//            popoverPresentationController.sourceRect = buttonFrame
//            popoverPresentationController.delegate = self
//            if let popoverController = popoverContentController {
//                present(popoverController, animated: true, completion: nil)
//            }
//        }
    }

    //UIPopoverPresentationControllerDelegate inherits from UIAdaptivePresentationControllerDelegate, we will use this method to define the presentation style for popover presentation controller
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
    return .none
    }
     
    //UIPopoverPresentationControllerDelegate
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
     
    }
     
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
    return true
    }
    
}
