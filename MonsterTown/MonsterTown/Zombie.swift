//
//  Zombie.swift
//  MonsterTown
//
//  Created by Shena Yoshida on 3/28/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import Foundation

class Zombie: Monster {
    
    var walksWithLimp = true // computed property
    private(set) var isFallingApart = false // access control = getter is internal (default) and setter is private
    
    override class var spookyNoise: String { // override superclass
        return "braaiiins..."
    }
    
    class func makeSpookyNoise() -> String { // class type keyword can only be called on type itself
        let noise = "braaiiins..."
        print("\(noise)")
        return noise
    }
     
    final override func terrorizeTown() { // you can override superclass functions... final means it can not be altered later
        if town?.population > 10 && !isFallingApart {
            town?.changePopulation(-10)
            super.terrorizeTown() // super is used to override or borrow functionality from a superclass.
        }

        
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp 
    }
}