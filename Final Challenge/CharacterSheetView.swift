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

    var viewCenter: CGPoint!
    var isChatLogShow = false
    var isBioShown = false
    
    // -------------------------
    @IBOutlet weak var proficiencyBonusLabel: UILabel!
    @IBOutlet weak var armorClassLabel: UILabel!
    @IBOutlet weak var characterSpeedLabel: UILabel!
    
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
        
    }
    
    @objc func respondToPanGesture(gesture: UIGestureRecognizer) {

        if let panGesture = gesture as? UIPanGestureRecognizer {
            
            let target = logChatTable
            
            switch gesture.state {
            case .began:
                viewCenter = target?.center
            case .changed:
                let translation = panGesture.translation(in: self.view)
                target?.center = CGPoint(x: viewCenter!.x + translation.x, y: viewCenter!.y)
            case .ended :
                UIView.animate(withDuration: 0.3, animations: {
                    if (target?.center.x)! > 500.0 {
                        target?.transform = CGAffineTransform(translationX: -200, y: 0)
                    }
                    else {
                        target?.transform = .identity
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
