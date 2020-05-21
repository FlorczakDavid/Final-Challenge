//
//  PopUpViewController.swift
//  Final Challenge
//
//  Created by david florczak on 14/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var calculationLabel: UILabel!
    
    var numberOnScreen: Int = 0
    var previousNumber: Int = 0
    var performingMath = false
    var operation = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculationLabel.text = ""
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func dismissbutton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            
            calculationLabel.text = String(sender.tag)
            
            numberOnScreen = Int(calculationLabel.text!)!
            
            performingMath = false
            
        }
            
        else {
            
            calculationLabel.text = calculationLabel.text! + String(sender.tag)
            
            numberOnScreen = Int(calculationLabel.text!)!
            
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if calculationLabel.text != "" && sender.tag != 11 && sender.tag != 16{
            
            previousNumber = Int(calculationLabel.text!)!
            
            if sender.tag == 12 { //Divide
                
                calculationLabel.text = "/";
                
            }
            
            if sender.tag == 13 { //Multiply
                
                calculationLabel.text = "x";
                
            }
            
            if sender.tag == 14 { //Subtract
                
                calculationLabel.text = "-";
                
            }
            
            if sender.tag == 15 { //Add
                
                calculationLabel.text = "+";
                
            }
            
            operation = sender.tag
            
            performingMath = true;
            
        }
            
        else if sender.tag == 16 {
            
            if operation == 12{ //Divide
                
                calculationLabel.text = String(previousNumber / numberOnScreen)
                
            }
                
            else if operation == 13{ //Multiply
                
                calculationLabel.text = String(previousNumber * numberOnScreen)
                
            }
                
            else if operation == 14{ //Subtract
                
                calculationLabel.text = String(previousNumber - numberOnScreen)
                
            }
                
            else if operation == 15{ //Add
                
                calculationLabel.text = String(previousNumber + numberOnScreen)
                
            }
            
        }
            
        else if sender.tag == 11{
            
            calculationLabel.text = ""
            
            previousNumber = 0;
            
            numberOnScreen = 0;
            
            operation = 0;
            
        }
        
    }
    
}
