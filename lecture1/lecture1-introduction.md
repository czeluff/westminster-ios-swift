build-lists: true
```swift
enum Language {
    case Swift
    case ObjectiveC
    case Java
    case JavaScript
}

struct Person {
    let name: String
    let age: Int
    let employer: String
    let favoriteLanguage: Language
}

let chad = Person(name: "Chad Zeluff", age: 29, employer: "EventBoard", favoriteLanguage: .Swift)
```

---

# [fit] Swift

---

# But first...

---

# [fit] Xcode

---

# [fit] Slack

---

## Hello World in C

```C
#import <stdio.h>

int main()
{
	printf("Hello, World\n");
	return 0;
}
```

---

## Hello World in Java

```Java

public class PointlessClass {

    public static void main(String[] args) {
        System.out.println("Hello, World");
    }

}

```

---

## Hello World in Swift

```swift
print("Hello, World")
```

--- 

## What's changed in 44 years?

- No need to include the standard library to print.
- No need to specify the entry point for the app.
- Not a function, therefore no `return`.
- No semicolons!
- (`print` assumes a carriage return)

---

## Constants and Variables

```swift
let languageName: String = "Swift"
var version: Double = 2.2
let yearIntroduced: Int = 2014
let isAwesome: Bool = true
```
let :cat: : String = "Cat"

---

## Constants and Variables (w/Type Inference)

```swift
let languageName = "Swift"
var version = 2.2
let yearIntroduced = 2014
let isAwesome = true
```
let :cat: = "Cat"

---

## Strings, Characters, & for-in

```swift
for letter in "mouse".characters {
    print(letter)
}

for letter in "mouse".characters {
    print("The letter is: \(letter)")
}

let a: Character = "A"
let b = "A" + "B" // "AB"

let one = 1, two = 2, three = 3
print("\(one) + \(two) + \(three) = \(one+two+three)") // 1 + 2 + 3 = 6
```

---

## More on Strings

```swift
var name = "Chad"
name += " Zeluff"


let name = "Chad"
name += " Zeluff" //compiler error
```

No need for mutable / immutable versions of same types
(Looking at you, Java. Array vs ArrayList)

---

## Collections

```swift
let names = ["Chad", "Jamie", "Al"]
// An array of Strings

let legCount = ["snake" : 0, "ant" : 6, "human" : 2]
// A Dictionary of Strings to Ints

// Try this:
var names = ["Chad", "Jamie", "Al"]
names.append(4)
```

---

## Loops

```swift
while !classFinished {
	listenToChad()
}

repeat {
	listenToChad()
} while !classFinished
```

- No more standard for-loop! (Also, ++ is gone)
- Typically we can use for-in, or more powerful functions than for-loops

---

## Loops (cont)

```swift
for number in 1...5 {
    print("\(number) times 5 is \(number*5)")
}

for number in 1..<5 {
    print("\(number) times 5 is \(number*5)")
}

let legsOfAnimals = ["snake" : 0, "ant" : 6, "human" : 2]
for (animalName, legCount) in legsOfAnimals { // a "tuple"
	print("\(animalName)s have \(legCount) legs.")
}
```

---

## Changing Arrays

```swift
var shoppingList = ["Eggs", "Milk"]
print(shoppingList[0])
shoppingList.append("Flour")
shoppingList += ["Cheese", "Butter"]
shoppingList[0] = "Six Eggs"
print(shoppingList)

let firstItem = shoppingList[0]
```

- What is the `firstItem`'s type?
- No need to type-cast like in Java.

---

## Changing Dictionaries

```swift
var legCount = ["snake" : 0, "ant" : 6, "human" : 2]
legCount["spider"] = 273
legCount["spider"] = 8
```

---

## Retrieving Dictionary Values

```swift
var legCount = ["snake" : 0, "ant" : 6, "human" : 2]

let humanLegs = legCount["human"]
let aardvarkLegs = legCount["aardvark"]
```

What are the constant's types?

---

## Optionals

```swift
var legCount = ["snake" : 0, "ant" : 6, "human" : 2]
let aardvarkLegs = legCount["aardvark"]
```

Two possible *types* for aardvarkLegs:

- Int
- "No Value"

