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
    
    @IBOutlet weak var logChatTable: UITableView!
    @IBOutlet weak var bioTable: UITableView!
    
    var viewCenter: CGPoint!
    var isChatLogShow = false
    var isBioShown = false
    
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
    
    // ------- Ability --------
    @IBOutlet weak var strAblityModifierBonus: UILabel!
    @IBOutlet weak var dexAblityModifierBonus: UILabel!
    @IBOutlet weak var conAblityModifierBonus: UILabel!
    @IBOutlet weak var intAblityModifierBonus: UILabel!
    @IBOutlet weak var wisAblityModifierBonus: UILabel!
    @IBOutlet weak var chaAblityModifierBonus: UILabel!
    
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
    
    
    override func viewDidLoad() {
        //code here
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(respondToPanGesture))
        self.view.addGestureRecognizer(panGesture)
        
        // Modifying Layout and Apperance
        
        
        let screen = UIScreen.main.bounds
        
        
        //        for subView in self.view.subviews {
        //            subView.translatesAutoresizingMaskIntoConstraints = false
        //            if subView.subviews != [] {
        //                for subSub in subView.subviews {
        //                    subSub.translatesAutoresizingMaskIntoConstraints = false
        //                }
        //            }
        //        }
        
        characterBasicInfoContainer.translatesAutoresizingMaskIntoConstraints = false
        proficiencyIcon.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraints([
            NSLayoutConstraint(item: self.view!,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: characterBasicInfoContainer!,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: screen.width/9),
            NSLayoutConstraint(item: self.view!,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: characterBasicInfoContainer!,
                               attribute: .top,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: characterBasicInfoContainer!,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: .none,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: screen.height/10),
            NSLayoutConstraint(item: characterBasicInfoContainer!,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: .none,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: screen.width*(7/9)),
            
            NSLayoutConstraint(item: self.view!,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: proficiencyIcon!,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: screen.width/7.13),
            NSLayoutConstraint(item: self.view!,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: proficiencyIcon!,
                               attribute: .top,
                               multiplier: 1,
                               constant: -screen.height/6.37),
            NSLayoutConstraint(item: proficiencyIcon!,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: .none,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: screen.height/69.57),
            NSLayoutConstraint(item: proficiencyIcon!,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: .none,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: screen.width/25.49)])
        
        //        characterBasicInfoContainer.addConstraints([])
        
        
        
        
        
        
        
        
        
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
        strAblityModifierBonus.text = cs.abilityScores[0].modifier.description
        dexAblityModifierBonus.text = cs.abilityScores[1].modifier.description
        conAblityModifierBonus.text = cs.abilityScores[2].modifier.description
        intAblityModifierBonus.text = cs.abilityScores[3].modifier.description
        wisAblityModifierBonus.text = cs.abilityScores[4].modifier.description
        chaAblityModifierBonus.text = cs.abilityScores[5].modifier.description
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        bioTable.removeFromSuperview()
    }
    
    @objc func respondToPanGesture(gesture: UIGestureRecognizer) {
        
        if let panGesture = gesture as? UIPanGestureRecognizer {
            
            var target = logChatTable
            let window = UIScreen.main.bounds
            
            switch gesture.state {
            case .began:
                viewCenter = target?.center
                if panGesture.translation(in: self.view).x > 0 {
                    target = bioTable
                }
            case .changed:
                let translation = panGesture.translation(in: self.view)
                if abs(translation.x) < (target?.frame.midX)! {
                    target?.center = CGPoint(x: viewCenter!.x + translation.x, y: viewCenter!.y)
                }
            case .ended :
                UIView.animate(withDuration: 0.3, animations: {
                    if panGesture.translation(in: self.view).x < -100 {
                        target?.frame = CGRect(x: window.width, y: 0, width: -window.width*(9/10), height: window.height)
                    }
                    else {
                        target?.frame = CGRect(x: window.width*(18/10), y: 0, width: -window.width*(9/10), height: window.height)
                    }
                })
            default: break
            }
            
            //            if panGesture.translation(in: self.view).x > 0 {
            //                showBio()
            //            }
            //            if panGesture.translation(in: self.view).x < 0 {
            //                showLogChat()
            //            }
        }
    }
    
    func showLogChat() {
        
    }
    
    func showBio() {
        
    }
    
    //MARK: Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(frame: .zero)
    }
    
    //MARK: - Denis Code Here
    
    @IBAction func attackButton(_ sender: Any) {
    }
    @IBAction func spellsButton(_ sender: Any) {
    }
    @IBAction func skillButton(_ sender: Any) {
    }
    @IBAction func featuresButton(_ sender: Any) {
    }
    @IBAction func equipButton(_ sender: Any) {
    }
    @IBAction func toolsButton(_ sender: Any) {
    }
    
}
