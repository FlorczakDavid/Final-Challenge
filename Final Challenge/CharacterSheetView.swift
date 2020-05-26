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
    
    // -------------------------
    @IBOutlet weak var proficiencyBonusLabel: UILabel!
    @IBOutlet weak var armorClassLabel: UILabel!
    @IBOutlet weak var characterSpeedLabel: UILabel!
    @IBOutlet weak var characterHitPointsLabel: UILabel!
    @IBOutlet weak var characterTempHitPointsLabel: UILabel!
    
    // -------------------------
    @IBOutlet weak var characterAvatar: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterLevelLabel: UILabel!
    @IBOutlet weak var levelSuffixLabel: UILabel!
    @IBOutlet weak var CharacterClassAndRaceLabel: UILabel!
    
    // -------------------------
    @IBOutlet weak var strAblityModifierBonus: UILabel!
    @IBOutlet weak var dexAblityModifierBonus: UILabel!
    @IBOutlet weak var conAblityModifierBonus: UILabel!
    @IBOutlet weak var intAblityModifierBonus: UILabel!
    @IBOutlet weak var wisAblityModifierBonus: UILabel!
    @IBOutlet weak var chaAblityModifierBonus: UILabel!
    
    
    
    override func viewDidLoad() {
        //code here
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(respondToPanGesture))
        self.view.addGestureRecognizer(panGesture)
        
        // Populating character's data
        let cs = receivedCharacter.sheet
        
        if let avatarPath = receivedCharacter.avatar {
            characterAvatar.image = UIImage(named: avatarPath)
        }
        characterNameLabel.text = receivedCharacter.name
        characterLevelLabel.text = receivedCharacter.levels.reduce(0, +).description
        CharacterClassAndRaceLabel.text = receivedCharacter.classes[0].name + receivedCharacter.race.name
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
