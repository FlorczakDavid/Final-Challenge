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
    
    
    override func viewDidLoad() {
        //code here
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(respondToPanGesture))
        self.view.addGestureRecognizer(panGesture)
        
        // Modifying Layout and Apperance
        //MARK: WE SHOULD HAVE USED SWIFTUI
        
        let screen = UIScreen.main.bounds
        
        
//                for subView in self.view.subviews {
//                    subView.translatesAutoresizingMaskIntoConstraints = false
//                    if subView.subviews != [] {
//                        for subSub in subView.subviews {
//                            subSub.translatesAutoresizingMaskIntoConstraints = false
//                        }
//                    }
//                }
        
        characterBasicInfoContainer.translatesAutoresizingMaskIntoConstraints = false
        proficiencyIcon.translatesAutoresizingMaskIntoConstraints = false
        strButton.translatesAutoresizingMaskIntoConstraints = false
        proficiencyBonusLabel.translatesAutoresizingMaskIntoConstraints = false
        strAbilityModifier.translatesAutoresizingMaskIntoConstraints = false
        
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
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: proficiencyIcon!,
                               attribute: .leading,
                               multiplier: 1,
                               constant: -screen.width/7.13),
            NSLayoutConstraint(item: self.view!,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: proficiencyIcon!,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: -screen.height/6.9),
            NSLayoutConstraint(item: proficiencyIcon!,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: .none,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: screen.height/40.15),
            NSLayoutConstraint(item: proficiencyIcon!,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: .none,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: screen.width/25.49),
            
            NSLayoutConstraint(item: proficiencyBonusLabel!,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: proficiencyIcon!,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: proficiencyBonusLabel!,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: proficiencyIcon!,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: proficiencyBonusLabel.frame.height),
            NSLayoutConstraint(item: proficiencyBonusLabel!,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: .none,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: screen.height/57.36),
            NSLayoutConstraint(item: proficiencyBonusLabel!,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: .none,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: screen.width/23),
            
            NSLayoutConstraint(item: self.view!,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: strButton!,
                               attribute: .leading,
                               multiplier: 1,
                               constant: -screen.width/6),
            NSLayoutConstraint(item: self.view!,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: strButton!,
                               attribute: .top,
                               multiplier: 1,
                               constant: -screen.height/3.88),
            NSLayoutConstraint(item: strButton!,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: .none,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: screen.height/22.31),
            NSLayoutConstraint(item: strButton!,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: .none,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: screen.width/6.9),
            
            NSLayoutConstraint(item: strAbilityModifier!,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: strButton!,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: strAbilityModifier!,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: strButton!,
                               attribute: .top,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: strAbilityModifier!,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: strButton!,
                               attribute: .height,
                               multiplier: 0.5,
                               constant: 1),
            NSLayoutConstraint(item: strAbilityModifier!,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: strButton!,
                               attribute: .width,
                               multiplier: 1,
                               constant: 0)])
        
