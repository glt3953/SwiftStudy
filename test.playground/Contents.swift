import UIKit
import Darwin
import RegexBuilder

// Text to parse:
// CREDIT  03/02/2022  Payroll from employer     $200.23
// CREDIT  03/03/2022  Suspect A           $2,000,000.00
// DEBIT   03/03/2022  Ted's Pet Rock Sanctuary    $2,000,000.00
// DEBIT   03/05/2022  Doug's Dugout Dogs      $33.27

import RegexBuilder
let fieldSeparator = /\s{2,}|\t/
let transactionMatcher = Regex {
  /CREDIT|DEBIT/
  fieldSeparator
  One(.date(.numeric, locale: Locale(identifier: "en_US"), timeZone: .gmt)) // 👈🏻 we define which data locale/timezone we want to use
  fieldSeparator
  OneOrMore {
    NegativeLookahead { fieldSeparator } // 👈🏻 we stop as soon as we see one field separator
    CharacterClass.any
  }
  fieldSeparator
    One(.localizedCurrency(code: "USD", locale: <#Locale#>).locale(Locale(identifier: "en_US")))
}


let s1 = "I am not a good painter"
print(s1.ranges(of: /good/))
do {
    let regGood = try Regex("[a-z]ood")
    print(s1.replacing(regGood, with: "bad"))
} catch {
    print(error)
}
print(s1.trimmingPrefix(/i am/.ignoresCase()))

let reg1 = /(.+?) read (\d+) books./
let reg2 = /(?<name>.+?) read (?<books>\d+) books./
let s2 = "Jack read 3 books."
do {
    if let r1 = try reg1.wholeMatch(in: s2) {
        print(r1.1)
        print(r1.2)
    }
    if let r2 = try reg2.wholeMatch(in: s2) {
        print("name:" + r2.name)
        print("books:" + r2.books)
    }
} catch {
    print(error)
}


//let s1: String? = "hey"
//let s2: String? = "u"
//if let s1 {
//    print(s1)
//}
//
//func test() {
//    guard let s1, let s2 else { return }
//    print(s1 + " " + s2)
//}

// 为参数设置默认值
func f1(p: String = "p") -> String {
    "p is \(p)"
}

// 函数作为参数
func f2(fn: (String) -> String, p: String) -> String {
    return fn(p)
}

print(f2(fn:f1, p: "d")) // p is d

// 函数作为返回值
func f3(p: String) -> (String) -> String {
    return f1
}

print(f3(p: "yes")("no")) // p is no

func f4(s: String..., i: Int...) {
    print(s)
    print(i)
}

f4(s: "one", "two", "three", i: 1, 2, 3)
/// ["one", "two", "three"]
/// [1, 2, 3]

func f5() {
    nf5()
    func nf5() {
        print("this is nested function")
    }
}
f5() // this is nested function
