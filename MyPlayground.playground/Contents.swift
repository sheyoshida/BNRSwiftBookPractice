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

if !hasPostOffice { // is not true
    print("where do we buy stamps?")
}

// ternary operator a ? b : c
// this is similar to an if else statement
message = population < 1000 ? "\(population) is small town!" : "\(population) is pretty big!"

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

print("the maximum value for a 64-bit integer is \(Int64.max).") // 9,223,372,036,854,775,807 (nine sextillion)
print("the minimum value for a 64-bit integer is \(Int64.min).")

print("the maximum value for a 32-bit integer is \(Int32.max).") // 2,147,483,647 (two billion)
print("the minimum value for a 32-bit integer is \(Int32.min).")

print("the maximum value for a 16-bit integer is \(Int16.max).") // 32,767
print("the minimum value for a 16-bit integer is \(Int16.min).")

print("the maximum value for a 8-bit integer is \(Int8.max).") // 127
print("the minimum value for a 8-bit integer is \(Int8.min).")

// all of these types are "signed" - meaning they can be either + or - (ie: NSInteger)
// you can create a + integer by using UInt (ie: NSUInteger)

print("the maximum value for a UInt integer is \(UInt.max).") // Unsigned (+ whole numbers or 0, no negative numbers allowed!)
print("the minimum value for a UInt integer is \(UInt.min).") // same value as max!

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
x += 1 // x++ was removed in Swift 2.2
print("x has been incremented to \(x)")

x -= 1 // x-- was removed in Swift 2.2
print("x has been deccremented to \(x)")

x += 10 // x = x + 10 you can also use -=, *=, /=

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

var statusCode: Int = 404
var errorString: String = "The request failed with the error: " // default statement for CONTROL TRANSFER STATEMENT / FALLTHROUGH

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
errorString += "there was something wrong with the request." // append string
fallthrough // use fallthrough keyword...
default:
    errorString += " Please review the request and try again." // append string
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
    myFirstInt += 1 // add 1 to each iteration
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

// BUT... Swift 2.2 no longer supports the classic for loop:
//for var i = 1; i < 10; i++ {
//    if i % 3 == 0 { // and the nested for loop
//        print(i)
//    }
//}

