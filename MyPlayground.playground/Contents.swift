import UIKit

var str = "Hello, playground"
str = "hello, Swift"

let emptyString = String()
let emptyArrayOfInts  = [Int]()
let emptySetOfFloats = Set<Float>()

let defaultNumber = Int()
let defaultBool = Bool()

var countingUp = ["one", "two"]
let secondElement = countingUp[1]
countingUp.count


emptyString.isEmpty
countingUp.append("three")

let nameByParkingSpace = [13:"Alice", 27: "Bob"]

for (space, name) in  nameByParkingSpace.enumerated() {
    let permit = "Space \(space): \(name)"
}
