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
    }


}

