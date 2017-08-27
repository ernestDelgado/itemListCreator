//
//  item.swift
//  ThingsToGet
//
//  Created by Ernest Delgado on 8/22/17.
//  Copyright © 2017 Ernest Delgado. All rights reserved.
//

import Foundation
import UIKit

class ListItem {
    var image: UIImage!
    var itemName: String!
    
    init(image: UIImage, item: String){
        self.image = image
        self.itemName = item
    }
}
