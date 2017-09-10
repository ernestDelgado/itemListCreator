//
//  ThirdVC.swift
//  ThingsToGet
//
//  Created by Ernest Delgado on 8/29/17.
//  Copyright © 2017 Ernest Delgado. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var itemListTableView: UITableView!
    
    var pickUpItems = [ListItem]()
    @IBOutlet weak var totalItemsLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemListTableView.delegate = self
        itemListTableView.dataSource = self
        itemListTableView.allowsSelection = false;
        totalItemsLbl.text = "\(pickUpItems.count) Items In List"
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "listItemViewCell") as? listItemViewCell {
            let item = pickUpItems[indexPath.row]
            cell.updateUI(item: item)
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickUpItems.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pickUpItems.remove(at: indexPath.row)
            itemListTableView.deleteRows(at: [indexPath], with: .fade)
            totalItemsLbl.text = "\(pickUpItems.count) Items In List"
        }
    }

    @IBAction func StartNewList(_ sender: Any) {
        createAlert(title: "ARE YOU SURE YOU WANT TO CREATE A NEW LIST?", message: "Doing so will erase your current list")
    }
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { (action) in
            self.performSegue(withIdentifier: "unwindFromThirdVC", sender: self)
            alert.dismiss(animated: true, completion: nil)
        } ))
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        } ))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    

}
