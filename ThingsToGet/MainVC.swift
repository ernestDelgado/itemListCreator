//
//  MainVC.swift
//  ThingsToGet
//
//  Created by Ernest Delgado on 8/21/17.
//  Copyright © 2017 Ernest Delgado. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var itemSearch: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = [ListItem]()
    var filteredItems = [ListItem]()
    var pickUpItems = [ListItem]()
    
    var inSearch = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        itemSearch.delegate = self
        fillList()
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemViewCell", for: indexPath) as? itemViewCell {
            
            let item: ListItem!
            
            if inSearch {
                item = filteredItems[indexPath.row]
                cell.updateUI(item: item)
            }else {
                item = items[indexPath.row]
                cell.updateUI(item: item)
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearch {
            return filteredItems.count
        } else {
            return items.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if inSearch {
            let item = filteredItems[indexPath.row]
            performSegue(withIdentifier: "SecondVC", sender: item)
        } else {
            let item = items[indexPath.row]
            performSegue(withIdentifier: "SecondVC", sender: item)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondVC" {
            if let dest = segue.destination as? SecondVC {
                if let item = sender as? ListItem {
                    dest.item = item
                }
            }
        } else {
            if let dest = segue.destination as? ThirdVC {
                if let pickUpList = sender as? [ListItem] {
                    dest.pickUpItems = pickUpList
                }
            }
        }
        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if itemSearch.text == nil || itemSearch.text == "" {
            inSearch = false
            collectionView.reloadData()
            view.endEditing(true)
        } else {
            inSearch = true
            let lower = itemSearch.text!.lowercased()
            filteredItems = items.filter({$0.itemName.range(of: lower) != nil })
            collectionView.reloadData()
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    
    
    
    @IBAction func unwindFromSecondVC (segue: UIStoryboardSegue){
        if let dest = segue.source as? SecondVC {
            pickUpItems.append(dest.item)
        }
    }
    @IBAction func unwindFromThirdVC (segue: UIStoryboardSegue){
        pickUpItems.removeAll()
    }
    @IBAction func unwindFromThirdVCBackButton (segue: UIStoryboardSegue){
        if let dest = segue.source as? ThirdVC {
            pickUpItems = dest.pickUpItems
        }
    }

    
    @IBAction func showList(_ sender: Any) {
        performSegue(withIdentifier: "ThirdVC", sender: pickUpItems)
    }
    
    func fillList(){
        var item = ListItem(image: #imageLiteral(resourceName: "aquafina"), item: "aquafina")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pepsi"), item: "pepsi")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "dietPepsi"), item: "diet pepsi")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pepsiCherry"), item: "pepsi cherry")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "dietPepsiCherry"), item: "diet pepsi cherry")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "mountainDew"), item: "mountain dew")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "dietMountainDew"), item: "diet mountain dew")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "brisk"), item: "brisk")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "gingerAle"), item: "gingerale")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "dietGingerAle"), item: "diet gingerale")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "seltzerWaterOriginal"), item: "seltzer")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "seltzerWaterLemonLime"), item: "seltzer lemon lime")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "seltzerWaterRaspberryLime"), item: "seltzer rasperry lime")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "seltzerWaterOrange"), item: "seltzer orange")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "Seltzer Black Cherry"), item: "seltzer black cherry")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "Seltzer Cranberry "), item: "seltzer cranberry")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeafDietLemon"), item: "pure leaf diet lemon")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeafMint"), item: "pure leaf mint")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeafPeach"), item: "pure leaf peach")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeafSweetTea"), item: "pure leaf sweet tea")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeafRaspberry"), item: "pure leaf raspberry")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeafUnsweetened"), item: "pure leaf unsweetened")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeafPomegranate"), item: "pure leaf pomegranate")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeaf ExtraSweetTea"), item: "pure leaf extra sweet tea")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "pureLeaf HoneyGreenTea"), item: "pure leaf honey green tea")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "OceanSpray Orange"), item: "ocean spray orange")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "OceanSpray RubyRed"), item: "ocean spray ruby red")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "OceanSpray Cranberry"), item: "ocean spray cranberry")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "OceanSpray CranGrape"), item: "ocean spray cran grape")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "Gatorade Red"), item: "gatorade red")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "Gatorade Blue"), item: "gatorade blue")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "Gatorade Orange"), item: "gatorade orange")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "Gatorade Yellow"), item: "gatorade yellow")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "Frapp Mocha"), item: "frappe mocha")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "Frapp Coffee"), item: "frappe coffee")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "Frapp Caramel"), item: "frappe caramel")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "Frapp Vanilla"), item: "frappe vanilla")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "DoubleShot Mocha"), item: "double shot mocha")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "DoubleShot Coffee"), item: "double shot coffee")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "DoubleShot Vanilla"), item: "double shot vanilla")
        items.append(item)
        item = ListItem(image: #imageLiteral(resourceName: "icedCoffee Black"), item: "iced coffee black")
        items.append(item)
    }
}


