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

let numberOfDogs: Int = 15 // constant (let) = immutable types

var population: Int // declare empty variable
population = 4220000 // give it a value

let townName: String = "Kamloops"

var unemploymentRate: Int = 2

let townDescripion = "\(townName) has a population of \(population). There are \(numberOfStoplights) stoplights and \(numberOfDogs) dogs. The unemployment rate is \(unemploymentRate)." // string interpolation
print(townDescripion)

// chapter 3 - conditionals

var message: String
var hasPostOffice: Bool = false

if population < 10000 {
    message = "\(population) is a small town!"
} else {
    message = "\(population) is pretty big!"
}
print(message)

if !hasPostOffice { // is no true
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

// integers are stored in binary form with a fixed number of bits - a bit is a single 0 or 1. Each bit position represents a power of 2. A regular Int is a 64-bit integer, meaning it has 2^64 possible values. Earlier devices were made with a 32-bit architecture (2^32). The compiler determines the appropriate size for int wen it builds your program.

print("the maximum value for a 64-bit integer is \(Int64.max).")
print("the minimum value for a 64-bit integer is \(Int64.min).")

print("the maximum value for a 32-bit integer is \(Int32.max).")
print("the minimum value for a 32-bit integer is \(Int32.min).")

print("the maximum value for a 16-bit integer is \(Int16.max).")
print("the minimum value for a 16-bit integer is \(Int16.min).")

print("the maximum value for a 8-bit integer is \(Int8.max).")
print("the minimum value for a 8-bit integer is \(Int8.min).")

// all of these types are "signed" - meaning they can be either + or - (ie: NSInteger)
// you can create a + integer by using UInt (ie: NSUInteger)

print("the maximum value for a UInt integer is \(UInt.max).") // Unsigned (+ whole numbers or 0, no negative numbers allowed!)
print("the minimum value for a UInt integer is \(UInt.max).") // same value as max!

// BEST PRACTICE: use Int for all integer uses (including counts) unless an "unsigned integer" (no negative values) is required by the algorithm or code you are writing.

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

// since DOUBLE is larger, it is more precise and is THE DEFAULT floating-point number in Swift

let d1 = 1.1 // implicitly double
let d2: Double = 1.1 // 64-bit
let f1: Float = 100.3 // 32-bit
let d3 = d1 + d2 + Double(f1) // convert it!

// Switch statements

// when an if/else statement gets complex, it is good practice to use a switch statement.

var statusCode: Int = 405
var errorString: String = "The request failed with the error:" // default statement for CONTROL TRANSFER STATEMENT / FALLTHROUGH

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
fallthrough // use fallthrough keyword...
default:
    errorString += " please review the request and try again." // append string
}

// VERY COOL NON BOOK DISCOVERY!!! You can perform these functions on SETS.

let array1 = ["a", "b", "c"]
let array2 = ["a", "b", "d"]

let set1 = Set(array1) // create set
let set2 = Set(array2)

set1.union(set2)        // {"a", "b", "c", "d"} // not necessarily in this order...
set1.intersect(set2)    // {"a", "b"}
set1.subtract(set2)     // {"c"}
set1.exclusiveOr(set2)  // {"c", "d"}

// RANGES! 

// we can examine a RANGE of values with 1...10 (this includes both 1 and 10)
// you can also add multiple switch statement cases with a comma
// value binding can be added to strings with \() syntax

var secretCode: Int = 204
var errorMessage: String = "The request failed with an error:"

switch secretCode {
case 100, 101: // check out this comma!
    errorMessage += " Informational, \(secretCode)" // value binding with \()
case 204:
    errorMessage += " Successful but no content, 204." // appending strings with +=
case 300...307: // here is a range 300 to 307
    errorMessage += " Redirection, \(secretCode)"
case 308...400:
    errorMessage += " Client error, \(secretCode)"
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505: // create WHERE CLAUSE filter to catch extra conditions
    errorMessage = "\(unknownCode) is not a known error code."
default:
    errorString = "Unknown error encountered." // changing var string (no +=)
}

// Tuples

//let error = (secretCode, errorMessage) // you can use tuples to group variables that are related - in one line!!
//error.0 // you can access elements of a tuple by their index
//error.1

// but that's not very intuitive... we can name the tuple's elements...
let error = (code: secretCode, error: errorMessage)
error.code // and then call them by name!
error.error

// Pattern Matching

let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode) // this is a tuple that binds the first and second error together. Cool!

switch errorCodes {
case (404, 404): // we search for tuples like this
    print("no items found.")
case (404, _): // the "_" is a wildcard that matches ANYTHING.
    print("first item not found.")
case (_, 404):
    print("second item not found.")
default:
    print("all items found")
}

// Switch vs if/else

// switch statements are useful for comparing a value against MULTIPLE potentially matching cases.
// if/else statements are better used for checking against a SINGLE condition. 

let age = 25
if case 18...35 = age where age >= 21 { // WHOA: you can include a where clause in an if statement...
    print("in a cool demographic and can shop at the wine store")
}
// only use this technique if you do not need a default case. 

// CHALLENGE: 

let point = (x: 1, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
case let q2 where (point.x < 0) && (point.y > 0):
    print("\(q2) is in quadrant 2")
case let q3 where (point.x > 0) && (point.y < 0):
    print("\(q3) is in quadrant 3")
case let q4 where (point.x < 0) && (point.y < 0):
    print("\(q4) is in quadrant 4")
    default:
    print("case not covered.")
}
// this maps out a graph with x, y coordinates and plots quadrant location! 1,4 would be in q1. 

