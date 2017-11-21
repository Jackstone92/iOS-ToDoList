//
//  FirstViewController.swift
//  To Do List
//
//  Created by Rob Percival on 17/06/2016.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    // set global items String array and initialise as empty array //
    var items: [String] = []

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create cell //
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        // set text to items array elements //
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    // lifetime function, whenever view is visible //
    override func viewDidAppear(_ animated: Bool) {
        // get UserDefaults items array //
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        // if itemsObject is [String] //
        if let tempItems = itemsObject as? [String] {
            // set global items to UserDefaults items //
            items = tempItems
        }
        // else, will just return an empty array //
        
        // reload table data //
        table.reloadData()
    }
    
    // provide ability to delete items from table view using commit editingStyle method //
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // if editingStyle is delete //
        if editingStyle == UITableViewCellEditingStyle.delete {
            // delete item from items array at indexPath.row //
            items.remove(at: indexPath.row)
            // reload table data to reflect changes //
            table.reloadData()
            // commit changes to UserDefaults //
            UserDefaults.standard.set(items, forKey: "items")
        }
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

