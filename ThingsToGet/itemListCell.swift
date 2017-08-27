//
//  itemListCell.swift
//  ThingsToGet
//
//  Created by Ernest Delgado on 8/21/17.
//  Copyright © 2017 Ernest Delgado. All rights reserved.
//

import UIKit

class itemListCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var numberOfCasesLbl: UILabel!
    @IBOutlet weak var numberOfSinglesLbl: UILabel!
    
    private var numberOfCases: Int = 0
    private var numberOfSingles: Int = 0
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        numberOfCases = 0
        numberOfSingles = 0
        numberOfCasesLbl.text = "\(numberOfCases)"
        numberOfSinglesLbl.text = "\(numberOfSingles)"
    }

    func updateUI(item: ListItem){
        self.itemImage.image = item.image
        self.itemNameLbl.text = item.itemName
    }
    
    @IBAction func casesUpPushed(_ sender: Any) {
        numberOfCases += 1
        numberOfCasesLbl.text = "\(numberOfCases)"
    }
    @IBAction func casesDownPushed(_ sender: Any) {
        numberOfCases -= 1
        numberOfCasesLbl.text = "\(numberOfCases)"
    }
    @IBAction func singlesUpPushed(_ sender: Any) {
        numberOfSingles += 1
        numberOfSinglesLbl.text = "\(numberOfSingles)"
    }
    @IBAction func singlesDownPushed(_ sender: Any) {
        numberOfSingles -= 1
        numberOfSinglesLbl.text = "\(numberOfSingles)"
    }
    

}
