// Playground - noun: a place where people can play

import UIKit

/*
 * 클래스와 구조체 (Classes and Structures)
 */

// 클래스와 구조체의 비교 (Comparing Classes and Structures)
// ex>
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// 클래스와 구조체 인스턴스 (Class and Structure Instances)
let someResolution = Resolution()
let someVideoMode = VideoMode()

// 프로퍼티 접근 (Accessing Properties)
println("The width of someResolution is \(someResolution.width)")
// prints "The width of someResolution is 0"

println("The width of someVideoMode is \(someVideoMode.resolution.width)")
// prints "The width of someVideoMode is 0"

someVideoMode.resolution.width = 1280
println("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// prints "The width of someVideoMode is now 1280"

// 구조체 타입을 위한 멤버들의 초기화 (Memberwise Initializers for Structure Types)
let vga = Resolution(width: 640, height: 480)

// 구조체와 열거형은 값 타입 (Structures and Enumerations Are Value Types)
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

println("cinema is now \(cinema.width) pixels wide")
// prints "cinema is now 2048 pixels wide"

println("hd is still \(hd.width) pixels wide")
// prints "hd is still 1920 pixels wide"

// 열거형은 값에 의한 복사가 일어남
enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    println("The remembered direction is still .West")
}
// "The remembered direction is still .West" 출력

// 클래스는 동일한 인스턴스를 참조하는 형태
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
alsoTenEighty
tenEighty

println("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// prints "The frameRate property of tenEighty is now 30.0"

// 식별연산자(Identity Operators)
if tenEighty === alsoTenEighty {
    println("tenEighty and alsoTenEighty refer to the same Resolution instance.")
}
// "tenEighty and alsoTenEighty refer to the same Resolution instance." 출력

/**
 * 포인터 (Pointers)
 */

// 클래스와 구조체중에 선택하기 (Choosing Between Classes and Structures)

/*
일반적인 가이드로는 아래의 조건중에 한가지또는 그 이상일 경우에는 구조체를 생각하십시오.
    
구조체의 주목적이 몇몇 연관성있는 간단한 데이터 값의 캡슐화일 경우
캡술화된 값들이 그 구조체의 인스턴스가 할당될때나 전달될때 참조보다는 복사가 예상될 경우
구조체에 저장되는 모든 프로퍼티들이 참조보다는 복사가 예상되는 값형식일 경우
구조체가 다른 형(type)에서부터 프로퍼티나 기능이 상속될 필요가 없을 경우
구조체를 사용하는 좋은 예:

Double형을 갖는 width와 height 프로퍼티의 캡슐화를 하는 기하학적 모형의 사이즈.
Int형을 갖는 start와 length 프로퍼티의 캡슐화를 하는 시리즈의 범위에 접근하는 방법.
Double형을 갖는 x,y와 z 프로퍼티의 캡슈화를 하는 3차원 좌표시스템의 포인터.
*/

// 컬렉션 형의 할당과 복사 (Assignment and Copy Behavior for Collection Types)

/*
Array와 Dictionary의 복사는 구조체가 아닌 클래스로 구현된 NSArray와 NSDictionary의 복사와도 또한 다르게 작동합니다. NSArray와 NSDictionary인스턴스는 언제나 복사가 아니라 인스턴스의 레퍼런스가 전달되거나 할당됩니다.
*/

var ages = ["Peter": 23, "Wei": 35, "Anish": 65, "Katya": 19]
var copiedAges = ages

copiedAges["Peter"] = 24
println(ages["Peter"]!)
// "23" 출력

// 배열의 할당과 복제 (Assignment and Copy Behavior for Arrays)

var a = [1, 2, 3]
var b = a
var c = a
var d = a

println(a[0])
// 1
println(b[0])
// 1
println(c[0])
// 1

a[0] = 42
println(a[0])
// 42
println(b[0])
// 42
println(c[0])
// 42

a.append(4)
a[0] = 777
println(a[0])
a
// 777
println(b[0])
// 42
println(c[0])
// 42

// 배열 유니크 확인 (Ensuring That an Array Is Unique)

// unshare 메소드가 사라졌나???
// b.unshare()

b[0] = -105
println(a[0])
// 777
println(b[0])
// -105
println(c[0])
// 42

/*
같은것을 바라보고 있는지 체크하는 로직인데, 왜 에러가 나는지 의문?

if b === c {
    println("b and c still share the same array elements.")
} else {
    println("b and c now refer to two independent sets of array elements.")
}
// prints "b and c now refer to two independent sets of array elements."

if b[0...1] === b[0...1] {
    println("These two subarrays share the same elements.")
} else {
    println("These two subarrays do not share the same elements.")
}
// prints "These two subarrays share the same elements."
*/

// 강제로 배열 복제하기 (Forcing a Copy of an Array)

var names = ["Mohsen", "Hilary", "Justyn", "Amy", "Rich", "Graham", "Vic"]

// copy 메소드가 사라짐?
// var copiedNames = names.copy()

// copiedNames[0] = "Mo"
println(names[0])
// "Mohsen" 출력