// the WHILE loop will continue as long as a certain condition is met.
// while loops are best for circumstances where the number of iterations the loop will pass through is unknown.
var i = 1
while i < 6 {
    myFirstInt += 1
    print(myFirstInt)
    i += 1
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

var count = 10
for i in 1...100 {
    for j in 1...5 { // create second loop to print variable 5 times
        if i % 2 == 0 {
//            print(i)
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
let fifthCharacter = playground[end] // o = fifth char of "hello"
let range = fromStart...end
let firstFive = playground[range]


// CODING CHALLENGE: FizzBuzz / CracklePop...

// My first coding language is Objective C and I'm learning to write in Swift, so my first instinct was to use the traditional for loop:
for i in 1...100 {
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

// So I refactored it as a function with a switch statement!
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
//    print(cracklePop(number))
}


// do it in one function... ...
func cracklePop() {
    
    for number in 1...100 {
        let result = (number % 3, number % 5) // use tuples!
        switch result {
        case (0, 0):
            print("CracklePop")
        case (0, _):
            print("Crackle")
        case (_, 0):
            print("Pop")
        default:
            print("\(number)")
        }
    }
}
cracklePop()

// Optionals:

// special feature used to indicate that an instance may not have a value.
// When you see an optional, you know one of two things about that instance: either it has a value and is ready for use, or has no value.
// If an instance has no value, we say it is nil.
// You can use optionals with any type that is potentially nil.

// Optional Types:

// Optionals make Swift safer. An instance that may potentially be nil should be declared an optional type. This prevents crashes!
// Let's declare an optional type:

var errorCodeString: String? // the ? makes errorCodeString an optional of the type String.
errorCodeString = "404" // thanks to optionals, if this line is nil, the program won't crash.
print(errorCodeString)

// Forced Unwrapping:

if errorCodeString != nil {
    let theError = errorCodeString! // ! = forced unwrapping
    print(theError)
}
// the danger of forced unwrapping: if there is no value inside of the optional, the program will crash at runtime. Use these sparingly.

// Optional Binding:

// this is a VERY useful pattern to detect if an optional contains a value. It is also safer than forced/implicit unwrapping. ;)

if let theError = errorCodeString {
    print(theError)
}

// Implicitly Unwrapped Optionals:

// not used often unless using class initialization
// these are like regular optional types, but do not need to be unwrapped!

var newErrorCodeString: String! // we declare these with a !
newErrorCodeString = "404"

// Optional Chaining: 

// this is a mechanism for querying an optional to determine whether it contains a value.
var chainedErrorCodeString: String?
chainedErrorCodeString = "404"
var errorDescription: String?
if let theError = chainedErrorCodeString, errorcodeInteger = Int(theError)
    where errorcodeInteger == 404 {
        errorDescription = ("\(errorcodeInteger + 200): the requested resource was not found.")

}

var upCaseErrorDescription = errorDescription?.uppercaseString // optional chaining will return an optional
errorDescription

// Modify an Optional in Place:

//add a call to appendContentsOf(_:) to do this. 
upCaseErrorDescription?.appendContentsOf(" PLEASE TRY AGAIN.")
upCaseErrorDescription

// Nil Coalescing Operator:

let description = errorDescription ?? "No error" // left part must be an optional to use this


// Part III - Collections and Functions:

/* Arrays: 
- unlike, Objective C, Swift's arrays can hold any type of object (or non object)
*/

// mutable variable of type array containing string types
//var bucketList: Array<String>
// this is the same as:
var bucketList: [String] // brackets indicate string type of array
bucketList = ["Climb Mt. Everest"] // add item to array

// or
var toDoList = ["Climb Mt. Everest"]

toDoList.append("Fly hot air balloon to Fuji") // add item to end of array
toDoList.append("Scuba dive in the Great Blue Hole")
toDoList.append("Find a triple rainbow")
toDoList.append("Build cool Swift app")
toDoList.append("Watch Lord of the Rings trilogy")

// manipulating arrays:

toDoList.removeAtIndex(5) // remove 6th element
toDoList[3] // access 4th item
toDoList.insert("Toboggan across Alaska", atIndex: 2) // add at specific spot, everything else is pushed over
toDoList
print(toDoList.count) // find number of items in list (remember: the index is always count - 1)
print(toDoList[0...2]) // print first 3 items

// append existing string
toDoList[2] += " and learn to dogsled"
toDoList[2]

toDoList[0] = "Climb Mt. Kilimanjaro" // replace first item
toDoList

// create lump of items to add to existing array:
var newItems = [ "Learn to Ski",
    "Build a website",
    "Study discrete math",
    "Write blog post" ]

// add items with a loop
//for item in newItems {
//    toDoList.append(item)
//}

// or append with the addition assignment operator...
toDoList += newItems
print(toDoList)

// comparing arrays: 
var listToCompare = [
    "Climb Mt. Kilimanjaro",
    "Fly hot air balloon to Fuji",
    "Toboggan across Alaska and learn to dogsled",
    "Scuba dive in the Great Blue Hole",
    "Find a triple rainbow",
    "Build cool Swift app",
    "Learn to Ski",
    "Build a website",
    "Study discrete math",
    "Write blog post"
]
print(listToCompare)

let equal = (toDoList == listToCompare) // order of elements matters

// IMMUTABLE Array: 

let lunches = [ // use let instead of var...
    "Cheeseburger",
    "Veggie Pizza",
    "Chicken Caesar Salad",
    "Black Bean Burrito",
    "Falafel wrap"
]

// Bronze Challenge: 

var toDoItems = [
    "take out garbage",
    "pay bills",
    "cross off finished items"
]

let searchItem = "pay bills" // search for item
if toDoItems.contains(searchItem) {
    print("yes, \(searchItem) is in the list.")
} else {
    print("no, \(searchItem) is not in the list.")
}
toDoItems

// Silver Challenge: 

var reversedList: [String] = [] // create new array to hold items
for item in toDoItems { // loop through original list
    reversedList.insert("\(item)", atIndex: 0) // add each item to start of reverse list - this will reverse it
}
print(reversedList)

// OR: do it with a built in function!
let reversedAnotherWay = reversedList.reverse()
let forwardsAgain = Array(reversedAnotherWay)

// this is the syntax for that:
let forwards = [1, 2, 3, 4]
let lazyBackwards = forwards.reverse()
let eagerBackwards = Array(lazyBackwards) // [4, 3, 2, 1]

// DICTIONARIES: 

/* 
- holds key-value pairs
- keys must be unique
- keys must be hashable (ie: type string, int, float, double)
*/

// there are FOUR ways to create a dictionary:
var dict1: Dictionary<String, Double> = [:] // [:] = literal syntax
var dict2 = Dictionary<String, Double>()
var dict3: [String:Double] = [:]
var dict4 = [String:Double]()
// each of these yields a fully initialized instance of the Dictionary type + holds a string(key) and double(value)

// Populating a dictionary: 
var movieRatings = ["donnie darko": 4, "air bud 3": 5, "home alone": 4, "snowpiercer": 4, "wayne's world": 4, "merry christmas mr bean": 7]

// Accessing and modifying a dictionary:

print("I have rated \(movieRatings.count) movies")

// access value for key
let darkoRating = movieRatings["donnie darko"]
print("darko rating: \(darkoRating)")

// add key and value to end of list
movieRatings["turner and hooch"] = 4

// modify value
movieRatings["turner and hooch"] = 3

// use optional binding to access old key value
let oldRating: Int? = movieRatings.updateValue(5, forKey: "turner and hooch") // use optional
if let lastRating = oldRating, currentRating = movieRatings["turner and hooch"] {
    print("old rating: \(lastRating); current rating: \(currentRating)")
}

// remove value
movieRatings.removeValueForKey("turner and hooch")
// or
movieRatings["turner and hooch"] = nil

// looping
for (key, value) in movieRatings {
    print("the movie \(key) was rated \(value).")
}

// just the keys please
for movie in movieRatings.keys {
    print("user has rated \(movie)")
}

// immutable dictionaries
let album = ["tigermilk": 1996, "the boy with the arab strap": 1997, "dear catastrophe waitress": 2003]

// translating dictionary to array
let watchedMovies = Array(movieRatings.keys)

// modify a value
movieRatings["air bud 3"] = 2
movieRatings.updateValue(10, forKey: "home alone") // updateValue could be an optional
movieRatings


// looping
/* 
- use a "for in" loop with a swift dictionary
- this mechanism breaks each entry into parts by providing temporary constants representing the key and value
- these constants re placed within a tuple that the for in loop can access inside of its body
*/

for (key, value) in movieRatings { // loop with a tuple!
    print("the movie \(key) was rated \(value)")
}

for movie in movieRatings.keys { // only access keys - you can also access .values
    print("user has rated \(movie).")
}

// Immutable Dictionaries
/* 
- works the same as an array 
- you use the "let" keyword to tell the Swift compiler that you do not want your instance of Dictionary to change
*/
let albums = [        "tigermilk": 1996,
     "if you're feeling sinister": 1996,
    "the boy with the arab strap": 1998,
                   "storytelling": 2002,
      "dear catastrophe waitress": 2003,
               "the life pursuit": 2006] // you can space them out to be more readable too! 

// translating a dictionary into an array:
let myWatchedMovies = Array(movieRatings.keys)

// silver challenge

var canadianPlaces = ["BC": ["vancouver", "kamloops", "kelowna", "vernon", "victoria"],
    "AB": ["calgary", "edmonoton", "canmore", "jasper", "hinton", "nelson", "banff"],
    "SK": ["saskatoon", "regina", "moosejaw", "sweetgrass"],
    "MB": ["winnipeg"],
    "ON": ["toronto", "waterloo", "windsor"],
    "QC": ["montreal", "quebec"],
    "NS": ["halifax"]]

for province in canadianPlaces.keys {
    print("welcome to beautiful \(province)!")
}

// Sets: 

/* 
- Can only store unique values
*/

// create empty instance of set
var groceryBag = Set<String>()

// INSERT items
groceryBag.insert("apples")
groceryBag.insert("oranges")
groceryBag.insert("pears")

// loop through to log
for food in groceryBag {
    print(food)
}

// create a set with items
var groceries: Set = ["peaches", "grapes", "pineapple", "oranges"]

// check ot see if set CONTAINS item
let bananas = groceryBag.contains("bananas") // nope, no bananas

// combine sets with UNION
let giantBag = groceryBag.union(groceries)

// find common items with INTERSECTS
let commonItems = groceryBag.intersect(groceries)

// check for unique items and return bool with DISJOINT
let checkForRepeats = groceryBag.isDisjointWith(groceries) // do two sets contain unique items?

// INSERT item
groceryBag.insert("strawberries")

// REMOVE item
groceryBag.remove("apples")


// FUNCTIONS: 
/*
A function is a named set of code that is used to accomplish a specific task like: 
- define argument
- return argument
*/

func printGreeting() { // no parameters
    print("hello playground")
}

func printPersonalGreeting(name: String) { // with an argument
    print("Hello \(name), welcome!")
}
//printPersonalGreeting("Shena")

func divisionDescription(num: Double, den: Double) {
    print("\(num) divided by \(den) equals \(num / den).") // math inside of string
}
//divisionDescription(9.0, den: 3.0)

// you can makeparameters more descriptive so that they appear when you call the function:

func divideDescript(forNumerator num: Double, andDenominator den: Double) {
    print("\(num) divided by \(den) equals \(num / den).")
}
divideDescript(forNumerator: 9.0, andDenominator: 3.0) // voila! it is autofilled

// VARIADIC parameters...:
/* 
- these take zero or more values for the argument
- each function can only have one variadic parameter
- should be final parameter in list
- values provided to the argument are made available within the function's body as an ARRAY
- indicated by three periods after the paramater function...
*/

func printPersonalGreetings(names: String...) {
    for name in names {
        print("Hello \(name), welcome to the playground!")
    }
}
printPersonalGreetings("Shena", "Ryan", "Penny", "Virtch")

// DEFAULT parameter values: 
/*
- you can also set default values
- must be at end of function's parameter list
*/

func divisionDescriptionDefault(forNumerator num: Double,
                                andDenominator den: Double,
                                withPunctuation pun: String = ".") { // default value
    print("\(num) divided by \(den) equals \(num / den)\(pun)")
}
divisionDescriptionDefault(forNumerator: 9.0, andDenominator: 3.0)// with default punctuation
divisionDescriptionDefault(forNumerator: 10.0, andDenominator: 2.0, withPunctuation: "!")// change punctuation

// IN-OUT parameters:
/*
- sometimes, you may wish to modify the value of an argument
- in-out parameters allow a function's impact on a variable to live beyond the function's body
BUT:
- in-out functions can NOT have default values.
- in-out functions can not bave variadic parameters...
*/

// you have a function that takes an error message and appends some information based on conditions: 
var myError = "the request failed:"
func appendErrorCode(code: Int, inout toErrorString errorString: String) { // inout parameter
    if code == 400 {
        errorString += " bad request." // thanks to inout, you can modify your original argument
    }
}
appendErrorCode(400, toErrorString: &myError) // & = inout indicator, implies that the variable will be modified by the function

//  RETURNING from a function: 

func divisionDescp(forNumerator num: Double,
                   andDenominator den: Double,
                   withPunctuation pun: String = ".") -> String {
    return "\(num) divided by \(den) equals \(num / den)\(pun)"
        
}
print(divisionDescp(forNumerator: 50.0,
                    andDenominator: 10.0))

// NESTED Functions and Scope:
/*
Cool swifty feature: you can nest functions within each other!
This is useful when: 
- you want to limit scope
*/

func areaOfTriangle(withBase base: Double, andHeight height: Double) -> Double {
    let numerator = base * height
    
    func divide() -> Double { // whoa, it is nested!! Function is only available within parent funciton's scope
        return numerator / 2
    }
    
    return divide()
}
areaOfTriangle(withBase: 3.0, andHeight: 5.0)

// MULTIPLE returns: 
/*
Funcitons can return more than one value thanks to tuples.
*/

func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]) { // return two parameters
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}
let bunchOfNumbers = [7, 23, 5, 2, 11, 45, 74, 91, 21, 4, 8, 16]
let theSortedNumbers = sortEvenOdd(bunchOfNumbers) // assign constant to hold sorted numbers
print("the even numbers are \(theSortedNumbers.evens), the odd numbers are \(theSortedNumbers.odds).") // notice string interpolation with tuple, you can access members by name if they are defined (ie: evens, odds). 

// OPTIONAL returns: 
/*
- Sometimes you want a function to return an optional. 
- ie: you want to return a person's name, but only have their first name saved
*/

func grabMiddleName(name: (String, String?, String)) -> String? {
    return name.1 // second element in string, tuple is 0 indexed
}
let middleName = grabMiddleName(("Matt", nil, "Smith"))

if let theName = middleName {
    print(theName)
}

// EARLY EXIT from a function: 
/*
Guard Statements: 
- execute code depending on a Boolean value
- used to exit from a function if a condition is not met
- these will protect your code frmo running under improper conditions
*/

func greetByMiddleName(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle
        else { // guard called here if there is no middle name
        print("hey there!")
        return
    }
    print("hey \(middleName)!")
}
greetByMiddleName(("Matt", "Tom", "Smith"))

// FUNCTION TYPES: 
/*
- useful because you can assign them to variables
- function types are made up of the function's parameter and retun type
- if a function has no argument or return it has the following type: () -> ()
*/
let evenOddFunction: ([Int]) -> ([Int], [Int]) = sortEvenOdd // created constant named "evenOddFunction" whose value is the function type

// BRONZE CHALLENGE: 

func greetByMiddleNameIfLessThanFourChars(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle else { // guard called here if there is no middle name
            print("hey there!")
            return
    }
    if name.middle?.characters.count <= 4 {
        print("hey \(middleName)!")
    }
    else {
        print("hello \(name.first)!")
    }
}
greetByMiddleNameIfLessThanFourChars(("Jerry", "Tom", "Smith"))

// SILVER CHALLENGE:
// build a bean sifter!!

var groceryList = ["green beans", "milk", "black beans", "pinto beans", "apples", "cheese"]

func beanSifter(groceries: [String]) -> (beans: [String], notBeans: [String]) {
    var beans = [String]()
    var notBeans = [String]()
    
    for grocery in groceries {
        if grocery.containsString("beans") {
            beans.append(grocery)
        }
        else if !grocery.containsString("beans") {
            notBeans.append(grocery)
        }
    }
    return (beans, notBeans)
}
beanSifter(groceryList) 


// CLOSURES: 
/*
Closures are discrete bundles of functionality that can be used in your application to accomplish specific tasks. 
- functions are a special case of closures, think of a function as a named closure
- closures have a more compact and lightweight syntax, you can write a function-like construct without giving it a name and declaration
- closures are easy to pass around in function arguments and returns
*/

var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

func sortAscending(i: Int, j: Int) -> Bool {
return i < j
}
let volunteersSorted = volunteerCounts.sort(sortAscending)

// closure expression syntax:
/*
- you write closures inside of the {}
- the closures parameters are inside of the parenthesis immediately after the opening brace
- return type comes after parameters and uses regular syntax
- keyword "in" is used to separate the slocure's parameters and return type from statements inside of body

{(parameters) -> return type in 
    // code
}
*/

// so this would be the refactored version of the above: 
let volunteerSorted = volunteerCounts.sort({ // this is the closure!
    (i: Int, j: Int) -> Bool in
    return i < j
    })

// this can be further refactored: 
let volunSorted = volunteerCounts.sort({ i, j in i < j })

// and refactored again:
/*
The compiler knows that sort(_:) takes a closure that takes two paramaters that are of the same type.
You can refer to the argument values in order with $0, $1, $2, etc.
This way, you do not need to explicitly declare parameters.
*/
let volSorted = volunteerCounts.sort({ $0 < $1 }) // new shorthand syntax!

// you can simplify this again:
let volSort = volunteerCounts.sort { $0 < $1 }



// Functions As Return Types: 
/*
Remember how every function has a return type?
A function type defines a function/closure's parameter and return type. 

ie: a function that takes a string argument and returns an int has the type of:
(String) -> Int

In Swift, functions are "first class objects" which means that functions can return other functions as their return type:
*/

func makeTownGrand() -> (Int, Int) -> Int {
    func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
        return toLights + lightsToAdd
    }
    return buildRoads
}

let townPlan = makeTownGrand()
var stopLights = 4
stopLights = townPlan(4, stopLights)
print("My town has \(stopLights) stoplights.")


// Functions As Arguments:
/*
Functions can also serve as arguments to other functions.
*/

func makeTownGrander(budget: Int, condition: Int -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
            return toLights + lightsToAdd
        }
        return buildRoads
    } else {
        return nil
    }
}

