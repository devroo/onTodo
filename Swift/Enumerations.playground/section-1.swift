// Playground - noun: a place where people can play

import UIKit

/*
 * 열거형 (Enumerations)
 */

enum CompassPoint {
    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
var directionToHead = CompassPoint.West
directionToHead = .East

// 열거형의 값들과 스위치 구문간의 대응 (Matching Enumeration Values with a Switch Statement)
directionToHead = .South
switch directionToHead {
case .North:
    println("Lots of planets have a north")
case .South:
    println("Watch out for penguins")
case .East:
    println("Where the sun rises")
case .West:
    println("Where the skies are blue")
}
// prints "Watch out for penguins"

let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
    println("Mostly harmless")
default:
    println("Not a safe place for humans")
}
// prints "Mostly harmless”

// 관련된 값들 (Associated Values)
enum Barcode {
    case UPCA(Int, Int, Int)
    case QRCode(String)
}

// 값을 넣을 때 하나의 경우만 가능하다
var productBarcode = Barcode.UPCA(8, 85909_51226, 3)
//productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .UPCA(let numberSystem, let identifier, let check):
    println("UPC-A with value of \(numberSystem), \(identifier), \(check).")
case .QRCode(let productCode):
    println("QR code with value of \(productCode).")
}
// prints "QR code with value of ABCDEFGHIJKLMNOP."

// 내부 변수가 선언되었을 경우 전체에 let을 쓸 수 있다.
switch productBarcode {
case let .UPCA(numberSystem, identifier, check):
    println("UPC-A with value of \(numberSystem), \(identifier), \(check).")
case let .QRCode(productCode):
    println("QR code with value of \(productCode).")
}
// prints "QR code with value of ABCDEFGHIJKLMNOP."

// 원시 값 (Raw Values)
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum Planets: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

// 원시 값을 사용할 경우 toRaw() 함수를 이용하여 숫자를 뽑아낼 수 있다.
let earthsOrder = Planets.Earth.toRaw()
// earthsOrder is 3

// 원시 값을 사용할 경우 fromRaw() 함수를 이용하여 인덱스로 사용 할 수 있다.
let possiblePlanet = Planets.fromRaw(7)
// possiblePlanet is of type Planet? and equals Planet.Uranus
// possiblePlanet은 optional Planets 타입이 된다.
// 인덱스가 넘어가는 경우는 nil을 반환한다.

let positionToFind = 9
if let somePlanet = Planets.fromRaw(positionToFind) {
    switch somePlanet {
    case .Earth:
        println("Mostly harmless")
    default:
        println("Not a safe place for humans")
    }
} else {
    println("There isn't a planet at position \(positionToFind)")
}
// prints "There isn't a planet at position 9"