//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Shena Yoshida on 4/28/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(sender: AnyObject) {
//        // add new index path for 0th section, last row
//        let lastRow = tableView.numberOfRowsInSection(0)
//        let indexPath = NSIndexPath(forRow: lastRow, inSection: 0)
//        
//        // insert this new row into the table
//        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        // create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        // figure out where that item is in the array
        if let index = itemStore.allItems.indexOf(newItem) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            
            // insert this row into the table
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
    }
    
    @IBAction func toggleEditingMode(sender: AnyObject) {
        // if you are currently in eidting mode...
        if editing {
            // change text of button to inform user of state
            sender.setTitle("Edit", forState: .Normal)
            
            // turn off editing mode
            setEditing(false, animated: true)
        }
        else {
            // change text of button to inform user of state
            sender.setTitle("Done", forState: .Normal)
            
            // enter editing mode
            setEditing(true, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get height of status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//
//        return 1
//    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // create instance of UITableViewCell, with default appearance
//        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "UITableViewCell")
        
        // get new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        // set text on the cell with the item description
        // that is the nth index of items, where n = row this cell
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    
    
    
}
