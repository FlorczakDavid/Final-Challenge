//
//  SkillListViewController.swift
//  Final Challenge
//
//  Created by Денис Матвеев on 26/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

enum ListType {
    case skills
    case features
}

class ScoreListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var SkillsTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    
    var listType: ListType!
    var list: [Descriptable]!
    var screenTitle: String!
    var headerImage: UIImage!
    private var sections: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        SkillsTableView.delegate = self
        SkillsTableView.dataSource = self
        
        titleLabel.text = screenTitle
        headerImageView.image = headerImage
        
        if listType == .features {
            let featureList = list as! [Feature]
            let featureSources = featureList.map({ $0.source.description() })
            sections.append(contentsOf: featureSources.removingDuplicates())
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
        if listType == .features {
            return sections.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listType == .features {
            let featureList = list as! [Feature]
            let rowsNumber = featureList.filter({ $0.source.description() == self.sections[section] }).count
            return rowsNumber
        } else {
            return list.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if listType == .features {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 28))

            let label = UILabel()
            label.frame = CGRect.init(x: 16, y: 0, width: headerView.frame.width - 10, height: headerView.frame.height - 10)
            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            label.textColor = UIColor.white
            
            let sectionTitle = sections[section]
            label.text = sectionTitle.uppercased()
            
            headerView.addSubview(label)

            return headerView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if listType == .features {
            return 28
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.SkillsTableView.dequeueReusableCell(withIdentifier: "SkillsTableViewCell", for: indexPath) as! ScoresTableViewCell
        
        if listType == .skills {
            let score = list[indexPath.row] as! Score
            cell.actionButton.setTitle("\(score.name) (\(score.connectedAbility.shortName))", for: .normal)
            
            cell.modifierButton.setTitle(score.modifier.description, for: .normal)
            cell.modifierButton.backgroundColor = score.isProficient ? UIColor(cgColor: cell.modifierButton.layer.borderColor!) : .clear
            cell.modifierButton.addTarget(self, action: #selector(modifierButtonClicked), for: .touchUpInside)
            cell.modifierButton.tag = indexPath.row
            
        } else if listType == .features {
            let featureList = list as! [Feature]
            let feature = featureList.filter({ $0.source.description() == self.sections[indexPath.section] })[indexPath.row]
            setButtonTitle(title: feature.name, subtitle: feature.sourceDescription, button: cell.actionButton)
            
            cell.modifierButton.removeFromSuperview()
        }
        
        cell.actionButton.addTarget(self, action: #selector(actionButtonClicked), for: .touchUpInside)
        cell.actionButton.tag = tableView.absoluteIndex(with: indexPath)!
        cell.infoButton.addTarget(self, action: #selector(infoButtonClicked), for: .touchUpInside)
        cell.infoButton.tag = tableView.absoluteIndex(with: indexPath)!
        
        return cell
    }
        
    @objc func modifierButtonClicked(_ sender: UIButton) {
        if listType == .skills {
            let selectedSkill = list[sender.tag] as! Score
            selectedSkill.isProficient.toggle()
            SkillsTableView.reloadData()
        }
    }
    
    @objc func actionButtonClicked(_ sender: UIButton) {
        
         let rollResultsVC = self.storyboard?.instantiateViewController(withIdentifier: "RollResultsViewController") as? RollResultsViewController
        
        if listType == .skills {
            let selectedSkill = list[sender.tag] as! Score
            let selectedSkillRoll = selectedSkill.roll()
            //Configure the presentation controller
            rollResultsVC?.popupText = "\(selectedSkillRoll.result) (\(selectedSkillRoll.description))"
            rollResultsVC?.popupTitle = "\(selectedSkill.name)"
        } else if listType == .features {
            let selectedFeature = list[sender.tag]
            rollResultsVC?.popupText = "\(selectedFeature.description)"
            rollResultsVC?.popupTitle = "\(selectedFeature.name)"
        }
        
        present(rollResultsVC!, animated: true, completion: nil)
    }

    @objc func infoButtonClicked(_ sender: UIButton) {
        
        //Configure the presentation controller
        guard let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as? DescriptionViewController else {
            return
        }
        
        let selectedSkill = list[sender.tag]
        descriptionVC.descriptionText = selectedSkill.description
        
        descriptionVC.modalPresentationStyle = .popover
        
        if let popoverPresentationController = descriptionVC.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = [.up, .down]
            popoverPresentationController.sourceView = sender
            popoverPresentationController.sourceRect = CGRect(x: sender.bounds.midX, y: sender.bounds.midY, width: 0, height: 0)
            popoverPresentationController.delegate = self
            
            present(descriptionVC, animated: true)
            
            // Setting the right popover size
            //let optimalHeight = descriptionVC.descriptionTextView.sizeThatFits(descriptionVC.descriptionTextView.contentSize).height
            let optimalHeight = descriptionVC.descriptionTextView.contentSize.height
            
            descriptionVC.preferredContentSize = CGSize(width: view.bounds.width, height: optimalHeight)
        }
    }
    
    func setButtonTitle(title: String, subtitle: String, button: UIButton){
        //applying the line break mode
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        let titleFont = UIFont.systemFont(ofSize: 12, weight: .bold)
        let subtitleFont = UIFont.italicSystemFont(ofSize: 12)
        
        let title = NSMutableAttributedString(string: title, attributes: [NSMutableAttributedString.Key.font: titleFont])
        let subtitle = NSMutableAttributedString(string: subtitle, attributes: [NSMutableAttributedString.Key.font: subtitleFont])
        let char = NSMutableAttributedString(string: "\n", attributes: [NSMutableAttributedString.Key.font: titleFont])
        title.append(char)
        title.append(subtitle)
        button.setAttributedTitle(title, for: .normal)
    }
    
    // To prevent showing the popover full-screen
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

extension UITableView {
    
    func indexPathHasValidCount(_ indexPath: IndexPath) -> Bool {
        return indexPath.count == 2
    }
    
    func indexPathIsInBounds(_ indexPath: IndexPath) -> Bool {
        return indexPath.section >= 0 && indexPath.row >= 0 && indexPath.section < numberOfSections && indexPath.row < numberOfRows(inSection: indexPath.section)
    }
    
    /// Returns a zero-based absolute position index belonging to a given an `IndexPath` position inside the `UICollectionView` or `nil` if the `IndexPath` represents an invalid position.
    ///
    /// - Parameter indexPath: `IndexPath` representing a position in the `UICollectionView`
    /// - Returns: zero-based absolute position index or `nil`
    func absoluteIndex(with indexPath: IndexPath) -> Int? {
        guard indexPathHasValidCount(indexPath), indexPathIsInBounds(indexPath) else { return nil }
        var index = 0
        if indexPath.section > 0 {
            for i in 0..<indexPath.section {
                index += numberOfRows(inSection: i)
            }
        }
        index += (indexPath.row)
        return index
    }
}
