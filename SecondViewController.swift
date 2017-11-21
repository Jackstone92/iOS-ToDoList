//
//  SecondViewController.swift
//  To Do List
//
//  Created by Rob Percival on 17/06/2016.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var itemTextField: UITextField!
    @IBAction func add(_ sender: AnyObject) {
        
        // get UserDefaults //
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        // set global items to String array //
        var items:[String]
        
        // if UserDefaults item returns String array //
        if let tempItems = itemsObject as? [String] {
            // set global items to UserDefaults items //
            items = tempItems
            // append itemTextField text to array //
            items.append(itemTextField.text!)
            print(items)
        } else {
            // else, add itemTextField text to array //
            items = [itemTextField.text!]
            
        }
        
        // set UserDefaults //
        UserDefaults.standard.set(items, forKey: "items")
        
        // reset itemTextField //
        itemTextField.text = ""
        
        // close keyboard on button press //
        self.view.endEditing(true)
        
    }
    
    // Keyboard functionality //
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // close keyboard if tap outside of keyboard //
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // close keyboard if tap return //
        textField.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