//                characterBasicInfoContainer.addConstraints([])
        let abilityButtonArray = [dexButton, conButton, intButton, wisButton, chaButton]
        let abilityModifierArray = [dexAbilityModifier, conAbilityModifier, intAbilityModifier, wisAbilityModifier, chaAbilityModifier]
    
        for i in 0...4 {
            abilityButtonArray[i]?.translatesAutoresizingMaskIntoConstraints = false
            abilityModifierArray[i]?.translatesAutoresizingMaskIntoConstraints = false
            
            strButton.layer.cornerRadius = 5
            abilityButtonArray[i]?.layer.cornerRadius = 5
            
            self.view.addConstraints([
                NSLayoutConstraint(item: self.view!,
                                   attribute: .leading,
                                   relatedBy: .equal,
                                   toItem: abilityButtonArray[i]!,
                                   attribute: .leading,
                                   multiplier: 1,
                                   constant: -screen.width/6),
                NSLayoutConstraint(item: self.view!,
                                   attribute: .top,
                                   relatedBy: .equal,
                                   toItem: abilityButtonArray[i]!,
                                   attribute: .top,
                                   multiplier: 1,
                                   constant: -screen.height/3.88 - (screen.height/8.92)*CGFloat(i+1)),
                NSLayoutConstraint(item: abilityButtonArray[i]!,
                                   attribute: .height,
                                   relatedBy: .equal,
                                   toItem: .none,
                                   attribute: .notAnAttribute,
                                   multiplier: 1,
                                   constant: screen.height/22.31),
                NSLayoutConstraint(item: abilityButtonArray[i]!,
                                   attribute: .width,
                                   relatedBy: .equal,
                                   toItem: .none,
                                   attribute: .notAnAttribute,
                                   multiplier: 1,
                                   constant: screen.width/6.9),


                NSLayoutConstraint(item: abilityModifierArray[i]!,
                                   attribute: .centerX,
                                   relatedBy: .equal,
                                   toItem: abilityButtonArray[i]!,
                                   attribute: .centerX,
                                   multiplier: 1,
                                   constant: 0),
                NSLayoutConstraint(item: abilityModifierArray[i]!,
                                   attribute: .bottom,
                                   relatedBy: .equal,
                                   toItem: abilityButtonArray[i]!,
                                   attribute: .top,
                                   multiplier: 1,
                                   constant: 0),
                NSLayoutConstraint(item: abilityModifierArray[i]!,
                                   attribute: .height,
                                   relatedBy: .equal,
                                   toItem: abilityButtonArray[i]!,
                                   attribute: .height,
                                   multiplier: 0.5,
                                   constant: 1),
                NSLayoutConstraint(item: abilityModifierArray[i]!,
                                   attribute: .width,
                                   relatedBy: .equal,
                                   toItem: abilityButtonArray[i]!,
                                   attribute: .width,
                                   multiplier: 1,
                                   constant: 0)])
        }
        
        let infoIcons = [proficiencyIcon, armorClassIcon,characterSpeedIcon]
        let infoLabel = [proficiencyBonusLabel, armorClassLabel, characterSpeedLabel]
        
        proficiencyBonusLabel.layer.cornerRadius = 5
        armorClassLabel.layer.cornerRadius = 5
        characterSpeedLabel.layer.cornerRadius = 5
        
        for i in 1...2 {
            infoIcons[i]?.translatesAutoresizingMaskIntoConstraints = false
            infoLabel[i]?.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addConstraints([
                NSLayoutConstraint(item: infoLabel[i]!,
                                       attribute: .leading,
                                       relatedBy: .equal,
                                       toItem: infoLabel[i-1]!,
                                       attribute: .leading,
                                       multiplier: 1,
                                       constant: screen.width/11.83),
                    NSLayoutConstraint(item: infoLabel[i]!,
                                       attribute: .top,
                                       relatedBy: .equal,
                                       toItem: infoLabel[i-1]!,
                                       attribute: .top,
                                       multiplier: 1,
                                       constant: 0),
                    NSLayoutConstraint(item: infoLabel[i]!,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: infoLabel[i-1]!,
                                       attribute: .height,
                                       multiplier: 1,
                                       constant: 0),
                    NSLayoutConstraint(item: infoLabel[i]!,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: infoLabel[i-1],
                                       attribute: .width,
                                       multiplier: 1,
                                       constant: 0),


                    NSLayoutConstraint(item: infoIcons[i]!,
                                       attribute: .centerY,
                                       relatedBy: .equal,
                                       toItem: infoIcons[i-1]!,
                                       attribute: .centerY,
                                       multiplier: 1,
                                       constant: 0),
                    NSLayoutConstraint(item: infoIcons[i]!,
                                       attribute: .centerX,
                                       relatedBy: .equal,
                                       toItem: infoLabel[i]!,
                                       attribute: .centerX,
                                       multiplier: 1,
                                       constant: 0),
                    NSLayoutConstraint(item: infoIcons[i]!,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: proficiencyIcon!,
                                       attribute: .height,
                                       multiplier: 1,
                                       constant: 0),
                    NSLayoutConstraint(item: infoIcons[i]!,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: infoLabel[i]!,
                                       attribute: .width,
                                       multiplier: 1,
                                       constant: 0)])
            }
        
        hpAreaView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraints([
            NSLayoutConstraint(item: hpAreaView!,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: characterBasicInfoContainer!,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: hpAreaView!,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: characterSpeedIcon!,
                               attribute: .top,
                               multiplier: 1,
                               constant: -screen.height/160.6),
            NSLayoutConstraint(item: hpAreaView!,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: characterSpeedLabel!,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: screen.height/160.6),
            NSLayoutConstraint(item: hpAreaView!,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: .none,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: screen.width/2.04)])
        
        hpContainerView.translatesAutoresizingMaskIntoConstraints = false
        characterTempHitPointsLabel.translatesAutoresizingMaskIntoConstraints = false
        characterHitPointsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        hpLabel.translatesAutoresizingMaskIntoConstraints = false
        
        hpAreaView.addConstraints([
            NSLayoutConstraint(item: hpContainerView!,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: hpAreaView!,
                               attribute: .centerY,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: hpContainerView!,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: hpAreaView!,
                               attribute: .leading,
                               multiplier: 1,
                               constant: screen.width/41.4),
            NSLayoutConstraint(item: hpContainerView!,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: hpAreaView!,
                               attribute: .top,
                               multiplier: 1,
                               constant: screen.height/89.22),
            NSLayoutConstraint(item: hpContainerView!,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: hpAreaView,
                               attribute: .width,
                               multiplier: 0.77,
                               constant: 0),
            
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
        
        savesButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraints([
            NSLayoutConstraint(item: savesButton!,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: hpAreaView!,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
        NSLayoutConstraint(item: savesButton!,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: .none,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: screen.width/2.79),
        NSLayoutConstraint(item: savesButton!,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: hpAreaView!,
                           attribute: .top,
                           multiplier: 1,
                           constant: screen.height/13.38),
        NSLayoutConstraint(item: savesButton!,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: .none,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: screen.height/14.34),
        
        ])
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showSkillList" {
//            let destinationViewController = segue.destination as! SkillListViewController
//            destinationViewController.characterSheet = receivedCharacter.sheet
//        }
        
        guard let SkillsVC = segue.destination as? SkillListViewController else {
            return
        }
        SkillsVC.characterSheet = receivedCharacter.sheet
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
    
    
    //MARK: - HPChanger
    
    func setHPLabelSize(hitPoints: HitPoints) {
        if hitPoints.maximum == 0 { return }
        var maxShownHp = hitPoints.maximum
        
        if hitPoints.value + (hitPoints.temporary ?? 0) > hitPoints.maximum {
            maxShownHp = hitPoints.value + (hitPoints.temporary ?? 0)
        }
        
//        UIView.animate(withDuration: 0.3, animations: {
//        characterHitPointsLabel.constraint
        
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
        //        })
    }
    
}
