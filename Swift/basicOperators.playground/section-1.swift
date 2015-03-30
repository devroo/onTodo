/*
 * 기본연산자 (Basic Operators)
 */

// 용어
// 단항연산자 (ex: -a)
// 전위연산자 (ex: !a)
// 후위연산자 (ex: a++)
// 이항연산자 (ex: a+b)
// 삼항연산자 (ex: a?b:c)

/*
 * 할당 연산자
 */

let b = 10
var a = 5
a = b
// a 는 이제 10 과 같습니다.

let (x, y) = (1, 2)
// x 는 1 과 같고 y 는 2 와 같다.

//if x = y {
//    // x = y가 값을 반환하지 않기 때문에 이것은 유효하지 않다,
//}

/*
 * 산술 연산자
 */

1 + 2             // 3
5 - 3             // 2
2 * 3             // 6
10.0 / 2.5        // 4.0

"hello, " + "world" // "hello, world" 와 같다

/*
let dog: Character = "🐶🐶
let cow: Character = "🐮"
let dogCow = dog + cow
// dogCow is equal to "🐶🐮"
*/

/*
 * 나머지 연산자
 */

9 % 4 // 1과 같다 : (4 x 2) + 1
-9 % 4 // -1과 같다 : (4 x -2) - 1

8 % 2.5 // 2.5와 같음 : 부동소수점 나머지는 여기서 지원한다.

/*
 * 증가 / 감소 연산자
 */

var i = 0
++i // i 는 이제 1과 같다

var f = 0
let g = ++f
// a 와 b 둘다 1과 같다.
let h = f++
// a 는 지금 2 입니다. 그러나 c는 이전의 값인 1이 이미 설정되어있습니다.

// 단항 플러스/마이너스 연산자
let three = 3
let minusThree = -three // minusThree equal -3
let plusThree = -minusThree // plus equal 3, or "minus minus         three"

let minusSix = -6
let alsoMinusSix = +minusSix // alsoMinusSix equals -6

// 복합 할당 연산자
var s = 1
s += 2
// a 는 3과 같다

// 비교연산자
1 == 1   // true, because 1 is equal to 1
2 != 1   // true, because 2 is not equal to 1
2 > 1    // true, because 2 is greater than 1
1 < 2    // true, because 1 is less than 2
1 >= 1   // true, because 1 is greater than or equal to 1
2 <= 1   // false, because 2 is not less than or equal to 1

// 삼항 연산자
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight 는 90과 같다

// 범위 연산자
for index in 1...5 {
    println("\(index) time 5 is \(index * 5)")
}
// 1번쨰 반복 5 is 5
// 2번쨰 반복 5 is 10
// 3번쨰 반복 5 is 15
// 4번쨰 반복 5 is 20
// 5번쨰 반복 5 is 25

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count

// 특정 레인지(Range)를 생성하던 오퍼레이터 '..'이 '..<'로 바뀜 (beta3부터)
for i in 0..<count {
    println("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack

/*
* 논리 연산자
*/

let allowedEntry = false
if !allowedEntry {
    println("ACCESS DENIED")
}
// prints "ACCESS DENIED"

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    println("Welcome!")
} else {
    println("ACCESS DENIED")
}
// prints "ACCESS DENIED"

let hasDoorKey = false
let knowOverridePassword = true
if hasDoorKey || knowOverridePassword {
    println("Welcome!")
} else {
    println("ACCESS DENIED")
}
// prints "Welcome!"

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowOverridePassword {
    println("Welcome!")
} else {
    println("ACCESS DENIED")
}
// prints "Welcome!"

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowOverridePassword {
    println("Welcome!")
} else {
    println("ACCESS DENIED")
}
// prints "Welcome!"