func evaluateBudget(budget: Int) -> Bool {
    return budget > 10000
}

var stopLight = 4

if let townPlan = makeTownGrander(1000, condition: evaluateBudget) {
    stopLight = townPlan(4, stopLight)
}

if let newTownPlan = makeTownGrander(10500, condition: evaluateBudget) {
    stopLight = newTownPlan(4, stopLight)
}

print("My town has \(stopLight) stoplights.")


// Closures Capture Values: 
/*
Closures and functions can keep track of internal information encapsulated by a variable definied in their enclosing scope. To visualize this, create a function called "growthTracker" that shows the town's pupilation growth.
*/

func makeGrowthTracker(forGrowth growth: Int) -> () -> Int {
    var totalGrowth = 0
    func growthTracker() -> Int {
        totalGrowth += growth
        return totalGrowth
    }
    return growthTracker
}
var currentPopulation = 5422
let growBy500 = makeGrowthTracker(forGrowth: 500)
growBy500()
growBy500()
growBy500()
currentPopulation += growBy500() // check total population

// Closures Are Reference Types: 
/*
- closures are reference types - meaning when you assign a function to a constant or variable, you are actually setting that constant or variable to *point to* the function. You are not creating a distinct copy of that function. Any information captured by the function's scope will be changed if you call the function via a new constant or variable.
*/

