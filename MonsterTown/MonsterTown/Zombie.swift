//
//  Zombie.swift
//  MonsterTown
//
//  Created by Shena Yoshida on 3/28/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import Foundation

class Zombie: Monster {
    var walksWithLimp = true
    
    final override func terrorizeTown() { // you can override superclass functions... final means it can not be altered later
        if town?.population > 10 {
            town?.changePopulation(-10)
            super.terrorizeTown() // super is used to override or borrow functionality from a superclass.
        }
        
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp 
    }
}