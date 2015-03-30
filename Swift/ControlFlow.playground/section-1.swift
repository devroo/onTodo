// Playground - noun: a place where people can play

import UIKit

// For 순환문(For Loops)
for index in  1...5 {
    println("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is  10
// 3 times 5 is  15
// 4 times 5 is 20
// 5 times 5 is 25

// 범위내에 값이 필요가 없는 단순 반복일 경우
let base  = 3
let power  =  10
var answer  =  1
for _ in  1...power {
    answer *= base
}
println("\(base) to the power  of \(power) is \(answer)")
// prints "3 to the power of  10 is 59049"

// 배열
let names  = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    println("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex !
// Hello, Brian!
// Hello, Jack!

// 튜플
let numberOfLegs  = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    println("\(animalName)s have \(legCount) legs")
}
// spiders have 8 legs
// ants have 6 legs
// cats have 4 legs

for character in "Hello" {
    println(character)
}
// H
// e
// l
// l
// o

// For-조건부-증가부 (For-Condition-Increment )
for var index  = 0; index  < 3; ++index {
    println("index is \(index)")
}
// index is 0
// index is 1
// index is 2

var index : Int             // <= 이 부분에서 선언해 주어야..
for index  = 0; index  < 3; ++index {
    println("index is \(index)")
}
// index is 0
// index is 1
// index is 2
println("The loop statements were executed \(index) times")
// prints "The loop statements were executed 3 times"

// While 루프 (While Loops)

// 사다리게임-
//let finalSquare  = 25
//var board  = [Int](count : finalSquare +  1, repeatedValue: 0)
//
//board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
//board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//
//var square = 0
//var diceRoll = 0
//while square < finalSquare {
//    // 주사위를 던진다
//    if ++diceRoll  == 7 { diceRoll  =  1 }
//    // 주사위를 던져 나온 수 만큼 이동한다
//    square += diceRoll
//    if square  < board.count {
//        // 아직 게임판에 있다면, 뱀을 타고 내려가거나 사다리를 타고 올라간다
//        //if we're still on the board, move up or down for a snake or a ladder
//        square += board[square]
//        println("Game over!")
//    }
//}

// Do-While

let finalSquare  = 25
var board  = [Int](count : finalSquare +  1, repeatedValue: 0)
    board[03]  = +08; board[06]  = +11; board[09]  = +09; board[10]  = +02
    board[14]  = -10; board[19]  = -11; board[22]  = -02; board[24]  = -08
var square  = 0
var diceRoll  = 0

do {
    // move up or down for a snake or ladder square += board[square]
    // 주사위를 던진다
    if ++diceRoll  == 7 { diceRoll  =  1 }
    // 주사위를 던져서 나온 수만큼 이동한다
    square += diceRoll
} while square  < finalSquare
println("Game over!")

// 조건문 (Conditionals Statements)

// IF

var temperatureInFahrenheit  = 30
if temperatureInFahrenheit  <= 32 {
    println("It's very cold. Consider wearing a scarf.")
}
// prints "It's very cold. Consider wearing a scarf."

temperatureInFahrenheit  = 40
if temperatureInFahrenheit  <= 32 {
    println("It's very cold. Consider wearing a scarf.")
} else {
    println("It's not that cold. Wear a t-shirt.")
}
// prints "It's not that cold. Wear a t-shirt."

temperatureInFahrenheit  = 90
if temperatureInFahrenheit  <= 32 {
    println("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit  >= 86 {
    println("It's really warm. Don't forget to wear sunscreen.")
} else {
    println("It's not that cold. Wear a t-shirt.")
}
// prints "It's really warm. Don't forget to wear sunscreen."

temperatureInFahrenheit  = 72
if temperatureInFahrenheit  <= 32 {
    println("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit  >= 86 {
    println("It's really warm. Don't forget to wear sunscreen.")
}

// Switch
let someCharacter: Character  = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    println("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
"n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    println("\(someCharacter) is a consonant")
default :
    println("\(someCharacter) is not a vowel or a consonant")
}
// prints "e is a vowel "

let anotherCharacter: Character  = "a"
switch anotherCharacter {
//case "a": 콤마로 구분해야함
case "A":
    println("T he letter A")
default :
    println("Not the letter A")
}
// 컴파일 에러가 납니다.

// 범위로 매치하기(Range Matching)
let count  = 3_000_000_000_000
let countedThings  = "stars in the Milky Way"
var naturalCount : String
switch count {
    case 0:
        naturalCount  = "no"
    case  1...3:
        naturalCount  = "a few"
    case 4...9:
        naturalCount  = "several"
    case 10...99:
        naturalCount  = "tens of"
    case 100...999:
        naturalCount  = "hundreds of"
    case 1000...999_999:
        naturalCount  = "thousands of"
    default:
        naturalCount  = "millions and millions of"
        println("There are \(naturalCount) \(countedThings).")
}
// prints "There are millions and millions of stars in the Milky Way ."

// 튜플 (Tuples)
let somePoint  = (1,  1)
switch somePoint {
    case (0, 0):
        println("(0, 0) 은 원점에 있습니다")
    case (_, 0):
        println("(\(somePoint.0), 0)은 x축 상에 있습니다. ")
    case (0, _):
        println("(0, \(somePoint.1))은 y축 상에 있습니다.")
    case (-2...2, -2...2):
        println("(\(somePoint.0), \(somePoint.1))은 상자 안에 있습니다.")
    default :
        println("(\(somePoint.0), \(somePoint.1))은 상자 밖에 있습니다.")
}
//prints "(1,  1) is inside the box"

// 값을 상수와 묶기, 상수에 바인딩하기 (Value Bindings)
let anotherPoint  = (2, 0)
switch anotherPoint {
    case (let x, 0):
        println("x축 상에 있으며 x의 값은 \(x)값입니다.")
    case (0, let y):
        println("y축 상에 있으며 y의 값은 \(y)입니다.")
    case let (x, y):
        println("(\(x), \(y))에 있습니다.")
}
// 다음을 출력합니다:  "x축 상에 있으며 x의 값은 2입니다"

// Switch 에 where절을 추가할 수 있다.
let yetAnotherPoint  = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x  == y :
    println("(\(x), \(y)) 는 x==y인 곳에 있습니다.")
case let (x, y) where x  == -y :
    println("(\(x), \(y)) 는 x==-y인 곳에 있습니다.")
case let (x, y):
    println("(\(x), \(y)) 는 기타 구역에 있습니다.")
}
// prints "(1, -1) 은 x==-y인 곳에 있습니다."

// 흐름제어 이동문(Control Transfer Statements)

// Continue
let puzzleInput  = "great minds think alike"
var puzzleOutput  = ""
for character in puzzleInput {
    switch character {
        case "a", "e", "i", "o", "u", " ":
            continue
        default :
            puzzleOutput += character
    }
    println(puzzleOutput)
}
// prints "grtmndsthnklk"

// Break
let numberSymbol: Character = "三"  // Simplified Chinese for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
    case "1", "١", "一", "๑":
        possibleIntegerValue = 1
    case "2", "٢", "二", "๒":
        possibleIntegerValue = 2
    case "3", "٣", "三", "๓":
        possibleIntegerValue = 3
    case "4", "٤", "四", "๔":
        possibleIntegerValue = 4
    default:
        break
}
if let integerValue = possibleIntegerValue {
    println("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    println("An integer value could not be found for \(numberSymbol).")
}
// prints "The integer value of 三 is 3."

// Fallthrough
// fallthrough 키워드를 사용하면 단지, 다음에 나오는 case로 넘어갈 수 있을 뿐
let integerToDescribe  = 5
var description  = "수 \(integerToDescribe) 는"
switch integerToDescribe {
    case 2, 3, 5, 7, 11, 13, 17, 19:
        description += "소수이며, 또한"
        fallthrough
    default :
        description += " 정수입니다."
}
println (description)
//prints "수 5는 소수이며, 또한 정수입니다."

// 이름표가 붙은 구문 (Labeled Statements)
gameLoop: while square  != finalSquare {
if ++diceRoll  == 7 { diceRoll  =  1 }
    switch square + diceRoll {
        case finalSquare:
            // 주사위에서 나온 수만 큼 이동해서 마지막 칸에 도달하면, 게임이 끝납니다.
            break gameLoop
        case let newSquare where newSquare  > finalSquare:
            // 주사위에서 나온 수만 큼 이동했을 때 마지막 칸을 넘어가면, 게임이 계속되고 주사위를 다시 던집니다.
            continue gameLoop
        default :
            // 주사위에서 나온 수 만큼 이동합니다.
            square += diceRoll
            square += board[square]
    }
    println("Game over!")
}
// break문 안에 gameLoop라는 구문 이름표를 쓰지 않으면, while문이 아니라 switch문에서만 빠져나오게 됌
// gameLoop라는 이름표를 사용하였기 때문에 어느 흐름제어문(control statement)가 종료되어야 하는지 명확해짐
// continue를 썼을 때 어느 루프의 다음 이터레이션으로 넘어갈지에 대해 애매모호함이 발생하지 않을 수 있음
