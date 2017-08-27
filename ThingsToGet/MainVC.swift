//
//  MainVC.swift
//  ThingsToGet
//
//  Created by Ernest Delgado on 8/21/17.
//  Copyright © 2017 Ernest Delgado. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = [ListItem]()
    var filteredItems = [ListItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        fillList()
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemViewCell", for: indexPath) as? itemViewCell {
            let item = items[indexPath.row]
            cell.updateUI(item: item)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
    
    func fillList(){
        var item = ListItem(image: #imageLiteral(resourceName: "aquafina"), item: "Aquafina")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pepsi"), item: "Pepsi")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pepsiCherry"), item: "PepsiCherry")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "mountainDew"), item: "MountainDew")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "dietGingerAle"), item: "DietGingerAle")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "gingerAle"), item: "GingerAle")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "dietPepsi"), item: "DietPepsi")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "dietPepsiCherry"), item: "DietPepsiCherry")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pepsiMax"), item: "PepsiMax")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "dietMountainDew"), item: "DietMountainDew")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "brisk"), item: "Brisk")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "seltzerWaterOriginal"), item: "Seltzer")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "seltzerWaterLemonLime"), item: "Seltzer LemonLime")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "seltzerWaterRaspberryLime"), item: "Seltzer RaspberryLime")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "seltzerWaterOrange"), item: "Seltzer Orange")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeafDietLemon"), item: "PureLeaf DietLemon")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeafDietLemon"), item: "PureLeaf Lemon")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeafPeach"), item: "PureLeaf Peach")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeafRaspberry"), item: "PureLeaf Raspberry")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeafSweetTea"), item: "PureLeaf SweetTea")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeafUnsweetened"), item: "PureLeaf Unsweetened")
        items.append(item)
        
    }
    


}

