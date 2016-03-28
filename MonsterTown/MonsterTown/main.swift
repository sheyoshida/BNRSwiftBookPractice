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


var myTown = Town()
myTown.changePopulation(500)

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()

fredTheZombie.town?.printTownDescription()
fredTheZombie.changeName("Fred The Zombie", walksWithLimp: false)

let countDracula = Vampire()
countDracula.town = myTown
countDracula.terrorizeTown()
countDracula.terrorizeTown()
countDracula.town?.printTownDescription()
print(countDracula.vampireThralls)

let spookyNoise = Zombie.makeSpookyNoise() // type method can only be called on type/class