// Higher-Order Functions: 
/*
Higher order functions take at least one function as input. ie: sort(_:) others include map(_:), filter(_:) and reduce(_:combine:)
*/

// MAP(_:)
/*
- function that can transform an array's contents ie: you map an array from one value to another and put these values into a new array.
*/

let precinctPupulations = [1244, 2121, 2157]
let projectedPopulation = precinctPupulations.map {
    (population: Int) -> Int in
    return population * 2
}
projectedPopulation // new array

// FILTER(_:)
/*
- can be called on an array, just like map(_:)
- it also takes a closure expression as an argument
- purpose is to filter an array based oupon criteria
- resulting array contains value of original array that passed the test
*/

let bigProjections = projectedPopulation.filter {
    (projection: Int) -> Bool in
    return projection > 4000
}
bigProjections

// REDUCE(_:COMBINE:)
/*
- create estimate from array ie: reduce values to a single value
*/

let totalProjection = projectedPopulation.reduce(0) {
    (accumulatedProjection: Int, precinctProjection: Int) -> Int in
    return accumulatedProjection + precinctProjection
}
totalProjection

// first argument referes to an initial amount that can be added at the outset. 
// second argument is a closure that defines how the values inside the collection should be combined.


// GENERIC types + STACKS:

struct genericStack <Element> { // angled brackets specify that any type can be passed in
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func peek() -> Element? { // optional added as the stack may be empty
        return (items.last)
    }
}

