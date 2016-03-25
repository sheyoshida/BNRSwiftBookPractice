//
//  Town.swift
//  MonsterTown
//
//  Created by Shena Yoshida on 3/24/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import Foundation

/*
STRUCTS: 
- A type that groups a set of related chunks of data together in memory.
- Making "Town" a struct encapsulates its data within a single type.
- Placing its definition in its own file, provides a convenient locatin to find its implementation.
- Variables contained in a struct are called "Properties". They can be variable or constant.
*/

struct Town {
    var population = 5422 // properties
    var numberOfStoplights = 4
    
    // you can add instance methods to your struct: 
    func printTownDescription() {
        print("population: \(population); number of stoplights: \(numberOfStoplights)")
    }
    
    // if a function changes a struct's info, it must be marked as "mutating"
    mutating func changePopulation(amount: Int) {
        population += amount 
    }
    
}


