//
//  Item.swift
//  Homepwner
//
//  Created by Shena Yoshida on 4/28/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: NSDate
    
/*
     user can initialize Item two ways:
     DESIGNATED INITIALIZER
     1) Item(name: String, serialNumber: String?, valueInDollars: Int)
     CONVENIENCE INITIALIZER
     2) Item(random = true) // randomly generated object
     3) Item(random = false) // returns empty cell
 */
    
    init(name: String, serialNumber: String?, valueInDollars: Int) { // 1) designated initializer, ensure all properties have a value.
        
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = NSDate()
        
        super.init()
    }
    
    convenience init(random: Bool = false) { // 2) convenience initializer
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count)) // generate random no from adj.count
            let randomAdjective = adjectives[Int(idx)] // use rando no to select item from index
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100)) // random Int between 0...100
            let randomSerialNumber = NSUUID().UUIDString.componentsSeparatedByString("-").first!
            
            self.init(name: randomName,
                      serialNumber: randomSerialNumber,
                      valueInDollars: randomValue)
        }
        else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
    }
    
    
    
    
}
