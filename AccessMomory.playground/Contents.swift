import UIKit
import Foundation

//@dynamicMemberLookup可以为数据结构增加动态成员查找的能力，使用@dynamicCallable可以将类型修饰为支持动态方法调用
@dynamicMemberLookup
@dynamicCallable
class CustomData {
    var name:String = ""
    var age:Int = 0
    subscript(dynamicMember member: String) -> String {
        return "unknow"
    }
    subscript(dynamicMember member: String) -> Int {
        return 0
    }
    func dynamicallyCall(willArguments arg:[String]) {
        print("unknow func:\(arg)")
    }
    func dynamicallyCall(withKeywordArguments pairs: KeyValuePairs<String, Int>) {
        let res = pairs.map {key, value in
            return "[\(key):\(value)]"
        }.joined(separator: "")
        print(res)
    }
}
let obj = CustomData()
obj("字符串参数","a","b") //unknow func:["字符串参数", "a", "b"]
obj(a:1, b:2) //[a:1][b:2]
print(obj.name)
let str:String = obj.other
let num:Int = obj.num
//将输出unknow 0
print(str, num)

let array = ["1","2","3"]
for item in array[0...]{
    print(item)
}

/*
 1
 2
 2
 */
var string3 = #"""
1\#n2\#n3\#n
"""#

// 将输出"1\n2\n3\n"
var string3 = #"""
1\n2\n3\n
"""#

var string1 = "这里有一个双引号\""
var string2 = #"这里有一个双引号""#

var multiLineString = """
abcd
jaki
24
"""
print(multiLineString)

var stepSize = 1
func increment(_ number: inout Int) {
   number += stepSize//crash
}
increment(&stepSize)

func increment(_ number: inout Int,_ number2: inout Int) {
   var a = number+number2
}
increment(&stepSize,&stepSize)
