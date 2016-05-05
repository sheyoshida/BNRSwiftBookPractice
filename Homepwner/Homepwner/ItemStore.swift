//
//  ItemStore.swift
//  Homepwner
//
//  Created by Shena Yoshida on 4/28/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

/* 
ItemStore is our MODEL that populates the tableView - we do this to add a layer of abstraction between the Item class and viewController as we are following a DEPENDENCY INVERSION PRINCIPLE pattern. This makes our app faster!
*/

class ItemStore { // does not inherit from any other class = base class
    
    var allItems = [Item]() // store list in array of Items
    
    
    func createItem() -> Item { // create random item, add to allItems array, return newItem
       
        let newItem = Item(random: true)
        allItems.append(newItem)
        
        return newItem
    }
    
//    // implement designated initializer to add five random items with a loop
//    init() {
//        for _ in 0..<5 {
//            createItem()
//        }
//    }
    
    
    
    
}
