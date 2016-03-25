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
myTown.printTownDescription() // instance method

let gm = Monster()
gm.town = myTown
gm.terrorizeTown()

