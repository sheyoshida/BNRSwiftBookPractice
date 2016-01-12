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

let townDescripion = "\(townName) has a population of \(population). There are \(numberOfStoplights) stoplights and \(numberOfDogs) dogs. The unemployment rate is \(unemploymentRate)." // string interpolation

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

// Operations on Integers

let numOfPeople: UInt = 40
let volAdjustment: Int32 = -1000

print(10 + 20)
print(30 - 5)
print(5 * 6)

// use parenthesis to make your operations explicit, they are always evaluated first

print(10 + 2 * 5) // 20, because 2 * 5 is evaluated first
print((10 + 2) * 5) // 60, 10 + 2 is evaluated first
print(30 - 5 - 5) // 20, because 30 - 5 is evaluated first
print(30 - (5 - 5)) // 30, because 5 - 5 is evaluated first

print(11 / 3) // 3 with no remainder as this is an integer
print(11 % 3) // 2 is the remainder of this equation 

// operator shorthand

var x = 10
x++
print("x has been incremented to \(x)")

x--
print("x has been deccremented to \(x)")

x += 10 // x = x + 10, you can also use -=, *=, /=

// overflow operators

let y: Int8 = 120
let z = y &+ 10 // this crashes without the "&" (Overflow Operator) as Swift expects z to be an Int8, just like y. Int8 can only hold values from -128 to 127.

print("120 &+ 10 is \(z)") // -126 is unexpected here, due to Int8.

// converting between integer types

let a: Int16 = 200
let b: Int8 = 50
//let c = a + b // this crashes because a and b are not the same type. 
let c = a + Int16(b) // convert it like this

// floating point numbers (numbers with decimals)

// since double is larger, it is more precise and is the DEFAULT floating-point number in Swift

let d1 = 1.1 // implicitly double
let d2: Double = 1.1 // 64-bit
let f1: Float = 100.3 // 32-bit

// Switch statements

// when an if/else statement gets complex, it is good practice to use a switch statement.

var statusCode: Int = 405
var errorString: String = "The request failed with the error:" // default statement for control transfer statement / fallthrough

switch statusCode {
//case 400:
//    errorString = "Bad request"
//case 401:
//    errorString = "Unauthorized"
//case 402:
//    errorString = "Forbidden"
//case 403:
//    errorString = "Not Found"
//default:
//    errorString = "None"

// refactored code:
case 400, 401, 403, 404:
errorString = "there was something wrong with the request." // append string
fallthrough // fallthrough keyword
default:
    errorString += " please review the request and try again." // append string
}
