In Java, this function might return -1 or null if nothing is found...

---

## How do we represent "No Value"?

`null` isn't safe; we might try using it wherever we expect an Int 

But -1 could sometimes be a valid value.

And 0 would be even worse!

```swift
let aardvarkLegs: Int? = legCount["aardvark"]
```

- aardvarkLegs is a box, and inside the box is either an Int or nothing at all
- "nothing" is represented by `nil`

---

## What's in the box?

```swift
var legCount = ["snake" : 0, "ant" : 6, "human" : 2]
let possibleLegCount = legCount["aardvark"]

if possibleLegCount == nil {
    print("I don't know!")
} else {
    let definiteLegCount = possibleLegCount! // Force-unwrap
    print("The aardvark has \(definiteLegCount) legs")
}
```

---

## What's in the box? (cont)

- If you unwrap `!` a box with nothing inside, you will crash.
- Better way to unwrap optionals
- Optional Binding:

```swift
if let legCount = possibleLegCount {
    print("An aardvark has \(legCount) legs")
}
```

---

## What's in the box? (cont)

```swift
if let possibleLegCount = possibleLegCount {
    print("An aardvark has \(possibleLegCount) legs")
}
```

Within the function scope, it'll be the unwrapped vallue.

---

## If-statements

```swift

if legCount == 0 {
    print("Slithers")
} else if legCount == 1 {
    print("Hops")
} else {
    print("Walks")
}
```

No need for braces

---

## A `switch` might be better

```swift
switch legCount {
    case 0:
    print("Slithers")

    case 1:
    print("Hops")

    default:
    print("Walks")
}
```
No need for break

---

## Switches must be exhausted!

```swift
switch legCount {
    case 0:
    print("Slithers")

    case 1,3,5,7,9,11:
    print("Limps")

    case 2,4,6,8,10,12:
    print("Walks")
}
```

- Not all possible values have been considered!
- Either supply a `default` case, or supply all possible cases!

---

## Switches + Ranges

```swift
switch legCount {
    case 0:
    print("No legs")

    case 1...8:
    print("Some legs")

    default:
    print("Lots of legs")
}
```
Can you spot the bug?

---

## Writing our own functions

```swift
func sayHello() {
    print("Hello")
}

sayHello()

// Supply parameter
func sayHello(name: String) {
    print("Hello \(name)") // "Hello " + name
}

sayHello("Class")
```

---

```swift
// Supply default parameter
func sayHello(name: String = "World") {
    print("Hello \(name)")
}

sayHello() 
sayHello("Class")
```

---

## Returning Values

```swift
func makeGreeting(name: String = "World") -> String {
    return "Hello " + name
}

let greeting = makeGreeting() //"Hello World"
```
The compiler knows `greeting` is a String

```swift
func sayHello() -> () { //Long-hand without return-type-inference
    print("Hello")
}
```

---

# Challenge 1
## Linear Search

---

## Challenge 1 Solution

```swift
func linearSearch(array: [Int], key: Int) -> Bool {
    for item in array {
        if item == key {
            return true
        }
    }
    return false
}
```

---

# Challenge 2
## Binary Search Returning Boolean

---

### Challenge 2 Solution

```swift
func binarySearch(array: [Int], target: Int) -> Bool {

    var left = 0
    var right = array.count - 1

    while (left <= right) {
        let mid = (left + right) / 2
        let value = array[mid]

        if (value == target) {
            return true
        } else if (value < target) {
            left = mid + 1
        } else { // value > target
            right = mid - 1
        }
    }

    return false
}
```

---

# Challenge 3
## Binary Search Returning Index

---

### Challenge 3 Solution

```swift
func binarySearch(array: [Int], target: Int) -> Int? {

    var left = 0
    var right = array.count - 1

    while (left <= right) {
        let mid = (left + right) / 2
        let value = array[mid]

        if (value == target) {
            return mid
        } else if (value < target) {
            left = mid + 1
        } else { // value > target
            right = mid - 1
        }
    }

    return nil
}
```

---

## Returning Multiple Values

```swift
func refreshWebPage() -> (Int, String) {
    return (200, "Success")
}
```

You can return multiple values in a tuple.

---

## Tuples

