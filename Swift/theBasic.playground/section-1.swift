// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * type
 */

let maximumNumberOfLoginAttempts = 10
//maximumNumberOfLoginAttempts = 22
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

// 10진수 지수
1.25e-2
1.25e2

// 16진수 지수
0xFp2
0xFp-2

// 17을 나타내는 2,8,16진수
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

// 부동소수점 표현
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

//let cannotBeNegative: UInt8 = -1
// UInt8 cannot store negative numbers, and so this will report an error

//let tooBig: Int8 = Int8.max + 1
// Int8 cannot store a number larger than its maximum value,
// and so this will also report an error

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
// 서로 타입이 다르기 때문에 연산에 에러가 표시됨, UInt16으로 변환해서 사용
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi equals 3.14159, and is inferred to be of type Double

// 타입 알리아스 : 타입을 내가 원하는 이름으로 변경해서 사용
typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.max
// maxAmplitudeFound is now 0

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    println("Mmm, tasty turnips!")
} else {
    println("Eww, turnips are horrible.")
}
// prints "Eww, turnips are horrible."

let i = 1
//if i {
    // this example will not compile, and will report an error
//}

if i == 1 {
    // this example will compile successfully
}

/*
 * 튜플 (tuple)
 */

// 튜플 (타입 상관없이 하나의 값으로 묶어줌)
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")

// 변수 순서로 get처리
let (statusCode, statusMessage) = http404Error
println("The status code is \(statusCode)")
// prints "The status code is 404"
println("The status message is \(statusMessage)")
// prints "The status message is Not Found"

// 튜플에서 무시할 부분은 _(언더바)로 처리
let (justTheStatusCode, _) = http404Error
println("The status code is \(justTheStatusCode)")
// prints "The status code is 404"  

// index로 get처리
println("The status code is \(http404Error.0)")
// prints "The status code is 404"
println("The status message is \(http404Error.1)")
// prints "The status message is Not Found"

let http200Status = (statusCode: 200, description: "OK")

println("The status code is \(http200Status.statusCode)")
// prints "The status code is 200"
println("The status message is \(http200Status.description)")
// prints "The status message is OK"

/*
 * 옵셔널 (optional) : 값의 부재를 의미
 */

let possibleNumber = "123"
let convertedNumber = possibleNumber.toInt()
// convertedNumber is inferred to be of type "Int?", or "optional Int"
// optional Int = Int? 와 같다. int값인지 값이 없는지를 의미함

// 강제 언랩핑 : 마지막에 느낌표를 붙임으로써 저 변수가 optional임을 아는상태로 저 변수를 사용해라라고 강제로 명령함
if convertedNumber {
    convertedNumber
    println("\(possibleNumber) has an integer value of \(convertedNumber)")
    "\(possibleNumber) has an integer value of \(convertedNumber!)"
} else {
    println("\(possibleNumber) could not be converted to an integer")
}
// prints "123 has an integer value of 123"
// 강제 언랩핑을 하기 전에는 항상 nil인지 확실한 상태에서 써야한다

//if let constantName = someOptional {
//    statements
//}

if let actualNumber = possibleNumber.toInt() {
    println("\(possibleNumber) has an integer value of \(actualNumber)")
    "\(possibleNumber) has an integer value of \(actualNumber)"
} else {
    println("\(possibleNumber) could not be converted to an integer")
}
// prints "123 has an integer value of 123"

// nil의 경우 optional 이 아닌경우 사용할 수 없다.
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value

// 자동으로 nil이 설정
var surveyAnswer: String?
// surveyAnswer is automatically set to nil
// niil은 objective-c 에서는 null pointer로 사용되었는데 swift에서는 값의 부재를 의미하도록 사용

// 일반적인 optional과 무조건적인 optional의 차이
let possibleString: String? = "An optional string."
println(possibleString!) // requires an exclamation mark to access its value
// prints "An optional string."

let assumedString: String! = "An implicitly unwrapped optional string."
println(assumedString)  // no exclamation mark is needed to access its value
// prints "An implicitly unwrapped optional string."
// 전자보다 후자가 낫다.
// 만일 정확하지 않은 값에 무조건적인 optional을 사용 할 경우 런타임 에러가 난다.


// 값을 가졌는지 체크
// 일반적인 옵셔널 처리
if assumedString {
    println(assumedString)
}
// prints "An implicitly unwrapped optional string."

// 옵셔널 바인딩 처리
if let definiteString = assumedString {
    println(definiteString)
}
// prints "An implicitly unwrapped optional string."
// Implicitly Unwrapped Optional(무조건적인 옵셔널)은 nil이 사용될 가능성이 있는 변수에는 사용하면 안된다. nil이 필요할 경우 일반적인 옵셔널로 사용

/*
 * Assertions : 테스트 코드 처리용(true일때만 실행, false라면 앱종료)
 */

let age = -3
assert(age >= 0, "A person's age cannot be less than zero")
// this causes the assertion to trigger, because age is not >= 0
assert(age >= 0)

// 올바른 사용방법
//  서브스크립트의 인덱스 값이 너무 크거나 너무 작을때
//  함수로 넘긴값이 함수를 진행하는데 적합하지 않을때
//  옵셔널 값이 nil인데 추후 코드진행을 위해 nil이 아닌 값이 필요할때














