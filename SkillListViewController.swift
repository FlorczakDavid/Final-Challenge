//
//  SkillListViewController.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 26/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class SkillListViewController: UIViewController {
    @IBOutlet weak var acrobaticsModButton: UIButton!
    
    @IBOutlet weak var acrobaticsButton: UIButton!
    
    @IBOutlet weak var acrobaticsInfoButton: UIButton!
    
    var characterSheet: CharacterSheet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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

}