- Just a grouping of values. Any type. Any number.

`(3.79, 4.0, 3.99)` // (Double, Double, Double)
`(404, "URL not found")` // (Int, String)

---

## Tuples (cont)

```swift
func refreshWebPage() -> (Int, String) {
    return (200, "Success")
}

let (statusCode, message) = refreshWebPage()
print("Received \(statusCode): \(message)")

let response = refreshWebpage()
response.0 // an Int
response.1 // a String
```

---

## Tuples (cont)

```swift
func refreshWebPage() -> (code: Int, message: String) {
    return (200, "Success")
}

let response = refreshWebpage()
response.code // 200
response.message // "Success"
```

---

## Closures (Anonymous Functions)

```swift
let greetingPrinter = {
    print("Hello World")
}

let greetingPrinter : () -> () = {
    print("Hello World")
}

func greetingPrinter() -> () { 
    print("Hello World")
}
```

In Swift, functions are just closures with names.

---

## Closures as parameters to a function!

```swift
func execute(times: Int, task: () -> ()) {
    for i in 1...times {
        task()
    }
}

execute(4, task: {
    print("Hello")
})
```

---

## Improvements

```swift
func execute(times: Int, task: () -> ()) {
    for _ in 1...times { //unused i
        task()
    }
}

execute(4) {
    print("Hello")
}
```

---

## Classes

```swift
class Vehicle {

}
```
No required base class. Swift doesn't have a universal base class.

```swift
class Bicycle: Vehicle { //Inheritance
    
}
```

---

## Classes With Properties

```swift
class Vehicle {
    var numberOfWheels = 0
    var description: String { //Computed property
        get {
            return "\(numberOfWheels) wheels"
        }
    }
}

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheels"
    }
}
```

---

description is read-only since there is no setter

Why is description a var?

---

## Creating instance of a Class

```swift
class Vehicle {
    var numberOfWheels = 0 // This is a property
    var description: String { // Computed property
        return "\(numberOfWheels) wheels"
    }
}

let someVehicle = Vehicle()
// let someVehicle: Vehicle = Vehicle()
```

---

## Accessing properties of a class

```swift
let someVehicle = Vehicle()
print(someVehicle.description) // 0 wheels
someVehicle.numberOfWheels = 2
print(someVehicle.description) // 2 wheels
```

---

## Creating an initializer

```swift
class Bicycle: Vehicle {
    init() {
        super.init()
        numberOfWheels = 2
    }
}

let myBicycle = Bicycle()
```

---

## Overriding Properties

```swift
class Car: Vehicle {
    var speed = 0.0
    init() {
      super.init()
      numberOfWheels = 4
    }

    override var description: String {
        return super.description + ", \(speed) mph"
    }
}
```

---

## Property Observing

```swift
class ParentsCar: Car {
    override var speed: Double {
        willSet {
            if newValue > 65.0 {
                print("Careful!")
            }
        }
        didSet {
            //oldValue
        }
    }
}

let p = ParentsCar()
p.speed = 67
```

---

## Methods

```swift
class Counter {
    var count = 0
    func increment() {
        count += 1
    }

    func incrementBy(amount: Int) {
        count += amount
    }

    func resetCount(count: Int) {
        self.count = count
    }
}
```

---

## Structures

```swift
struct Point {
    var x, y: Double
}

struct Size {
    var width, height: Double
}

struct Rect {
    var origin: Point
    var size: Size
}
```

---

- Memberwise initializers come for free

```swift
var point = Point(x: 0.0, y: 0.0)
var size = Size(width: 640.0, height: 480.0)
var rect = Rect(origin: point, size: size)
```

- Computed properties & functions same as Classes

```swift
struct Rect{
    var origin: Point
    var size: Size

    var area: Double {
        return size.width * size.height
    }

    func isBiggerThan(other: Rect) -> Bool {
        return self.area > other.area
    }
}
```

---

# [fit] Structure vs Class?

---

### struct vs class

- structs cannot inherit from other structs
- structs pass-by-value, classes pass-by-reference
- (Notes on board)

---

# [fit] Mutating a structure

---

# [fit] Enums

---

# [fit] Extensions

---

# [fit] Generics & Stacks

---

# [fit] GitHub