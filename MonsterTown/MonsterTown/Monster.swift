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
- Classes have inheritance (ie: subclasses), structs do not... 
- You can also override (alter) superclass methods from a subclass.
 
Class Initialization: 
    - will be either:
 designated initializer: responsible for making sure that an instance's properties all have values before initialization completes, making instance ready to use! These are "unadorened" meaning no special keyword is placed before init. This is the default state.
 convenience initializer: supplement designated initializers by calling across a class to its designated initializer. The role is typically to create an instance of a class for a VERY SPECIFIC use... 
 
 default initializer:empty initializer is provided as long as you provide default values to all properties. Typically this is represented by empty parenthesis ie: Zombie()
 

*/

class Monster {
    
    static let isTerrifying = true // true for all instances of monster, including subclasses
    
    class var spookyNoise: String {
        return "Grrr"
    }
    var town: Town?
    var name: String
    
    var victimPool: Int {
        get { // getter: read data from a property
            return town?.population ?? 0
        }
        set(newVictimPool) { // setter: write data to a property
            // NOTE: properties with both a getter and setter are called read/write
            town?.population = newVictimPool
        }
    }
    
    init (town: Town?, monsterName: String) { // designated initializer (unadorened) 
        self.town = town
        name = monsterName
        
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}





