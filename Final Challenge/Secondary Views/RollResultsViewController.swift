//
//  PopoverViewController.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 28/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class RollResultsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var popupView: UIView!
    
    var popupTitle: String?
    var popupText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = popupText
        titleLabel.text = popupTitle
        popupView.layer.cornerRadius = 8
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
