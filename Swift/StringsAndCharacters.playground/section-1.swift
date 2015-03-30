import UIKit


/*
 * 문자열과 문자 (Strings and Characters)
 */

// 리터럴
let someString = "Some string literal value"

/*
이스케이프 특별 문자 \0 (null 문자), \\ (백슬래시), \t (수평 탭), \n (줄 바꿈), \r (캐리지 리턴), \" (큰따옴표), \' (작은따옴표)
1바이트 유니코드 스칼라는 \xnn 이며 nn은 두개의 16진수 숫자입니다.
2바이트 유니코드 스칼라는 \unnnn 이며 nnnn은 4개의 16진수 숫자입니다.
4바이트 유니코드 스칼라는 \Unnnnnnnn 이며 nnnnnnnn은 8개의 16진수 숫자입니다.
*/

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{0001F496}"  // 💖, Unicode scalar U+1F496

// 초기화
var emptyString = ""               // 빈 문자열 리터럴
var anotherEmptyString = String()  // 초기화 문법
// 두 문자열 모두 비어있으며 서로 똑같다.

if emptyString.isEmpty {
    println("여기엔 아무것도 보이지 않습니다.")
}
// prints 여긴 아무것도 보이지 않습니다."

// 가변성
var variableString = "Horse"
variableString += " and carriage"
// variableString 은 "Horse and carriage" 입니다.

let constantString = "Highlander"
// constantString += " and another Highlander"
// 컴파일 에러 - 상수 문자열은 변경될 수 없습니다.

// 캐릭터 작업
for character in "Dog!🐶"{
    println(character)
}
// D
// o
// g
// !
// 🐶

let yenSign: Character = "¥"

// 문자 세기
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
println("unusualMenagerie has \(countElements(unusualMenagerie)) characters")
// prints "unusualMenagerie has 40 characters"
// countElements 는 NSString의 utf16count 의 값을 의미

// 문자열 및 문자 합치기
let string1 = "hello"
let string2 = " there"
let character1: Character = "!"
let character2: Character = "?"

let stringPlusCharacter = string1 + character1        // equals "hello!"
let stringPlusString = string1 + string2              // equals "hello there"
let characterPlusString = character1 + string1        // equals "!hello"
let characterPlusCharacter = character1 + character2  // equals "!?"

var instruction = "look over"
instruction += string2
// instriction 은 "look over there" 와 같습니다.

var welcome = "good mornig"
welcome += character1
// welcome 은 "good morning!" 과 같습니다.

// 형변환 값입력
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"

// 문자열 비교
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    println("These two strings are considered equal")
}
// prints "These two strings are considered equal"

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

// hasPrefix 전위 문자열 찾기
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        ++act1SceneCount
    }
}
println("There are \(act1SceneCount) scenes in Act 1")
// prints "There are 5 scenes in Act 1"

// hasSuffix 후위 문자열 찾기
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        ++mansionCount
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        ++cellCount
    }
}
println("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// prints "6 mansion scenes; 2 cell scenes"

// 대문자와 소문자 ( uppercase / lowercase 가 사라졌나? )
let normal = "Could you help me, please?"
//let shouty = normal.uppercaseString
// shouty is equal to "COULD YOU HELP ME, PLEASE?"
//let whispered = normal.lowercaseString
// whispered is equal to "could you help me, please?"

// 유니코드
let dogString = "Dog!🐶" //( dog face : U+1F436 )

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ")
}
// 68 111 103 33 240 159 144 182

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ")
}
// 68 111 103 33 55357 56374