var stack = genericStack<String>() // create instance of genericStack
stack.push("beans") // add item to top O(1)
stack.push("cheese")
stack.push("corn")
stack.push("butter")

stack.items // display items O(N)
stack.pop() // remove item from top O(1)
stack.peek() // peek at top item O(1)


// ENUMERATIONS: 
/*
- enums allow you to create instances that are only one of a predefined list of cases
- define with "enum" keyword followed by name of enumeration
- body must contain at least one case statement that declares possible values
- types start with a CAPITAL letter by convention
- enums in C or c++ are int types, each case is ordered numerically: 0, 1, 2, 3...

*/

enum TextAlignment: Int {
    case Left
    case Right
    case Center
    case Justify
}

var alignment = TextAlignment.Left
alignment = .Right

if alignment == .Right {
    print("we should re-align the text.")
}

// but TYPICALLY, switch statements are used to handle enum values! Use Switch to print the statement in a human readable way: 

switch alignment {
case .Left:
    print("left aligned")
case .Right:
    print("right aligned")
case .Center:
    print("center aligned")
case .Justify:
    print("justify aligned")
}

// The benefit of using an enum + switch is that you do not necessarily require a default case. If you have included a case for each condition in the enum, the compiler knows what to check!
// Best Practice: avoid setting a default as it may cause errors if you add cases to your enum later on.

