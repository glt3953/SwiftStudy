//
//  ViewController.swift
//  SwiftStudy（Swift 教程 https://www.runoob.com/swift/swift-tutorial.html）
//
//  Created by guoliting on 2019/8/27.
//  Copyright © 2019 guoliting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    }
}

