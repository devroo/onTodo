// Playground - noun: a place where people can play

import UIKit

/**
 * 메서드 (Methods)
 */

class Counter {
    var count = 0
    func increment() {
        count++
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
// 초기 counter값은 0입니다
counter.increment()
// counter값은 이제 1입니다
counter.incrementBy(5)
// counter값은 이제 6입니다
counter.reset()
// counter값은 이제 0입니다

// 메소드를 위한 지역 및 외부 변수 이름
class Counter2 {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
    
    // self 프로퍼티
    func increment() {
        self.count++;
    }
}

let counter2 = Counter2()
counter2.incrementBy(5, numberOfTimes: 3)
// Counter value is now 15

// 외부 파라미터와 이름을 같게~
func incrementBy(amount: Int, #numberOfTimes: Int) {
    var count: Int = 0
    count += amount * numberOfTimes
}


// self 프로퍼티
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return (self.x > x)
    }
    
    // 인스턴스 메소드 안에서의 값타입 변경
    // 구조체 타입의 상수에 변화메소드를 호출할 수 없다는 것 (mutating가 필요)
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    println("This point to the right of the line where x == 1.0")
}
// prints “This point is to the right of the line where x == 1.0”

somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)
println("The point is now at (\(somePoint.x), \(somePoint.y))")
// prints "The point is now at (3.0, 4.0)

let fixedPoint = Point(x: 3.0, y: 3.0)
// 상수는 값을 변경할 수 없다.
// fixedPoint.moveByX(2.0, y: 3.0)
// this will report an error


// 변하는(Mutating) 메소드안에서 self에 할당하기
struct MPoint {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = MPoint(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
// ovenLight is now equal to .High
ovenLight.next()
// ovenLight is now equal to .Off

// 타입 메소드
class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}
class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(1)
println("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// prints "highest unlocked level is now 2"

player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) {
    println("player is now on level 6")
} else {
    println("level 6 has not yet been unlocked")
}
// prints "level 6 has not yet been unlocked"