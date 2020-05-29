//
//  RollResultsController.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 29/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

struct RollResultsView {
    private var customView: UIView!
    private var textLabel: UILabel!
    
    init(parentViewController: UIViewController) {
        
        let customViewHeight = 70
        
        guard let view = parentViewController.view else {
            return
        }
            
        let customViewFrame = CGRect(x: 16, y: Int(view.frame.height) - customViewHeight - 32, width: Int(view.frame.width) - 32, height: customViewHeight)
        customView = UIView(frame: customViewFrame)
        customView.backgroundColor = .gray
        view.addSubview(customView)
        
        customView.isHidden = false

        let textLabelFrame = CGRect(x: customView.frame.midY, y: customView.frame.midY, width: 50, height: 50)
        textLabel = UILabel(frame: textLabelFrame)
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        
        customView.addSubview(textLabel)

    }
    
    func showText(_ text: String) {
        textLabel.text = text
        customView.isHidden = false
    }
}
