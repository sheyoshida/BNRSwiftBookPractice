//
//  main.swift
//  MonsterTown
//
//  Created by Shena Yoshida on 3/24/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

/*
We will define types and create instances of them in this file.
*/

import Foundation


//var myTown = Town() // create instance of Town

var myTown = Town(numberOfStoplights: 6, population: 10000) // initialized in town.swift
let ts = myTown.townSize
print(ts)

myTown.changePopulation(1000000) // note: lazy property is not updated after it is calculated the first time
print("Size: \(myTown.townSize); population: \(myTown.population)")

var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
//fredTheZombie.town = myTown
//fredTheZombie.terrorizeTown()

fredTheZombie?.town?.printTownDescription()
fredTheZombie?.changeName("Fred The Zombie", walksWithLimp: false)

var convenintZombie = Zombie(limp: true, fallingApart: false)

let countDracula = Vampire(town: myTown, monsterName: "Count Dracula")
countDracula.town = myTown
countDracula.terrorizeTown()
countDracula.terrorizeTown()
countDracula.town?.printTownDescription()
print(countDracula.vampireThralls)

let spookyNoise = Zombie.makeSpookyNoise() // type method can only be called on type/class

// test out getters and setters 
print("Victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500 // access the setter...
print("Victim pool: \(fredTheZombie?.victimPool)")

// test static property: 
if Zombie.isTerrifying {
    print("run away!!")
}

fredTheZombie = nil // deinitialize

/*
ACCESS CONTROL:
 
 Module: 
 - unit of code that is distributed together (ie: uikit framework)
 Source Files: 
 - more discrete units that represent a single fiel and live within a single module
 - it is good practice to definie a single type within a source file to keep your project organized
 
 Public:
 - entities are visible to all files in the module, or those that improt the module
 Internal:
 - internal access (is default) makes entries visible to all files in the same module
 Private:
 - private access makes entities visible only within their defining source file
*/



