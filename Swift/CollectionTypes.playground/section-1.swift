// Playground - noun: a place where people can play

import UIKit

/*
 * 컬렉션 타입 (Collection Types)
 */

// 배열 표현식 (Array Literals)

// beta4부터 String[] -> [String] 으로 문법이 변겨됨
var shoppingList: [String] = ["Eggs", "Mink"]
// shoppingList has been initialized with two initial items
// var shoppingList = ["Eggs", "Mink"] 으로도 가능

// 배열의 접근 및 수정 Accessing and Modifying an Array

println("The shopping list contains \(shoppingList.count) items.")
// prints "The shopping list contains 2 items."

if shoppingList.isEmpty {
    println("The shopping list is empty.")
} else {
    println("The shopping list is not empty.")
}
// prints "The shopping list is not empty."
// count를 isEmpty로 처리할 수 있음

// 항목추가
shoppingList.append("Flour")
// shoppingList now contains 3 items, and someone is making pancakes

//shoppingList += "Baking Powder"
// shoppingList now contains 4 items

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items

var firstItem = shoppingList[0]
// firstItem is equal to "Eggs"

shoppingList[0] = "Six eggs"
shoppingList
// the first item in the list is now equal to "Six eggs" rather than "Eggs"

///shoppingList[3...6] = ["Bananas", "Apples"]
shoppingList
// shoppingList now contains 6 items

shoppingList.insert("Maple Syrup", atIndex: 0)
shoppingList
// shoppingList now contains 7 items
// "Maple Syrup" is now the first item in the list

let mapleSyrup = shoppingList.removeAtIndex(0)
shoppingList
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string

firstItem = shoppingList[0]
shoppingList
// firstItem is now equal to "Six eggs"

let apples = shoppingList.removeLast()
shoppingList
// the last item in the array has just been removed
// shoppingList now contains 5 items, and no cheese
// the apples constant is now equal to the removed "Apples" string


// 배열에서 반복문 사용하기 Iterating Over an Array
for item in shoppingList {
    println(item)
}

// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas

// enumerate 함수는 배열내 각각의 값에 대해 인덱스와 결합한 튜플 값을 반환한다. 반복문을 돌리는 도중 이 튜플을 변수나 상수로 분리하여 사용할 수 있다
for (index, value) in enumerate(shoppingList) {
    println("Item \(index + 1): \(value)")
}

// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas

// 배열의 생성과 초기화 Creating and Initializing an Array
var someInts = [Int]()
println("someInts is of type Int[] with \(someInts.count) items.")

// prints "someInts is of type Int[] with 0 items."

someInts.append(3)
someInts
// someInts now contains 1 value of type Int
someInts = []
// someInts is now an empty array, but is still of type Int[]

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
// threeDoubles is of type Double[], and equals [0.0, 0.0, 0.0]

var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)
// anotherThreeDoubles is inferred as Double[], and equals [2.5, 2.5, 2.5]
// 타입 추정을 이용할 수 있으므로 굳이 타입 지정을 필요없음

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as Double[], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

// 딕셔너리 Dictionaries
// 주의점 :  KeyType은 해시 가능한 타입이어야 한다. 그외적으로는 모두 가능

// 딕셔너리 표현식 Dictionary Literals
var airports: Dictionary<String, String> = ["TYO": "Tokyo", "DUB": "Dublin"]
// var airports = ["TYO": "Tokyo", "DUB": "Dublin"] // 축약표현

// 딕셔너리의 접근 및 수정 Accessing and Modifying a Dictionary

println("The dictionary of airports contains \(airports.count) items.")
// prints "The dictionary of airports contains 2 items."

airports["LHR"] = "London"
airports
// the airports dictionary now contains 3 items

airports["LHR"] = "London Heathrow"
airports
// the value for "LHR" has been changed to "London Heathrow"

// updateValue(forKey:)는 특정키의 값을 변경시키는 함수
// updateValue(forKey:) 메소드는 업데이트를 하고난 뒤 이전 값을 반환
// 딕셔너리의 밸류 타입에 해당하는 Optional 값을 반환
if let oldValue = airports.updateValue("Dublin International", forKey: "DUB") {
    println("The old value for DUB was \(oldValue).")
}
// prints "The old value for DUB was Dublin."

if let airportName = airports["DUB"] {
    airportName
    println("The name of the airport is \(airportName).")
} else {
//    airportName 여기선 접근이 불가능...
    println("That airport is not in the airports dictionary.")
}
// prints "The name of the airport is Dublin International."

airports["APL"] = "Apple International"
// "Apple International" is not the real airport for APL, so delete it
airports
airports["APL"] = nil
// APL has now been removed from the dictionary
// key/value 쌍으로 삭제하는 방법
airports

// removeValueForKey 로 삭제하는 방법 : 값이 없으면 return nil;
if let removedValue = airports.removeValueForKey("DUB") {
    println("The removed airport's name is \(removedValue).")
} else {
    println("The airports dictionary does not contain a value for DUB.")
}
// prints "The removed airport's name is Dublin International."
airports

// 딕셔너리에서 반복문 사용하기 Iterating Over a Dictionary

for (airportCode, airportName) in airports {
    println("\(airportCode): \(airportName)")
}
// TYO: Tokyo
// LHR: London Heathrow

for airportCode in airports.keys {
    println("Airport code: \(airportCode)")
}
// Airport code: TYO
// Airport code: LHR

for airportName in airports.values {
    println("Airport name: \(airportName)")
}
// Airport name: Tokyo
// Airport name: London Heathrow

let airportCodes = Array(airports.keys)
// airportCodes is ["TYO", "LHR"]

let airportNames = Array(airports.values)
// airportNames is ["Tokyo", "London Heathrow"]

// 빈 딕셔너리 만들기 Creating an Empty Dictionary
var namesOfIntegers = Dictionary<Int, String>()
// namesOfIntegers is an empty Dictionary<Int, String>

namesOfIntegers[16] = "sixteen"
namesOfIntegers
// namesOfIntegers now contains 1 key-value pair
namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type Int, String
