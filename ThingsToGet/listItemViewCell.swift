//
//  listItemViewCell.swift
//  ThingsToGet
//
//  Created by Ernest Delgado on 8/29/17.
//  Copyright © 2017 Ernest Delgado. All rights reserved.
//

import UIKit

class listItemViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var singlesLbl: UILabel!
    @IBOutlet weak var casesLbl: UILabel!
    @IBOutlet weak var itemComment: UILabel!
    @IBOutlet weak var itemName: UILabel!
    
    var item: ListItem!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateUI(item: ListItem){
        itemImage.image = item.image
        if item.singles == 0 {
            singlesLbl.text = ""
        }else{
            singlesLbl.text = "\(item.singles)"
        }
        if item.cases == 0 {
            casesLbl.text = ""
        }else{
            casesLbl.text = "\(item.cases)"
        }
        itemComment.text = item.comment
        itemName.text = item.itemName.capitalized
    }

}









