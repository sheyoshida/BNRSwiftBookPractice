//
//  Monster.swift
//  MonsterTown
//
//  Created by Shena Yoshida on 3/24/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import Foundation

/*
CLASSES:
- Like structs, classes are used to model related data under a common type.
- Classes have inheritance (subclasses), structs do not...

*/

class Monster {
    var town: Town?
    var name = "Monster"
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }

}

class Zombie: Monster {
    var walksWithLimp = true
    
    override func terrorizeTown() { // you can override superclass functions... 
        town?.changePopulation(-10)
        super.terrorizeTown()
    }
    
}