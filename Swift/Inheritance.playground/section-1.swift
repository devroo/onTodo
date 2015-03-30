// Playground - noun: a place where people can play

import UIKit

/*
 * 상속 (Inheritance)
 */


// 베이스 클래스 정의
class Vehicle {
    var numberOfWheels: Int
    var maxPassengers: Int
    func description() -> String {
        return "\(numberOfWheels) wheels; up to \(maxPassengers) passengers"
    }
    init() {
        numberOfWheels = 0
        maxPassengers = 1
    }
}

let someVehicle = Vehicle()

// 하위클래스 정의
class Bicycle: Vehicle {
    override init () {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
println("Bicycle: \(bicycle.description())")
// Bicycle: 2 wheels; up to 1 passengers

class Tandem: Bicycle {
    override init() {
        super.init()
        maxPassengers = 2
    }
}

let tandem = Tandem()
println("Tandem: \(tandem.description())")
// Tandem: 2 wheels; up to 2 passengers

// 오버라이딩
/*
적절한 위치에서 super 접두사를 가지고 상위클래스의 메서드, 프로퍼티, 서브스크립트에 접근할 수 있다.

someMethod()가 오버라이드 되었을 때, 오버라이딩 메서드 내부에서 super.someMethod()를 통해 상위클래스의 someMethod() 메서드를 호출할 수 있다.
someProperty가 오버라이드 되었을 때, 오버라이딩한 접근자(getter)와 설정자(setter) 내부에서 super.someProperty를 통해 상위클래스의 someProperty를 호출할 수 있다.
someIndex에 해당하는 서브스크립트가 오버라이드 되었을 때, 오버라이딩한 서브스크립트 내부에서 super[someIndex]를 통해 상위클래스의 동일한 서브스크립트를 호출할 수 있다.
*/

// 메서드 오버라이딩
class Car: Vehicle {
    var speed: Double = 0.0
    override init() {
        super.init()
        maxPassengers = 5
        numberOfWheels = 4
    }
    override func description() -> String {
        return super.description() + "; " + "traveling at \(speed) mph"
    }
}

let car = Car()
println("Car: \(car.description())")
// Car: 4 wheels; up to 5 passengers; traveling at 0.0 mph

// 프로퍼티 오버라이딩
class SpeedLimitedCar: Car {
    override var speed: Double {
        get {
            return super.speed
        }
        set {
            super.speed = min(newValue, 40.0)
        }
    }
}

let limitedCar = SpeedLimitedCar()
limitedCar.speed = 60.0
println("SpeedLimitedCar: \(limitedCar.description())")
// SpeedLimitedCar: 4 wheels; up to 5 passengers; traveling at 40.0 mph

// 프로퍼티 관찰자 오버라이딩

class AutomaticCar: Car {
    var gear = 1
    override var speed: Double {
        didSet {
            gear = Int(speed / 10.0) + 1
        }
    }
    override func description() -> String {
        return super.description() + " in gear \(gear)"
    }
}

let automatic = AutomaticCar()
automatic.speed = 35.0
println("AutomaticCar: \(automatic.description())")
// AutomaticCar: 4 wheels; up to 5 passengers; traveling at 35.0 mph in gear 4

// 오버라이드 방지

// final 속성을 첫 키워드 앞에 표시한다. (예, final var, final func, final class func, final subscript)