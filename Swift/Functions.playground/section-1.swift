// Playground - noun: a place where people can play

import UIKit
/*
 * 함수 (Functions)
 */


// 함수 정의와 호출
func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

println(sayHello("Anna"))
// prints "Hello, Anna!"
println(sayHello("Brian"))
// prints "Hello, Brian!"

func sayHelloAgain(personName: String) -> String {
    return "Helloagain, " + personName + "!"
}
println(sayHelloAgain("Anna"))
// prints "Helloagain, Anna!"

// 함수 파라메터와 반환값
func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}
println(halfOpenRangeLength(1, 10))
// prints "9"

func sayHelloWorld() -> String {
    return "hello, world"
}
println(sayHelloWorld())
// prints "hello, world"

func sayGoodbye(personName: String) {
    println("Goodbye, ` \(personName)! ")
}
sayGoodbye("Dave")
// prints "Goodbye, Dave!"

func printAndCount(stringToPrint: String) -> Int {
    println(stringToPrint)
    return countElements(stringToPrint)
}
func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}
printAndCount("hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting("hello, world")
// prints "hello, world" but does not return a value

// 여러개의 반환값을 가지는 함수
func count(string: String) -> (vowels: Int, consonants: Int, others: Int) {
    var vowels = 0, consonants = 0, others = 0
    for character in string {
        switch String(character).lowercaseString {
        case "a", "e", "i ", "o", "u":
            ++vowels
        case "b", "c", "d", "f", "g", "h", "j", "k", "l ", "m",
        "n", "p", "q", "r", "s", "t", "v", "w ", "x", "y", "z":
            ++consonants
        default:
            ++others
        }
    }
    return (vowels, consonants, others)
}

let total  = count("some arbitrary string! ")
println("\(total.0) vowels and \(total.consonants) consonants")
// prints "6 vowels and 13 consonants"

// 함수 파라미터 이름
func someFunction(parameterName: Int) {
    // function body goes here, and can use parameterName
    // to refer to the argument value for that parameter
}

// 외부 파라미터 이름(External Parameter Names)
func someFunction(externalParameterName localParameterName: Int) {
    // function body goes here, and can use local ParameterName
    // to refer to the argument value for that parameter
}

func join(s1: String,  s2: String,  joiner: String) -> String {
    return s1 + joiner + s2
}

join("hello", "world", ", ")
// returns "hello, world"

func join(string s1: String,  toString s2: String,  withJoiner joiner: String)
    -> String {
        return s1 + joiner + s2
}

join(string: "hello",  toString: "world",  withJoiner: ", ")
// returns "hello, world"
// 코드를 처음 보았을때 명확하지 않을 수 있다면 외부 파라메터 이름을 쓰는것을 언제나 고려하는 것이 가독성이 좋음

// 단축 외부 파라미터 이름
func containsCharacter(#string: String,  #characterToFind: Character) -> Bool {
    for character in string {
        if character == characterToFind {
            return true
        }
    }
    return false
}

let containsAVee = containsCharacter(string: "aardvark", characterToFind: "v")
// containsAVee equals true,  because "aardvark" contai ns a "v"

// 기본(default) 파라미터 값
func join2(string s1: String, toString s2: String, withJoiner joiner: String = " ")
    -> String {
        return s1 + joiner + s2
}

join2(string: "hello", toString: "world", withJoiner: "-")
// returns "hello-world

join2(string: "hello", toString: "world")
// returns "hello world"

// 기본값을 가지는 외부 파라미터 이름
func join3(s1: String, s2: String, joiner: String = " ") -> String {
    return s1 + joiner + s2
}

join3("hello", "world", joiner: "-")
// returns "hello-world"

// 가변 갯수(Variadic) 파라미터
func arithmeticMean(numbers: Double...) -> Double {
    var total : Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8, 19)
// returns 10.0, which is the arithmetic mean of these three numbers

// 상수(Constant)와 가변(Variable) 파라미터
func alignRight(var string: String, count: Int, pad: Character) -> String {
    let amountToPad = count - countElements(string)
    for _ in 1...amountToPad {
        string = pad + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, 10, "-")
// paddedString is equal to "-----hello"
// originalString is still equal to "hello"

// 입출력(In-Out)파라미터
func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// prints "someInt is now 107, and anotherInt is now 3"

// 함수 타입
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

func printHelloWorld() {
    println("hello, world")
}

var mathFunction: (Int, Int) -> Int = addTwoInts
println("Result: \(mathFunction(2, 3))")
// prints "Result: 5"

mathFunction = multiplyTwoInts
println("Result: \(mathFunction(2, 3))")
// prints "Result: 6"

let anotherMathFunction = addTwoInts
// anotherMathFunction is inferred to be of type (Int, Int) -> Int페

func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
    println("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// prints "Result: 8"

// 함수 타입과 반환 타입
func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function

println("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    println("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
println("zero!")
// 3...
// 2...
// 1...
// zero!

// 중첩된 함수들
func chooseStepFunction2(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
currentValue = -4
let moveNearerToZero2 = chooseStepFunction2(currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    println("\(currentValue)... ")
    currentValue = moveNearerToZero2(currentValue)
}
println("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
