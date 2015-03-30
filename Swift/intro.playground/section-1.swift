

// Playground - noun: a place where people can play

import UIKit

/**
 * Hello, World!
 */
var str = "Hello, playground"

println("hello, world!")
println(str)

/**
 * 변수와 상수
 */
var myVariable = 42
    myVariable = 50
let myConstant = 42 // 상수이므로 변경불가

/**
 * 초기값에 따른 데이터형 (람다식으로 강제 형선택)
 */
let inplicitInteger = 70
let implicitDouble = 70.0

// :(콜론)으로 데이터형을 명시 할 수 있다.
let explicitDouble: Double  = 70

/**
 * String 제어
 */
// 일반적인 형변환
let label = "The width is "
let width = 94
let widthLabel = label + String(width)  // String으로 형변환 하지 않으면 에러

// 백슬래시로 문자열 처리
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."   // 형변환 하지않고 문자열변환
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

/**
 * 배열
 */
// 기본적인 배열 (기본인덱스)
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

// 딕셔너리 (연관배열)
var occupations = [
    "Malcolm":"Captian",
    "Kaylee":"Mechanic",
]
occupations["Jayne"] = "Public Relations"

println(occupations)
// 빈 배열 & 빈 딕셔너리
let emptyArray = String[]()
let emptyDictionary = Dictionary<String, Float>()

shoppingList = [] // 빈 배열 처리
occupations = [:] // 빈 딕셔너리 처리

/**
 * 흐름제어
 */
// if & for 문에서는 언제나 bool형태가 되어야한다. (자바스크립트처럼 하면 에러)
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
teamScore

// 초기값 형태에 따른 처리
var optionalString: String? = "Hello"
optionalString == nil

// If 문
var optionalName: String? = nil//"John Appleseed"
optionalName == nil
var greeting = "Hello!"
// if문 내에 let으로 선언가능 (nil 일경우 if문을 타지않음)
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, Empty"
}

// Switch 문
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
// Default 문이 없으면 에러!
// Break문을 명시적으로 사용할 필요 없음..
default:
    let vegetableComment = "Everything tastes good in soup."
}

// for-in 문
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
// dictionary를 key/value를 가져오기 위해 for-in 에 2개의 변수처리
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
largest

// While 문 & Do While 문
var n = 2
while n < 100 {
    n = n * 2
}
n

var m = 2
do {
    m = m * 2
} while m < 100
m

// .. 은 0 <= x < 3
var firstForLoop = 0
// for (var i=0; i<3; i++)
for i in 0..3 {
    firstForLoop += i
}
firstForLoop

// ... 은 0 <= x <= 3
firstForLoop = 0
// for (var i=0; i<=3; i++)
for i in 0...3 {
    firstForLoop += i
}
firstForLoop


var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += 1
}
secondForLoop

/**
 * Function 함수
 */

// 매개변수 (name : type) -> return type
func greet(name: String, day: String, mes: String) -> String {
    return "Hello \(name), today is \(day). :: \(mes)"
}
greet("Bob", "Tuesday", "특별한 점심")

// 여러개 리턴이 가능
func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
getGasPrices()

// 자바의 ... 을 이용하여 여러개의 Int형 매개변수를 받을 수 있음
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
func averageOf(numbers: Int...) -> Int {
    var sum = 0, total = 0
    for number in numbers {
        sum += number
        total++
    }
    return sum/total
}

sumOf()
sumOf(42, 597, 12)
sumOf(42, 597, 12, 123, 321)
averageOf(42, 597, 332, 133, 321)
// sumOf(42, 597, 12, "123") [타입에러]

// 중첩함수 (함수내의 함수)
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// 클로져 함수
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// 함수를 인자로 받아 사용하는 클로져
func hasAnyMatches(list: Int[], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
//    return number < 10
    return number%2 == 0
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)

// map으로 내부 값 변환가능
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

// 형을 아는경우 사용
numbers.map({ number in 3 * number })

sort([1, 5, 3, 12, 2]) { $0 > $1 }
sort([1, 5, 3, 12, 2]) { $0 < $1 }

/**
 * Class
 */
class Shape {
    // let으로 선언한 경우 에러가 발생 (초기값을 넣어주는 init함수를 구현해야함)
    var numberOfSides = 0
    func simpleDescription(mes: String) -> String {
        return "A shape with \(numberOfSides) sides. \(mes)"
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription("OK")

// init함수가 구현된 클래스
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides. \(self.name)"
    }
    // 해제하기전 사용되는 함수
    deinit {
    }
}

var namedShape = NamedShape(name:"test")
var shapeDes = namedShape.simpleDescription()

// 클래스 상속
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() ->  Double {
        return sideLength * sideLength
    }
    
    // override 함수 구현
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

// 상속 및 오버라이드 테스트
class Circle: NamedShape {
    var radius: Double = 0.0
    let PI = 3.14

    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 1
    }
    
    func area() ->  Double {
        return radius * radius * PI
    }
    
    // override 함수 구현
    override func simpleDescription() -> String {
        return "A square with sides of length \(radius)."
    }
}
let test2 = Circle(radius: 5.2, name: "my test square")
test2.area()
test2.simpleDescription()

// Getter & Setter
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

// willSet & didSet을 이용하여 할당되기전/후를 처리할 수 있다.
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
triangleAndSquare.triangle.sideLength

class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

/**
 * 열거형(Enum) 및 구조체(Structure)
 */

// 열거형
// 첫번째 값을 명시적으로 사용할 경우 다른값들은 순서에 따라 자동으로 증가
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.toRaw()
var des = ace.simpleDescription()

// toRaw 와 fromRaw를 이용하여 열거형의 구성값을 Get/Set 할 수 있음
if let convertedRank = Rank.fromRaw(3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .Spades:
            return "black"
        case .Hearts:
            return "red"
        case .Diamonds:
            return "red"
        case .Clubs:
            return "black"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

// 구조체
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure...  \(error)"
}

// 프로토콜
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// 클래스 : 프로토콜
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

// 구조체 : 프로토콜
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// extension
extension Int: ExampleProtocol {
    var simpleDescription: String {
    return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
7.simpleDescription

extension Double: ExampleProtocol {
    var simpleDescription: String {
    return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
7.0.simpleDescription

let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
//protocolValue.anotherProperty  // Uncomment to see the error

// 제네릭 
func repeat<ItemType>(item: ItemType, times: Int) -> ItemType[] {
    var result = ItemType[]()
    for i in 0..times {
        result += item
    }
    return result
}
repeat("knock", 4)

// 열거형 & 구조체 & 클래스 에서도 사용가능
enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

// where를 추가하여 똑같은 타입을 요구할 수 있음
func anyCommonElements <T, U where T: Sequence, U: Sequence, T.GeneratorType.Element: Equatable, T.GeneratorType.Element == U.GeneratorType.Element> (lhs: T, rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])