// if you set an int enum value, you can access the rawValue (number) like this:
print("left has a raw value \(TextAlignment.Left.rawValue)") // 0
print("right has a raw value \(TextAlignment.Right.rawValue)") // 1

// you can also make your own raw values:
//enum TextAlignment: Int {
//    case Left = 20
//    case Right = 30
//    case Center = 40
//    case Justify = 50
//}

// you can also convert raw value number to an enum type... 
/*
let myRawValue = 20
if let myAlignment = textAlignment(rawValue: myRawValue) {
print("successfully converted \(myRawValue) into a textAllignment") // pass
} else {
print("\(myRawValue) has no corresponding textAlignment case") // fail
}
*/

// you can create Enums with other types too...

enum Languages: String {
    case Swift = "Swift"
    case ObjectiveC = "Objective-C"
    case C // will return string that is equal to name
    case Cpp = "C++" // modify string to more accurately reflect name
    case Java
}

let myFavoriteLanguage = Languages.Swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")

// METHODS: 
/*
- method is a function that is associated witha type
- methods can be associated with classes AND enums
*/

enum LightBulb {
    case On
    case Off

func surfaceTempForAmbientTemp(ambient: Double) -> Double { // you can add function INSIDE of enum! We would say that we are calling a "method on Lightbulb"
    switch self {
    case .On:
        return ambient + 150.0
    case .Off:
        return ambient
        }
    }
    
