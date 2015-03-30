/*
 * 속성 (Properties)
 */

// 저장속성 (Stored Property)
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0,  length: 3)
// the range represents integer values 0,  1,  and 2

rangeOfThreeItems.firstValue = 6
// the range now  represents integer val ues 6,  7,  and 8

// 상수 구조체 인스턴스의 저장속성 (Stored Properties of Constant Structure Instances)
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// this range represents integer values 0, 1, 2, and 3
// rangeOfFourItems.firstValue = 6 <-- error
// this will report an error, even thought firstValue is a variable property

// 게으른 저장속성(Lazy Stored Property)
 // 무슨 오류인지는 모르겟찌만, 클래스 문제인건지 그리고 manager.data += "String"이 왜 안들어가는지 파악해볼것
/*
class DataImporter2 {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a non-trivial amount of time to initialize.
    */
    var fileName = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager2 {
// @lazy -> lazy 로 @를 삭제하는 것으로 변경
    lazy var importer = DataImporter2()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager2()
manager.data[0] += "Some data"
manager.data[1] += "Some more data"
// the DataImporter instance for the importer property has not yet been created
*/

// 게으른 저장속성으로 되어있기 때문에 지금 속성을 조회할 때처럼 최초의 접근 시 생성됨
// println(manager.importer.fileName)
// the DataImporter instance for the importer property has now been created
// prints "data.txt"

// 계산속성 (Computed Properties)

// 계산속성은 실제로 값을 저장하지는 않고, 다른 속성이나 값들이 간접적으로 접근하여 값을 조회하거나 수정할 수 있는 getter와 선택적인 setter를 제공한다.
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
println("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// prints "square.origin is now at (10.0, 10.0)"

// 속기식의 Setter 선언(Shorthand Setter Declaration)
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// 읽기전용 계산속성 (Read-Only Computed Properties)
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
println("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// prints "the volume of fourByFiveByTwo is 40.0"

// 읽기전용 계산속성의 선언은 단순히 get 키워드와 중괄호를 제거
// 읽기전용을 포함한 모든 계산속성은 반드시 var 키워드로 선언되어야한다

// 속성감시자 (Property Observers)

// 오버라이딩 되지 않은 계산 속성에 속성감시자를 추가할 필요는 없다. 계산 속성 설정자(setter)에서 직접 해당 값 변화를 감시하고 대응할 수 있기 때문
// willSet과 didSet 감시자는 속성이 최초로 초기화될 때는 호출되지 않는다. 속성값이 초기화 문맥을 벗어나서 설정되는 경우에만 호출

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            println("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                println("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps
stepCounter.totalSteps = 16

// 전역 변수와 지역 변수(Global and Local Variables)

// 전역 상수와 변수는 Lazy Stored Properties와 유사한 방식으로 항상 지연 계산한다. 그러나 지연 저장 속성과는 다르게 전역 상수와 변수는 @lazy이라는 특성으로 표시하지 않아도 된다


// 타입 속성의 문법 (Type Property Syntax)
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1;
        // return an Int value here
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1;
        // return an Int value here
    }
}
class SomeClass {
    class var computedTypeProperty: Int {
        return 1;
        // return an Int value here
    }
}
// return 값이 없으면 에러가 난다.

// 타입 속성 조회와 설정 (Querying and Setting Type Properties)
println(SomeClass.computedTypeProperty)
// prints "42"

println(SomeStructure.storedTypeProperty)
// prints "Some value."
SomeStructure.storedTypeProperty = "Another value."
println(SomeStructure.storedTypeProperty)
// prints "Another value."

// 오디오 채널 예제
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
println(leftChannel.currentLevel)
// prints "7"
println(AudioChannel.maxInputLevelForAllChannels)
// prints "7"

rightChannel.currentLevel = 11
println(rightChannel.currentLevel)
// prints "10"
println(AudioChannel.maxInputLevelForAllChannels)
// prints "10"