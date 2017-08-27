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
    var cases: Int = 0
    var singles: Int = 0
    
    init(image: UIImage, item: String){
        self.image = image
        self.itemName = item
    }
}
