// Playground - noun: a place where people can play

import UIKit

/*
 * 옵셔널 체인 (Optional Chaining)
 */

/*
    스위프트(Swift)의 옵셔널 체인이 오브젝티브씨(Objective-C)에 있는 nil에 메시지 보내기와 유사하다. 그러나, 모든 타입(any type)에서 동작하고, 성공, 실패 여부를 확인할 수 있다는 점에서 차이가 있다.
*/

// 강제 랩핑 해제(Forced Unwrapping) 대안으로써 옵셔널 체인
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

//let roomCount = john.residence!.numberOfRooms
// 강제 랩핑 에러 (nil이기떄문에)

if let roomCount = john.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
} else {
    println("Unable to retrieve the number of rooms.")
}
// prints "Unable to retrieve the number of rooms."

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
} else {
    println("Unable to retrieve the number of rooms.")
}
// prints "John's residence has 1 room(s)."

// 옵셔널 체인을 위한 모델(Model) 클래스(Class) 선언
