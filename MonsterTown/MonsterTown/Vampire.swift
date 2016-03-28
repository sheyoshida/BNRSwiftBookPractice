//
//  Vampire.swift
//  MonsterTown
//
//  Created by Shena Yoshida on 3/28/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import Foundation

class Vampire: Monster {
    
    var vampireThralls = Array<String>()
    
    override func terrorizeTown() {
        if town?.population > 1 {
            town?.changePopulation(-1)
            vampireThralls.append("a vampire")
            super.terrorizeTown()
        }
    }
    
}