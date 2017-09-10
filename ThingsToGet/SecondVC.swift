//
//  SecondVC.swift
//  ThingsToGet
//
//  Created by Ernest Delgado on 8/27/17.
//  Copyright © 2017 Ernest Delgado. All rights reserved.
//

import UIKit

class SecondVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var casesLbl: UILabel!
    @IBOutlet weak var singlesLbl: UILabel!
    @IBOutlet weak var comment: UITextField!
    
    
    var item: ListItem!
    var cases: Int = 0
    var singles: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.comment.delegate = self
        updateUI(item: item)
        
    }

    func updateLabels(){
        casesLbl.text = "\(cases)"
        singlesLbl.text = "\(singles)"
    }
    
    func updateUI(item: ListItem){
        updateLabels()
        itemImage.image = item.image
        itemName.text = item.itemName.capitalized
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    

    @IBAction func casesUp(_ sender: Any) {
        cases += 1
        updateLabels()
    }
    @IBAction func casesDown(_ sender: Any) {
        if cases > 0 {
            cases -= 1
        }
        updateLabels()
    }
    @IBAction func singlesUp(_ sender: Any) {
        singles += 1
        updateLabels()
    }
    @IBAction func singlesDown(_ sender: Any) {
        if singles > 0 {
            singles -= 1
        }
        updateLabels()
    }
    @IBAction func addToList(_ sender: Any) {
        item.cases = Int(casesLbl.text!)!
        item.singles = Int(singlesLbl.text!)!
        item.comment = comment.text!
    }
    
}
