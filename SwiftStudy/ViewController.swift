//
//  ViewController.swift
//  SwiftStudy（Swift 教程 https://www.runoob.com/swift/swift-tutorial.html）
//  https://developer.apple.com/swift/
//
//  Created by guoliting on 2019/8/27.
//  Copyright © 2019 guoliting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let occ = OCClass();
        occ.ocInstanceMethod();
        OCClass.ocClassMethod();
        
        var index = 10
        
        while index < 20
        {
            print( "index 的值为 \(index)")
            index = index + 1
        }
        
        switch index {
        case 100  :
            print("index 的值为 100")
            fallthrough //如果使用了fallthrough 语句，则会继续执行之后的 case 或 default 语句，不论条件是否满足都会执行。
        case 10,15  :
            print("index 的值为 10 或 15")
            fallthrough
        case 5  :
            print("index 的值为 5")
            fallthrough
        default :
            print("默认 case")
        }
        
        print("闭区间运算符:")
        for index in 1...5 {
            print("\(index) * 5 = \(index * 5)")
        }
        
        print("半开区间运算符:")
        for index in 1..<5 {
            print("\(index) * 5 = \(index * 5)")
        }
        
        let A = 60  // 二进制为 0011 1100
        let B = 13 // 二进制为 0000 1101
        print("A&B 结果为：\(A&B)")
        print("A|B 结果为：\(A|B)")
        print("A^B 结果为：\(A^B)")
        print("~A 结果为：\(~A)")
        //现在计算机普遍使用补码表示负数。知道一个数的补码，要求其值的方法是：首先看符号位也就是最左的一位，如果是1代表是负数(-)如果是0代码是正数(+)，然后对该值取反再+1，得到其源码。例如本例中得到的 1111 1111 1111 1111 1111 1111 1111 1010，其符号位（最左一位）是1，表明它表示的是负数，欲求其源码，需先对其取反，然后再加1：0000 0000 0000 0000 0000 0000 0000 0101 + 1 = 0000 0000 0000 0000 0000 0000 0000 0110，然后在得到的源码前加一个负号，即-0000 0000 0000 0000 0000 0000 0000 0110 = -6。以上便是对~按位取反运算以及负数的二进制表示的理解，不难发现，在求源码的时候，要将补码进行取反后再加1，然而这个补码原本就是之前由~运算时，对原来的操作数通过~按位取反而得来的，所以，此时在求该补码的源码时的取反操作，相当于将补码变回了原来的那个操作数，之后进行的加1操作就相当于对原来的操作数进行加1，只不过结果变成了他的相反数。因此，可以总结出~按位取反的计算结论是：~n = -(n+1)
        
        let stringL = "Hello\tWorld\n\n菜鸟教程官网：\'http://www.runoob.com\'"
        print(stringL)
        
        let myString:String?
        myString = "a"
        if let yourString = myString {
            print("你的字符串值为 - \(yourString)")
        } else {
            print("你的字符串没有值")
        }
        if myString != nil {
            print(myString!) //强制解析：myString!
        } else {
            print("字符串为 nil")
        }
        
        var optionalInteger: Int?
//        var optionalInteger: Optional<Int>
        optionalInteger = 42
        
        let name = "菜鸟教程"
        let site = "http://www.runoob.com"
        print("\(name)的官网地址为：\(site)")
        
        let varB:Float
        varB = 3.14159
        print(varB)
        
        typealias Feet = Int
        let distance: Feet = 100
        print(distance)
        
        let theInput = readLine()
        
        let a = 1 + 2
        for x in 0...10 {
            print("\(x) ", terminator:"")
        }
        print()
        
        index = 15
        
        repeat {
            print( "index 的值为 \(index)")
            index = index + 1
        } while index < 20
//        while index < 20 {
//            print( "index 的值为 \(index)")
//            index = index + 1
//        }
        
        // 实例化 String 类来创建空字符串
        let stringB = String()
        
        if stringB.isEmpty {
            print( "stringB 是空的" )
        } else {
            print( "stringB 不是空的" )
        }
        
        // stringA 可被修改
        var stringA = "菜鸟教程："
        stringA += "http://www.runoob.com"
        print( stringA )
        
        // stringB 不能修改
//        let stringC = String("菜鸟教程：")
//        stringC += "http://www.runoob.com"
//        print( stringC )
        
        let varA   = 20
        let constA = 100
        let varC:Float = 20.0
        
        stringA = "\(varA) 乘于 \(constA) 等于 \(varC * 100)"
        print( stringA )
        
        stringA = "www.runoob.com"
        print( "\(stringA), 长度为 \(stringA.count)" )
        
        for ch in "Runoob" {
            print(ch)
        }
        
        var someInts = [Int]()
        
        someInts.append(20)
        someInts.append(30)
        someInts += [40]
        
        let someVar = someInts[0]
        print( "第一个元素的值 \(someVar)" )
        print( "第二个元素的值 \(someInts[1])" )
        print( "第三个元素的值 \(someInts[2])" )
        
        var someStrs = [String]()
        someStrs.append("Apple")
        someStrs.append("Amazon")
        someStrs.append("Runoob")
        someStrs += ["Google"]
        for item in someStrs {
            print(item)
        }
        for (index, item) in someStrs.enumerated() {
            print("在 index = \(index) 位置上的值为 \(item)")
        }
        
        let intsA = [Int](repeating: 2, count:2)
        let intsB = [Int](repeating: 1, count:3)
        let intsC = intsA + intsB
        for item in intsC {
            print(item)
        }
        
        var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