    mutating func toggle() {
    switch self { // you can not assign self inside a method, so we need to mark it as a "mutating" method...
    case .On:
        self = .Off
    case .Off:
        self = .On
        }
    }
    
}

var bulb = LightBulb.On // create instance of LightBulb
let ambientTemperature = 77.0

bulb.toggle()
bulb.toggle()
var bulbTemperature = bulb.surfaceTempForAmbientTemp(ambientTemperature) // pass into function
print("the bulb's temp is \(bulbTemperature)")

// Associated Values: 
/*
- the previous enum examples define static cases
- associated values allow you to attach data to instances of an enumeration
*/

enum ShapeDimensions {
    case Point // no associated value
    case Square(Double) // length of one side x 4
    case Rectangle(width: Double, height: Double) // width x height
    
    func perimeter() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * 4
        case let .Rectangle(width: w, height: h):
            return (w + h) * 2
        }
    }
    
    func area() -> Double { // add method to enum
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * side
        case let .Rectangle(width: w, height: h):
            return w * h
        }
    }
}

var squareShape = ShapeDimensions.Square(10.0)
var rectangleShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.Point

print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectangleShape.area())")
print("point's area = \(pointShape.area())")
print("square's perimeter = \(squareShape.perimeter())")
print("rectangle's perimeter = \(rectangleShape.perimeter())")

// Recursive Enumerations:

enum FamilyTree {
    case NoKnownParents
    indirect case OneKnownParent(name: String, ancestors: FamilyTree) // note indirect keyword for recursive cases...
    indirect case TwoKnownParents(fatherName: String, fatherAncestors: FamilyTree,
                         motherName: String, motherAncestors: FamilyTree)
}


/*
Indirect: since the enum will be called recursively, memory needs are unknown so Swift creates a layer of indirection. This instrycts the compiler to store the enum's data behind a pointer. The compiler now knows to store a pointer to the associated data, putting the data somewhere else in the memory, rather than making the instance of Family Tree big enough to hold the data.
*/

let fredAncestors = FamilyTree.TwoKnownParents(fatherName: "Fred Senior", fatherAncestors: .OneKnownParent(name: "Grandma Beth", ancestors: .NoKnownParents), motherName: "Marsha", motherAncestors: .NoKnownParents)


// Function Currying: 
/*
- allows you to rewrite an existing function that takes multiple parameters as a new function that takes one parameter and returns another function. 
- involves nesting functions. 
- a "curried" function allows you to bind values to a function's arguments before you call it.  This is similar to supplying default values, but more dynamic.
*/

// original function:
func greetName(name: String, withGreeting greeting: String) -> String {
    
    return "\(greeting) \(name)"
}
let personalGreeting = greetName("Steve", withGreeting: "Hello,")

// now with currying: 
func greetingForName(name: String) -> (String) -> String {
    func greeting(greeting: String) -> String {
        return "\(greeting) \(name)"
    }
    return greeting
}
let greeterFunction = greetingForName("Matt")
let theGreeting = greeterFunction("Salutations, ") // pass greeting to function
print(theGreeting)

// currying with concise Swifty syntax: 
func greeting(greeting: String)(name: String) -> String {
    return "\(greeting) \(name)"
}
let friendlyGreeting = greeting("Hello, ")
let newGreeting = friendlyGreeting(name: "Shena")
print(newGreeting)

// Mutating: 
// mutating allows you to modify a struct or enum...

struct Person {
    var firstName = "William"
    var lastName = "Murray"
    
    mutating func changeName(fn: String, ln: String) { // modify a struct or enum with "mutating"
        firstName = fn
        lastName = ln
    }
}

var p = Person()
let changer = Person.changeName // assign to constant, this is a curried function but we are not calling the function... 
changer(&p)("John", ln: "Goodman") // pass instance's reference to function with "&"

// or: 
p.changeName("Steve", ln: "Buscemi")
p.firstName








































































