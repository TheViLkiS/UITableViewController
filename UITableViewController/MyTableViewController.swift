//
//  MyTableViewController.swift
//  UITableViewController
//
//  Created by Дмитрий Гусев on 18.03.2023.
//

import UIKit

class MyTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var isPushSwitch: UISwitch!
    
    
    @IBOutlet weak var pol: UISegmentedControl!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load
        
        if let name = userDefaults.object(forKey: "name") {
            nameTextField.text = name as? String
        }
        if let last = userDefaults.object(forKey: "lastName"){
            lastNameTextField.text = last as? String
        }
        if let isSwitch = userDefaults.object(forKey: "switch"){
            isPushSwitch.isOn = isSwitch as! Bool
        }
        if let poll  = userDefaults.object(forKey: "segment") {
            pol.selectedSegmentIndex = poll as! Int
        }

        

        
        
    }



    
    @IBAction func saveButton(_ sender: UIButton) {
        userDefaults.setValue(nameTextField.text, forKey: "name")
        userDefaults.setValue(lastNameTextField.text, forKey: "lastName")
        userDefaults.set(isPushSwitch.isOn, forKey: "switch")
        userDefaults.set(pol.selectedSegmentIndex, forKey: "segment")
        print("save")
        lastNameTextField.resignFirstResponder()

    }
    
}