//        var oldVal = someDict.updateValue("One 新的值", forKey: 1) //updateValue(_:forKey:)方法返回旧的Optional值
        var oldVal = someDict[1]
        someDict[1] = "One 新的值"
        let someString = someDict[1]
//        var removedValue = someDict.removeValue(forKey: 2)
//        someDict[2] = nil
        print( "key = 1 旧的值 \(oldVal)" )
        print( "key = 1 的值为 \(someString)" )
//        print( "key = 2 的旧值为 \(removedValue)" )
        print( "key = 2 的值为 \(someDict[2])" )
        print( "key = 3 的值为 \(someDict[3])" )
        for (key, value) in someDict {
            print("字典 key \(key) -  字典 value \(value)")
        }
        for (key, value) in someDict.enumerated() {
            print("字典 key \(key) -  字典 (key, value) 对 \(value)")
        }
        let dictKeys = [Int](someDict.keys)
        let dictValues = [String](someDict.values)
        print("输出字典的键(key)")
        for (key) in dictKeys {
            print("\(key)")
        }
        print("输出字典的值(value)")
        for (value) in dictValues {
            print("\(value)")
        }
        
        var someDict1:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
        var someDict2:[Int:String] = [4:"Four", 5:"Five"]
        print("someDict1 含有 \(someDict1.count) 个键值对")
        print("someDict2 含有 \(someDict2.count) 个键值对")
        
        var someDict3:[Int:String] = [Int:String]()
        print("someDict1 = \(someDict1.isEmpty)")
        print("someDict2 = \(someDict2.isEmpty)")
        print("someDict3 = \(someDict3.isEmpty)")
        
//        func runoob(site: String) -> String {
//            return (site)
//        }
//        print(runoob(site: "www.runoob.com"))
        
        func runoob(name: String, site: String) -> String {
            return name + site
        }
        print(runoob(name: "菜鸟教程：", site: "www.runoob.com"))
        print(runoob(name: "Google：", site: "www.google.com"))
        
        func sitename() -> String {
            return "菜鸟教程"
        }
        print(sitename())
        
//        //函数返回值类型可以是字符串，整型，浮点型等。元组与数组类似，不同的是，元组中的元素可以是任意类型，使用的是圆括号。
//        func minMax(array: [Int]) -> (min: Int, max: Int) {
//            var currentMin = array[0]
//            var currentMax = array[0]
//            for value in array[1..<array.count] {
//                if value < currentMin {
//                    currentMin = value
//                } else if value > currentMax {
//                    currentMax = value
//                }
//            }
//            return (currentMin, currentMax)
//        }
//        let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
//        print("最小值为 \(bounds.min) ，最大值为 \(bounds.max)")
        
        func minMax(array: [Int]) -> (min: Int, max: Int)? {
            if array.isEmpty {
                print("数组为空")
                return nil
            }
            var currentMin = array[0]
            var currentMax = array[0]
            for value in array[1..<array.count] {
                if value < currentMin {
                    currentMin = value
                } else if value > currentMax {
                    currentMax = value
                }
            }
            return (currentMin, currentMax)
        }
//        if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
        if let bounds = minMax(array: []) {
            print("最小值为 \(bounds.min)，组大值为 \(bounds.max)")
        }
        
        func runoob1(site: String) {
            print("菜鸟教程官网：\(site)")
        }
        runoob1(site: "http://www.runoob.com")
        
        func pow(firstArg a: Int, secondArg b: Int) -> Int {
            var res = a
            for _ in 1..<b {
                res = res * a
            }
            print(res)
            return res
        }
        pow(firstArg:5, secondArg:3)
        
        //可变参数可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数，其数量是不确定的。可变参数通过在变量类型名后面加入（...）的方式来定义。
        func vari<N>(members: N...){
            for i in members {
                print(i)
            }
        }
        vari(members: 4,3,5)
        vari(members: 4.5, 3.1, 5.6)
        vari(members: "Google", "Baidu", "Runoob")
        
        func swapTwoInts(_ a: inout Int, _ b: inout Int) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
        var x = 1
        var y = 5
        swapTwoInts(&x, &y)
        print("x 现在的值 \(x), y 现在的值 \(y)")
        
        func sum(a: Int, b: Int) -> Int {
            return a + b
        }
        var addition: (Int, Int) -> Int = sum
        print("输出结果: \(addition(40, 89))")
        
        func another(addition: (Int, Int) -> Int, a: Int, b: Int) {
            print("输出结果: \(addition(a, b))")
        }
        another(addition: sum, a: 10, b: 20)
        
        func calcDecrement(forDecrement total: Int) -> () -> Int {
            var overallDecrement = 0
            func decrementer() -> Int {
                overallDecrement -= total
                return overallDecrement
            }
            return decrementer
        }
        let decrem = calcDecrement(forDecrement: 30)
        print(decrem())
    }
}

