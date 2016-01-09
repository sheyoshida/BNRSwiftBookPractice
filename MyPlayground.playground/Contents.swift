//: Playground - noun: a place where people can play

import Cocoa

// chapter 1 - getting started

var str = "Hello, playground"
str += "!" // append to the end of string
print(str)

var lastName = "Yoshida"
print(lastName)


// chapter 2 - types, constants, and variables

var numberOfStoplights: Int = 10 // variable (var) = mutable type, but must be integer
numberOfStoplights += 2

let numberOfDogs: Int = 15 // constant (let) = immutable type

var population: Int // declare empty variable
population = 4220000

// give it a value later

let townName: String = "Kamloops"

var unemploymentRate: Int = 2

let townDescripion = "\(townName) has a population of \(population). There are \(numberOfStoplights) stop lights and \(numberOfDogs) dogs. The unemployment rate is \(unemploymentRate)." // string interpolation

print(townDescripion)

// chapter 3 - conditionals

var message: String
var hasPostOffice: Bool = true

if population < 10000 {
    message = "\(population) is a small town!"
} else {
    message = "\(population) is pretty big!"
}
print(message)

if !hasPostOffice {
    print("where do we buy stamps?")
}

// ternary operator a ? b : c
// this is similar to an if else statement
message = population < 1000 ? "\(population) is small town!" :
                                "\(population) is pretty big!"

// else if
if population < 10000 {
    message = "\(population) is a small town!"
} else if population >= 10000 && population < 50000 {
        message = "\(population) is a medium town!"
} else if population >= 50000 && population < 100000 {
    message = "\(population) is pretty big!"
} else {
    message = "\(population) is huge!"
}

print(message)


// chapter 4 - Numbers

print("the maximum Int value is \(Int.max).") // Int = Int64
print("the minimum Int value is \(Int.min).")

// integers are stored in binary form witha fixed number of bits - a bit is a single 0 or 1. Each bit position represents a power of 2. A regular Int is a 64-bit integer, meaning it has 2 to the power of 64 possible values. Earlier devices were made with a 32-bit architecture. The compiler determines the appropriate size for int wen it builds your program. 

print("the maximum value for a 64-bit integer is \(Int64.max).")
print("the minimum value for a 64-bit integer is \(Int64.max).")

print("the maximum value for a 32-bit integer is \(Int32.max).")
print("the minimum value for a 32-bit integer is \(Int32.max).")

print("the maximum value for a 16-bit integer is \(Int16.max).")
print("the minimum value for a 16-bit integer is \(Int16.max).")

print("the maximum value for a 8-bit integer is \(Int8.max).")
print("the minimum value for a 8-bit integer is \(Int8.max).")

// all of these types are "signed" - meaning they can be either + or - (ie: NSInteger)
// you can create a + integer by using UInt (ie: NSUInteger)

print("the maximum value for a UInt integer is \(UInt.max).")
print("the minimum value for a UInt integer is \(UInt.max).") // same value as max!

// BEST PRACTICE: use Int for all integer uses (including counts) unless an unsigned integer is required by the algorithm or code you are writing.

let numberOfPages: Int = 10 // declare type explicitly
let numberOfChapters = 3 // type inferred by the compiler

let numberOfPeople: UInt = 40
let volumeAdjustment: Int32 = -1000





















