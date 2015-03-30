// Playground - noun: a place where people can play

import UIKit

/**
 * 자동 참조 계수 (Automatic Reference Counting)
 */

// ARC in Action
class Person1 {
    let name: String
    init(name: String) {
        self.name = name
        println("\(name) is being initialized")
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}

var reference1: Person1?
var reference2: Person1?
var reference3: Person1?

reference1 = Person1(name: "John Appleseed")
// prints "John Appleseed is being initialized"

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil

reference3 = nil
// prints "John Appleseed is being deinitialized"

// 클래스 인스턴스간의 강한 참조 순환
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { println("\(name) is being deinitialized") }
}

class Apartment {
    let number: Int
    init(number: Int) { self.number = number }
    var tenant: Person?
    deinit { println("Apartment #\(number) is being deinitialized") }
}

var john: Person?
var number73: Apartment?

john = Person(name: "John Appleseed")
number73 = Apartment(number: 73)

john!.apartment = number73
number73!.tenant = john

john = nil
number73 = nil

// 약한 참조
// 약한 참조는 실행 시간중에 값이 바뀔 수 있기 때문에 반드시 변수로서 선언되어야 합니다. 약한 참조는 상수로 선언될 수 없습니다.

class Person2 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment2?
    deinit { println("\(name) is being deinitialized") }
}

class Apartment2 {
    let number: Int
    init(number: Int) { self.number = number }
    weak var tenant: Person2?
    deinit { println("Apartment #\(number) is being deinitialized") }
}

var john2: Person2?
var number732: Apartment2?

john2 = Person2(name: "John Appleseed")
number732 = Apartment2(number: 73)

john2!.apartment = number732
number732!.tenant = john2

john2 = nil
// prints "John Appleseed is being deinitialized"

// 미소유 참조
/*
미소유 참조는 언제나 직접 접근이 가능합니다. 하지만 ARC가 인스턴스의 참조를 할당 해제 할 때 nil로 설정 할 수는 없습니다. 
옵셔널이 아닌 타입은 nil로 설정 될 수 없기 때문입니다.
*/

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { println("\(name) is being deinitialized") }
}

class CreditCard {
    let number: Int
    unowned let customer: Customer
    init(number: Int, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { println("Card #\(number) is being deinitialized") }
}

var kim: Customer?
kim = Customer(name: "John Appleseed")
kim!.card = CreditCard(number: 1234_5678_9012_3456, customer: kim!)

john = nil
// prints "John Appleseed is being deinitialized"
// prints "Card #1234567890123456 is being deinitialized"

// 미소유 참조와 암시적으로(implicitly) 드러난(unwrapped) 옵셔널 속성

class Country {
    let name: String
    let capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
println("\(country.name)'s capital city is called \(country.capitalCity.name)")
// prints "Canada's capital city is called Ottawa"

// 클로저를 위한 강한 참조 순환
class HTMLElement {
    
    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        println("\(name) is being deinitialized")
    }

}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
println(paragraph!.asHTML())
// prints "<p>hello, world</p>"

// 클로저가 self를 여러번 참조한다고 해도, HTMLElement에 대한 강한 참조는 오직 한번만 획득하게 됩니다.

paragraph = nil

// 클로저의 강한 참조 순환 해결하기.
// self의 멤버를 클로저 안에서 참조할때 someProperty나 someMethod 대신에 self.someProperty나 self.someMethod로 표기할 것을 요구

/*
lazy var someClosure: (Int, String) -> String = {
    [unowned self] (index: Int, stringToProcess: String) -> String in
    // closure body goes here
}
*/

/*
lazy var someClosure: () -> String = {
    [unowned self] in
    // closure body goes here
}
*/

// 약한 참조와 미소유 참조
// 만약 획득된 참조가 절대로 nil이 되지 않는다면, 그 참조는 약한 참조보다 미소유 참조로 해야할것입니다.
class HTMLElement2 {
    
    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        println("\(name) is being deinitialized")
    }

}

var paragraph2: HTMLElement2? = HTMLElement2(name: "p", text: "hello, world")
println(paragraph2!.asHTML())
// prints "<p>hello, world</p>"

paragraph = nil
// prints "p is being deinitialized"