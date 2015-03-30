// Playground - noun: a place where people can play

import UIKit

/*
 * 클로저 (Closures)
 */

// 정렬 함수
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
// xcode6 beta3에서 sort() -> sorted()로 변경
var reversed = sorted(names, backwards)
// reversed i s equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

// 클로저 표현식 문법 (Closure Expression Syntax)
// 여러줄 표현
reversed = sorted(names, { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// 1줄 표현
reversed = sorted(names, { (s1: String, s2: String) -> Bool in return s1 > s2 } )

// 컨텍스트로부터 타입 유추하기 (Inferring Type From Context)
reversed = sorted(names, { s1, s2 in return s1 > s2 } )

// 단일 표현식 클로저로부터의 암시적 반환 ( Implicit Returns from Single-Expression Closures)
reversed = sorted(names, { s1, s2 in s1 > s2 } )

// 단축 인자 이름들 ( Shorthand Argument Names)
reversed = sorted(names, { $0 > $1 } )

// 연산자 함수들 ( Operator Functions )
reversed = sorted(names, > )

// 후행 클로저 ( Trailing Closures )
func someFunctionThatTakesAClosure(closure: () -> ()) {
    // function body goes here
}
// here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure({
    // closure's body goes here
})
// here's how you call this function with a trailing closure instead:

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

// 후행클로저로 표현된 sorted
reversed = sorted(names) { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}
strings
// strings is inferred to be of type String[]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]

// 값 획득하기 (Capturing Values)
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30

let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()
// returns a value of 7
incrementByTen()
// returns a value of 40

// 클로저는 참조 타입 (Closures Are Reference Types)
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// returns a value of 50
