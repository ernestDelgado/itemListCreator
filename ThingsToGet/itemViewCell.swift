//
//  itemViewCell.swift
//  ThingsToGet
//
//  Created by Ernest Delgado on 8/27/17.
//  Copyright © 2017 Ernest Delgado. All rights reserved.
//

import UIKit

class itemViewCell: UICollectionViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    
    func updateUI(item: ListItem){
        itemImage.image = item.image
        itemName.text = item.itemName.capitalized
    }
    
}
