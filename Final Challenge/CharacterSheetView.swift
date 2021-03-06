//
//  CharacterSheet.swift
//  Final Challenge
//
//  Created by david florczak on 14/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class CharacterSheetView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var receivedCharacter: Character!
    
    
    // ------- bio and chat Table -------
    
    @IBOutlet weak var chatLogTable: UITableView!
    @IBOutlet weak var bioTable: UITableView!
    
    var isDetailShown = false
    
    var viewCenter: CGPoint!
    
    var originalBioCenter: CGPoint?
    var originalChatCenter: CGPoint?
    var isChatLogShown = false
    var isBioShown = false
    var target = UITableView()
    
    let bioTableElements = ["Appearance", "Backstory", "Allies", "Treasures"]
    var chatLog: [[String]] = []
    
    // ------ proficiency, ac, speed -------
    @IBOutlet weak var proficiencyBonusLabel: UILabel!
    @IBOutlet weak var armorClassLabel: UILabel!
    @IBOutlet weak var characterSpeedLabel: UILabel!
    
    @IBOutlet weak var proficiencyIcon: UIImageView!
    @IBOutlet weak var armorClassIcon: UIImageView!
    @IBOutlet weak var characterSpeedIcon: UIImageView!
    
    // ----------- HP Area -----------
    @IBOutlet weak var hpAreaView: UIView!
    @IBOutlet weak var hpLabel: UILabel!
    
    @IBOutlet weak var hpContainerView: UIView!
    @IBOutlet weak var characterHitPointsLabel: UILabel!
    @IBOutlet weak var characterTempHitPointsLabel: UILabel!
    
    // ---Basic Information---
    @IBOutlet weak var characterBasicInfoContainer: UIView!
    @IBOutlet weak var characterAvatar: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterLevelLabel: UILabel!
    @IBOutlet weak var levelSuffixLabel: UILabel!
    @IBOutlet weak var CharacterClassAndRaceLabel: UILabel!
    @IBOutlet weak var swapCharacterSheetButton: UIButton!
    
    var isCharacterSwapTableShown = true
    
    // ------- Ability --------
    @IBOutlet weak var strButton: UIButton!
    @IBOutlet weak var dexButton: UIButton!
    @IBOutlet weak var conButton: UIButton!
    @IBOutlet weak var intButton: UIButton!
    @IBOutlet weak var wisButton: UIButton!
    @IBOutlet weak var chaButton: UIButton!
    @IBOutlet weak var strAbilityModifier: UILabel!
    @IBOutlet weak var dexAbilityModifier: UILabel!
    @IBOutlet weak var conAbilityModifier: UILabel!
    @IBOutlet weak var intAbilityModifier: UILabel!
    @IBOutlet weak var wisAbilityModifier: UILabel!
    @IBOutlet weak var chaAbilityModifier: UILabel!
    
    // ----- beneath HP -------
    // saves, inspiratin, rest, hitDie, init
    
    @IBOutlet weak var savesButton: UIButton!
    @IBOutlet weak var inspirationButton: UIButton!
    @IBOutlet weak var restButton: UIButton!
    @IBOutlet weak var hitDiceButton: UIButton!
    @IBOutlet weak var initiativeButton: UIButton!
    
    // Attack, Spells, Skills, Features, Equip, Tools
    
    @IBOutlet weak var attackButton: UIButton!
    @IBOutlet weak var spellsButton: UIButton!
    @IBOutlet weak var skillsButton: UIButton!
    @IBOutlet weak var featuresButton: UIButton!
    @IBOutlet weak var equipButton: UIButton!
    @IBOutlet weak var toolsButton: UIButton!
    
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var spellsLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet weak var equipLabel: UILabel!
    @IBOutlet weak var featuresLabel: UILabel!
    @IBOutlet weak var toolsLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        bioTable.beginUpdates()
        bioTable.endUpdates()
    }
    
    override func viewDidLoad() {
        //code here
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(respondToPanGesture))
        self.view.addGestureRecognizer(panGesture)
        
        // Modifying Layout and Apperance
        
        hpLabel.translatesAutoresizingMaskIntoConstraints = false
        characterTempHitPointsLabel.translatesAutoresizingMaskIntoConstraints = false
        characterHitPointsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        hpAreaView.addConstraints([
            NSLayoutConstraint(item: characterHitPointsLabel!,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: hpContainerView!,
                               attribute: .width,
                               multiplier: 0.5,
                               constant: 0),
            NSLayoutConstraint(item: characterHitPointsLabel!,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: hpContainerView!,
                               attribute: .height,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: characterHitPointsLabel!,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: hpContainerView!,
                               attribute: .leading,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: characterHitPointsLabel!,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: hpContainerView!,
                               attribute: .centerY,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: characterTempHitPointsLabel!,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: hpContainerView!,
                               attribute: .width,
                               multiplier: 0.5,
                               constant: 5),
            NSLayoutConstraint(item: characterTempHitPointsLabel!,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: hpContainerView!,
                               attribute: .height,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: characterTempHitPointsLabel!,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: characterHitPointsLabel!,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: -5),
            NSLayoutConstraint(item: characterTempHitPointsLabel!,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: hpContainerView!,
                               attribute: .centerY,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: hpLabel!,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: hpAreaView!,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: hpLabel!,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: hpContainerView!,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: hpLabel!,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: hpContainerView!,
                               attribute: .height,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: hpLabel!,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: hpContainerView!,
                               attribute: .centerY,
                               multiplier: 1,
                               constant: 0)
        ])
        
        chatLogTable.translatesAutoresizingMaskIntoConstraints = false
        bioTable.translatesAutoresizingMaskIntoConstraints = false
        
        originalBioCenter = self.bioTable.center
        originalChatCenter = self.chatLogTable.center
        
        //         Populating character's data
        let cs = receivedCharacter.sheet
        
        if let avatarPath = receivedCharacter.avatar {
            characterAvatar.image = UIImage(named: avatarPath)
        }
        characterNameLabel.text = receivedCharacter.name
        characterLevelLabel.text = receivedCharacter.levels.reduce(0, +).description
        CharacterClassAndRaceLabel.text = receivedCharacter.classes[0].name + "\n" + receivedCharacter.race.name
        proficiencyBonusLabel.text = cs.proficiencyBonus.description
        armorClassLabel.text = cs.armorClass.description
        characterSpeedLabel.text = cs.speed.description
        characterHitPointsLabel.text = cs.hitPoints.value.description
        characterTempHitPointsLabel.text = cs.hitPoints.temporary?.description
        strButton.setTitle(cs.abilityScores[0].modifier.description, for: .normal)
        dexButton.setTitle(cs.abilityScores[1].modifier.description, for: .normal)
        conButton.setTitle(cs.abilityScores[2].modifier.description, for: .normal)
        intButton.setTitle(cs.abilityScores[3].modifier.description, for: .normal)
        wisButton.setTitle(cs.abilityScores[4].modifier.description, for: .normal)
        chaButton.setTitle(cs.abilityScores[5].modifier.description, for: .normal)
        strAbilityModifier.text = "STR \(cs.abilityScores[0].value)"
        dexAbilityModifier.text = "DEX \(cs.abilityScores[1].value)"
        conAbilityModifier.text = "CON \(cs.abilityScores[2].value)"
        intAbilityModifier.text = "INT \(cs.abilityScores[3].value)"
        wisAbilityModifier.text = "WIS \(cs.abilityScores[4].value)"
        chaAbilityModifier.text = "CHA \(cs.abilityScores[5].value)"
        
        setHPLabelSize(hitPoints: cs.hitPoints)
        
        //setting up the tables
        chatLogTable.register(ChatLogTableViewTextCell.nib(), forCellReuseIdentifier: ChatLogTableViewTextCell.identifier)
        chatLogTable.dataSource = self
        chatLogTable.delegate = self
        
        bioTable.register(BioTableViewCell.nib(), forCellReuseIdentifier: BioTableViewCell.identifier)
        bioTable.dataSource = self
        bioTable.delegate = self
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        bioTable.removeFromSuperview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !self.view.subviews.contains(bioTable) {
            self.view.addSubview(bioTable)
        }
    }
    
    @objc func respondToPanGesture(gesture: UIGestureRecognizer) {
        
        if let panGesture = gesture as? UIPanGestureRecognizer {
            
            let window = UIScreen.main.bounds
            
            switch gesture.state {
            case .began:
                let translation = panGesture.translation(in: self.view)
                
                if isBioShown { self.target = bioTable }
                if isChatLogShown { self.target = chatLogTable }
                if !isChatLogShown && !isBioShown { self.target = translation.x > 0 ? bioTable : chatLogTable }
                
                viewCenter = self.target.center
                
            case .changed:
                let translation = panGesture.translation(in: self.view)
                self.target.center = CGPoint(x: viewCenter!.x + translation.x, y: viewCenter!.y)
                
            case .ended :
                let translation = panGesture.translation(in: self.view)
                
                let foldedCenter = CGPoint(x: target == bioTable ? self.originalBioCenter!.x : self.originalChatCenter!.x,
                                           y: self.target.center.y)
                let unfoldedCenter = CGPoint(x: target == bioTable ? window.width*(22/23)-self.target.frame.width/2-5 : window.width/23+self.target.frame.width/2+5,
                                             y: self.target.center.y)
                
                
                UIView.animate(withDuration: 0.3, animations: {
                    
                    if (!self.isBioShown && translation.x > 75 && self.target == self.bioTable)
                        || (!self.isChatLogShown && translation.x < -75 && self.target == self.chatLogTable)
                        || (self.isBioShown && translation.x > -75 && self.target == self.bioTable)
                        || (self.isChatLogShown && translation.x < 75 && self.target == self.chatLogTable) {
                        
                        // show table
                        self.target.center = unfoldedCenter
                        if self.target == self.bioTable { self.isBioShown = true } else { self.isChatLogShown = true }
                        return
                    }else {
                        
                        // hide table
                        self.target.center = foldedCenter
                        if self.target == self.bioTable { self.isBioShown = false } else { self.isChatLogShown = false }
                        return
                    }
                })
            default: break
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSkills" {
            let destinationViewController = segue.destination as! ScoreListViewController
            destinationViewController.list = receivedCharacter.sheet.skills
            destinationViewController.listType = .skills
            destinationViewController.screenTitle = "Skills"
            destinationViewController.headerImage = UIImage(named: "skills - section")
        } else if segue.identifier == "showSavingThrows" {
            let destinationViewController = segue.destination as! ScoreListViewController
            destinationViewController.list = receivedCharacter.sheet.savingThrows
            destinationViewController.listType = .skills
            destinationViewController.screenTitle = "Saving Throws"
            destinationViewController.headerImage = UIImage(named: "skills - section")
        } else if segue.identifier == "showFeatures" {
            let destinationViewController = segue.destination as! ScoreListViewController
            destinationViewController.list = receivedCharacter.sheet.features
            destinationViewController.listType = .features
            destinationViewController.screenTitle = "Features"
            destinationViewController.headerImage = UIImage(named: "features - section")
        } else if segue.identifier == "showTools" {
            let destinationViewController = segue.destination as! ScoreListViewController
            destinationViewController.list = receivedCharacter.sheet.proficiencies
            destinationViewController.listType = .proficiencies
            destinationViewController.screenTitle = "Proficiencies"
            destinationViewController.headerImage = UIImage(named: "tools section")
        } else if segue.identifier == "showInventory" {
            let destinationViewController = segue.destination as! ScoreListViewController
            destinationViewController.list = receivedCharacter.sheet.equipment
            destinationViewController.listType = .inventory
            destinationViewController.screenTitle = "Inventory"
            destinationViewController.headerImage = UIImage(named: "items - section")
        }
    }
    
    //MARK: Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == bioTable { return 5 }
        if tableView == chatLogTable { return chatLog.count }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.chatLogTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChatLogTableViewTextCell.identifier) as! ChatLogTableViewTextCell
            cell.titleLable.text = chatLog[indexPath.row][0]
            cell.subTitleLabel.text = chatLog[indexPath.row][1]
            return cell
        }
        if tableView == self.bioTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: BioTableViewCell.identifier) as! BioTableViewCell
            cell.delegate = self
            if indexPath.row != 4 {
                cell.bioPartNameLabel.text = bioTableElements[indexPath.row]
                cell.bioDescription.text = setBioTableDescriptions(bioTableElement: bioTableElements[indexPath.row])
            }
            return cell
        }
        return UITableViewCell(style: .default, reuseIdentifier: "fail")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let cell = tableView.cellForRow(at: indexPath) as? BioTableViewCell {
            return cell.bioPartNameLabel.frame.height + cell.bioDescription.frame.height + 16
        }
        
        return UITableView.automaticDimension
    }
    
    func setBioTableDescriptions(bioTableElement: String) -> String {
        if bioTableElement == "Appearance" {
            var description = "age: " + String(receivedCharacter.sheet.bio.appearance.age) + "\n"
            description += "eyes: " + receivedCharacter.sheet.bio.appearance.eyes + "\n"
            description += "hair: " + receivedCharacter.sheet.bio.appearance.hair + "\n"
            description += "height: " + String(receivedCharacter.sheet.bio.appearance.height) + "\n"
            description += "size: " + receivedCharacter.sheet.bio.appearance.size + "\n"
            description += "skin: " + receivedCharacter.sheet.bio.appearance.skin + "\n"
            description += "weight: " + String(receivedCharacter.sheet.bio.appearance.weight) + "\n"
            
            return description
        }
        
        if bioTableElement == "Backstory" {
            return receivedCharacter.sheet.bio.backstory
        }
        if bioTableElement == "Allies" {
            return receivedCharacter.sheet.bio.alliesOrganizations
        }
        if bioTableElement == "Treasures" {
            return receivedCharacter.sheet.bio.treasure
        }
        
        return ""
    }
    
    //MARK: - Denis Code Here
    
    @IBAction func skillButton(_ sender: UIButton) {
        
        let rollResultsVC = self.storyboard?.instantiateViewController(withIdentifier: "RollResultsViewController") as? RollResultsViewController
        
        let selectedAbility = receivedCharacter.sheet.abilityScores[sender.tag]
        let selectedAbilityRoll = selectedAbility.roll()
        //Configure the presentation controller
        rollResultsVC?.popupText = "\(selectedAbilityRoll.result) (\(selectedAbilityRoll.description))"
        rollResultsVC?.popupTitle = "\(selectedAbility.name)"
        
        present(rollResultsVC!, animated: true, completion: nil)
    }
    
    //MARK: - HPChanger
    
    func setHPLabelSize(hitPoints: HitPoints) {
        if hitPoints.maximum == 0 { return }
        var maxShownHp = hitPoints.maximum
        
        if hitPoints.value + (hitPoints.temporary ?? 0) > hitPoints.maximum {
            maxShownHp = hitPoints.value + (hitPoints.temporary ?? 0)
        }
        
        self.view.addConstraints([
            NSLayoutConstraint(
                item: self.characterHitPointsLabel!,
                attribute: .width,
                relatedBy: .equal,
                toItem: self.hpContainerView!,
                attribute: .width,
                multiplier: CGFloat(hitPoints.value)/CGFloat(maxShownHp),
                constant: 5),
            NSLayoutConstraint(
                item: self.characterTempHitPointsLabel!,
                attribute: .width,
                relatedBy: .equal,
                toItem: self.hpContainerView!,
                attribute: .width,
                multiplier: CGFloat((hitPoints.temporary ?? 0))/CGFloat(maxShownHp), //let's not forget conversion priority
                constant: 5)])
    }
    
    //MARK: - Swap Character
    
    @IBAction func swapCharacter(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            if !self.isCharacterSwapTableShown {
                self.swapCharacterSheetButton.transform = CGAffineTransform(rotationAngle: .pi/2)
                
                
            } else {
                self.swapCharacterSheetButton.transform = .identity
            }
        })
        
        self.isCharacterSwapTableShown.toggle()
    }
    
    
}

extension CharacterSheetView: BioTableViewCellDelegate {
    func didTapDetailButton(onCell cell: BioTableViewCell) {
        cell.isInfoDisplayed.toggle()
        
        self.bioTable.beginUpdates()
        
        let image = cell.isInfoDisplayed ? #imageLiteral(resourceName: "eye- opened info") : #imageLiteral(resourceName: "eye - info element")
        cell.infoButton.setImage(image, for: .normal)
        
        
        cell.bioDescription.sizeToFit()
        
        UIView.animate(withDuration: 0.3, animations: {
            cell.bioDescription.frame = CGRect(
            x: 50,
            y: cell.infoButton.frame.maxY + cell.infoButton.frame.height,
            width: cell.bioPartNameLabel.frame.width-50,
            height: cell.isInfoDisplayed ? cell.bioDescription.frame.height : 0)
        })
        
        
        cell.bioDescription.backgroundColor = #colorLiteral(red: 0.9214878678, green: 0.9216204286, blue: 0.9214589, alpha: 1)
        
        
        self.bioTable.endUpdates()
    }
}