// LOOPS!

// the FOR / IN loop - best used when th enumber of iterations is known or easy to derive.
var myFirstInt: Int = 0

for i in 1...5 { // from 1 - 5
    ++myFirstInt // add 1 to each iteration
    print("myFirstInt equals \(myFirstInt) at iteration \(i)") // 1, 2, 3, 4, 5
}

// you can also use CASE statements in For loops!! 
// Case statements will be more useful once we review collections!
for case let i in 1...10 where i % 3 == 0 { // print out multiples of 3 in range 1 - 10.
    print(i)
}

// is equal to:
for i in 1...10 { // this method is less elegant as there are more lines of code.
    if i % 3 == 0 {
        print(i)
    }
}

// Swift also supports the classic for loop:
for var i = 1; i < 10; i++ {
    if i % 3 == 0 { // and the nested for loop
        print(i)
    }
}

// the WHILE loop will continue as long as a certain condition is met.
// while loops are best for circumstances where the number of iterations the loop will pass through is unknown.
var i = 1
while i < 6 {
    ++myFirstInt
    print(myFirstInt)
    ++i
}

// Repeat While Loops
// this is called a Do While loop in other languages

var shields = 0
repeat {
print("Fire those blasters")
} while shields > 0 // this case creates an infinite loop

// Control Transfer Statements, Redux

var shield = 5
var blastersOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0

//while shield > 0 {
//    if spaceDemonsDestroyed == 10 {
//        print("You beat the game!")
//        break // add break to end the infinite loop
//    }
//    if blastersOverheating {
//        print("Blasters are overheated! Cooldown initiated.")
//        sleep(5)
//        print("Blasters ready to fire.")
//        sleep(1)
//        blastersOverheating = false
//        blasterFireCount = 0
//    }
//    if blasterFireCount > 5 {
//        blastersOverheating = true
//        continue
//    }
//    // Fire blasters!
//    print("Fire blasters!")
//    ++blasterFireCount
//    ++spaceDemonsDestroyed
//}

// Challenge: 
// print even numbers up to 100 five times.

var chickens = 0
var count = 10

for var i = 0; i <= count; i++ {
    for var j = 1; j <= 5; j++ {
        if i % 2 == 0 {
            print(i)
        }
    }
}

// Strings: 

let playground = "Hello, playground"
var mutablePlayground = "Hello, mutable playground"
mutablePlayground += "!!"

for c: Character in mutablePlayground.characters { // print out individual characters
    print("\(c)")
}

// swift strings are composed of "Unicode scalars". 21-bit numbers that represent a specific character in the Unicode standard. ie: U+0061 is the Latin small letter "a". U+1F60E is a smiley emoji with sunglasses 😎 so...

let oneCoolDude = "\u{1F60E}" // emoji!
let grimacingDude = "\u{1F62C}" // more emoji!!
let aAcute = "\u{0061}\u{0301}" // accents!!

// the "\u{}" syntax represents a Unicode scalar

for scalar in playground.unicodeScalars {
    print("\(scalar.value)") // each number represents the scalar value of each letter in the "Hello playground" string
}

// Indices and Ranges: 

// because strings can be thought of as ordered collections of characters, you can call 
let fromStart = playground.startIndex
let toPosition = 4 // the first position is 0
let end = fromStart.advancedBy(toPosition)
let fifthCharacter = playground[end] // 0 = fifth char of "hello"
let range = fromStart...end
let firstFive = playground[range]

// Optionals:

// special feature used to indicate that an instance may not have a value. 
// When you see an optional, you know one of two things about that instance: either it has a value and is ready for use, or has no value.
// If an instance has no value, we say it is nil.
// You can use optionals with any type that is potentially nil. 

// Optional Types:

// Optionals make Swift safer. An instance that may potentially be nil should be declared an optional type. This prevents crashes!
// Let's declare an optional type: 

var errorCodeString: String? // the ? makes errorCodeString an optional of the type String.
//errorCodeString = "404" // thanks to optionals, if this line is nil, the program won't crash.
print(errorCodeString)

if errorCodeString != nil {
    let theError = errorCodeString! // ! = forced unwrapping
    print(theError)
}

// forced unwrapping accesses the underlying value of th eoptional, which allows you to gran "404" and assign it to the constant theError. 
// forced = it will try to acces the underlying value whether or not there is a value at all. 
// the danger of forced unwrapping: if there is no value inside of the optional, the program will crash at runtime. Use these sparingly. 

// Optional Binding: 

// this is a useful pattern to detect if an optional contains a value. 
//if let temporaryConstant = anOptional {
//    // do something with temporaryConstant
//} else {
//    // there was no value in anOptional / anOptional is nil
//}



// CODING CHALLENGE: FizzBuzz / CracklePop...

// My first coding language is Objective C and I'm learning to write in Swift, so my first instinct was to use the traditional for loop:
for i = 1; i <= 100; i++ {
    if (i % 3 == 0) && (i % 5 == 0) {
        print("CracklePop")
    } else {
        if i % 3 == 0 {
            print("Crackle")
    } else {
        if i % 5 == 0 {
            print("Pop")
    } else {
            print("\(i)")
            }
        }
    }
} // but this method has so many brackets...

// So I refactored it as a function with a recursive switch statement!
func cracklePop(i: Int) -> String {
    let result = (i % 3, i % 5)
    switch result {
    case (0, 0):
        return "CracklePop"
    case (0, _):
        return "Crackle"
    case (_, 0):
        return "Pop"
    default:
        return "\(i)"
    }
}

for number in 1...100 {
    print(cracklePop(number))
}































































