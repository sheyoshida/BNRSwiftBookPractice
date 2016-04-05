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
    // let region = "South" // read only property (can not be changed thanks to "let")
    static let region = "South" // stored "type property" has preset default value, no initializers, can not be overrided from subclass, if setting type property in class use "class" keyword instead. 
    var numberOfStoplights = 4

    var population = 5422 {
        didSet(oldPopulation) { // didSet = property observer - used to track changes
            print("The population has changed to \(population) from \(oldPopulation).")
        }
    }
    
    enum Size { // can not be accessed outside of Town
        case Small
        case Medium
        case Large
    }
    
//    lazy var townSize: Size = { // lazy stores value that will not be known until after instance is created
//        switch self.population { // self is used to imply we are using the instance's properties
//        case 0...10000:
//            return Size.Small
//        case 10001...100000:
//            return Size.Medium
//        default:
//            return Size.Large
//        }
//    }() // this statement is also a closure...
    
// NOTE: Lazy properties do not recalculate values once they have been set the first time... So for this case, we use a Computed Property:

    var townSize: Size {
        get { // "read only" because there is no setter in this function
            switch self.population { // self is used to imply we are using the instance's properties
            case 0...10000:
                return Size.Small
            case 10001...100000:
                return Size.Medium
            default:
                return Size.Large
            }
        }
    }
    
    // you can add instance methods to your struct:
    func printTownDescription() {
        print("population: \(population); number of stoplights: \(numberOfStoplights)")
    }
    
    // if a function changes a struct's info, it must be marked as "mutating"
    mutating func changePopulation(amount: Int) {
        population += amount 
    }
    
}


