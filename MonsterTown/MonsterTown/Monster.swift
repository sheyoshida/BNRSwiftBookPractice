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





