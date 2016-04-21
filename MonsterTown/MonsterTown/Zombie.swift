//
//  Zombie.swift
//  MonsterTown
//
//  Created by Shena Yoshida on 3/28/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import Foundation

class Zombie: Monster {
    
    var walksWithLimp: Bool
    private(set) var isFallingApart: Bool // access control = getter is internal (default) and setter is private
    
    override class var spookyNoise: String { // override superclass
        return "eat braaiiins..."
    }
    
    class func makeSpookyNoise() -> String { // class type keyword can only be called on type itself
        let noise = "oh braaiiins..."
        print("\(noise)")
        return noise
    }
    
    init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    
    convenience init(limp: Bool, fallingApart: Bool) { // convenience initializer
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walksWithLimp {
            print("this zombie has a bad knee.")
        }
    }
    
    required init(town: Town?, monsterName: String) {
        walksWithLimp = false
        isFallingApart = false
        super.init(town: town, monsterName: monsterName)
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
    
    deinit {
        print("Zombie named \(name) is no longer with us. :(")
    }
}