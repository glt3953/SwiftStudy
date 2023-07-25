import UIKit

var dicOri4 = ["王晓":98, "邹明":86, "李小伟":93]
for item in dicOri4.sorted(by: {(student1, student2) -> Bool in return student1.value > student2.value}) {
    print(item)
}

var stringOri2 = "swsvr!vrfe?123321!!你好!世界？"
var stringRes2 = String()
for index in stringOri2.indices {
    if stringOri2[index] != "?" && stringOri2[index] != "!" {
        stringRes2.append(stringOri2[index])
    }
}
print(stringRes2)

//声明字典[param1:param2]，这种结构用于表示字典类型，param1为键类型，param2为值类型
var dic1:[Int:String]
//这种方式和[:]效果一样，dic2与dic1为相同的类型
var dic2:Dictionary<Int,String>
//字典创建与赋值
dic1 = [1:"1",2:"2",3:"3"]
//通过键删除某个键值对
dic1.removeValue(forKey: 1)
//删除所有键值对
dic1.removeAll()
//使用if let 处理updateValue的返回值
if let oldValue = dic1.updateValue("One", forKey: 1) {
   print("Old Value is \(oldValue)")
}
//对键值进行更新
dic1.updateValue("1", forKey: 1) //如果这个键不存在，则不添加新键值对
dic2 = Dictionary(dictionaryLiteral: (1,"1"),(2,"2"),(3,"3"))
//排序遍历
for item in dic2.keys.sorted(by: >) {
    print(dic2[item]!)
}
for item in dic2.keys {
    print(item)
}
for item in dic2.values {
    print(item)
}
for item in dic2 {
    print(item)
}
for (key,value) in dic2 {
    print("\(key):\(value)")
}
//通过键获取的数据也将返回Optional类型的值，也可以使用if let
if let value = dic2[1] {
   print("The Value is \(value)")
}
//在创建字典时，也可以不显式声明字典的类型，可以通过赋初值的方式来使编译器自动推断
var dic3 = ["1":"one"]
//创建空字典
var dic4:[Int:Int] = [:]
var dic5:Dictionary<Int,Int> = Dictionary()
//获取字典中的元素个数
dic1.count
//判断字典是否为空
if dic4.isEmpty{
   print("字典为空")
}
//通过键操作值
//获取值
dic1[2]
//修改值
dic1[1]="0"
//添加一对新的键值
dic1[4] = "4"

var set5:Set = [1,2]
var set6:Set = [2,3]
var set7:Set = [1,2,3]
for item in set7 {
    print(item)
}
for item in set7.enumerated() {
    print(item)
}
for index in set7.indices {
    print(set7[index])
}
//从大到小排序再遍历集合
for item in set7.sorted(by: >) {
   print(item)
}

var set8:Set = [1,2,3]
//判断是否是某个集合的子集，set5是set7的子集，返回ture
set5.isSubset(of: set7)
//判断是否是某个集合的超集，set7是set5的超集，返回ture
set7.isSuperset(of: set5)
//判断是否是某个集合的真子集，set5是set7的真子集，返回ture
set5.isStrictSubset(of: set7)
//判断是否是某个集合的真超集，set7不是set8的真超集，返回false
set7.isStrictSuperset(of: set8)
//判断是否是某个集合的超集，set7是set8的超集，返回ture
set7.isSuperset(of: set8)

var set3:Set<Int> = [1,2,3,4]
var set4:Set<Int> = [1,2,5,6]
//返回交集 {1，2}
var setInter = set3.intersection(set4)
//返回交集的补集{3，4，5，6}
var setEx = set3.symmetricDifference(set4)
//返回并集{1，2，3，4，5，6}
var setUni = set3.union(set4)
//返回第二个集合的补集{3，4}
var setSub = set3.subtracting(set4)

//创建set
var set1:Set<Int> = [1,2,3,4]
var set2 = Set(arrayLiteral: 1,2,3,4)
//向集合中插入一个元素
set1.insert(5)
//移除集合中的某个元素
set1.remove(1)
//移除集合中的第一个元素
set1.removeFirst()
//移除集合中某个位置的元素
set1.remove(at: set1.firstIndex(of: 3)!) //返回一个Optional类型的可选值，因为要寻找的元素可能不存在，在使用时，开发者需要对其进行拆包操作。
//移除集合中所有的元素
set1.removeAll()
//获取集合首个元素（顺序不定）
set1[set1.startIndex]
//进行下标的移动
//获取某个下标后一个元素
set1[set1.index(after: set1.startIndex)]
//获取某个下标后几个元素
set1[set1.index(set1.startIndex, offsetBy: 3)]

var arraySort = [1,3,5,6,7]
//获取数组中的最大值
arraySort.max()
//获取数组中的最小值
arraySort.min()
//从大到小排序
arraySort = arraySort.sorted(by: >)
//从小到大排序
arraySort = arraySort.sorted(by: <)

let arrayLet = [0,1,2,3,4]
for item in arrayLet {
    print(item)
}
for item in arrayLet.enumerated() {
    print(item)
}
let arrayLet2 = [(1,2),(2,3),(3,4)]
for index in arrayLet2.indices {
    print(arrayLet2[index], separator: "")
}

var greeting:String
greeting = "Hello, MyPlayground"
print(greeting)

//声明定义了3个变量：整数类型变量a、浮点数类型变量b和字符串类型变量c
//编译器推断
var a=1,b=2.9,c="string"
//手动指定
var a2:Int=1,b2:Float=2.9,c2:String="string"

//声明3个Int类型的变量
var one,two,three:Int

//驼峰命名
var userName = "宁侠"

//8位无符号整型数的最大值255
var a1 = UInt8.max
//16位无符号整型数的最大值65535
var a2 = UInt16.max
//32位无符号整型数的最大值4294967295
var a3 = UInt32.max
//64位无符号整型数的最大值18446744073709551615
var a4 = UInt64.max
//获取数据类型所占位数，在64位机器上UInt占8字节64位
var a5 = MemoryLayout<UInt>.size

var intSize = sizeof(Int) //8位
var c = MemoryLayout<Double>.size //8字节

var sum = 1.25e3 //1.25*(10^3) = 1250
var sun2 = 0x1p3 //1*(2^3) = 8

//创建钢笔元组类型，其中有两种类型，即字符串类型的名称和整数类型的价钱
var pen:(name:String,price:Int) = ("钢笔",2)
//获取pen变量名称
var name = pen.name
//获取pen变量价格
var price = pen.price

//不指定参数名称的元组
var car:(String,Int) = ("奔驰",2000000)
//通过下标来取得元组中各个组成元素的值
var carName = car.0
var carPrice = car.1
//进行元组的分解
var (theName,thePrice) = car
//此时 theName变量被赋值为"奔驰"，thePrice变量被赋值为2000000
print(theName,thePrice)
//进行元组的分解，将Int型参数进行匿名
var (theName,_) = car
//此时theName变量被赋值为"奔驰"
print(theName)

var obj:String? //将普通类型包装为Optional类型
if obj==nil {
}

//声明obj为String?类型
var obj:String? = "HS"
if obj != nil {
   obj!
}

// 声明obj4为隐式解析的变量
var obj4:Int!
obj4 = 3
// 在使用时，无须再进行拆包操作，Swift会自动帮我们拆包
print(obj4 + 1)

//为Int类型取一个别名Price
typealias Price = Int
//使用Price代替Int，效果完全一样
var penPrice:Price = 100

str = String(describing: Int.self)  //通过类型来构造字符串 "Int"
//字符串的组合
var c1 = "Hello"
var c2 = "World"
var c3 = c1+" "+c2  //"Hello World" //注意中间拼接了一个空格
//使用\()进行字符串插值
var d = "Hello \(123)"   //"Hello 123"
var d2 = "Hello \(c2)"   //"Hello World"
var d3 = "Hello \(1+2)"   //"Hello3"

MemoryLayout<String>.size  //16个字节，获取String类型占用的内存空间

//创建一个字符
var e:Character = "a"
//创建字符数组
var e2 : [Character] = ["H","E","L","L","O"]
//通过字符数组来构造字符串 "HELLO"
var e3 = String(e2)
//通过构造方法来创建字符类型变量
var e4 = Character("a")
//进行for-in遍历
let name = "China"
for character in name {
   print(character)
}

//判断字符串是否为空
var obj1 = ""
if obj1.isEmpty {
   print("字符串为空字符串")
}
//获取字符串中的字符个数，判断是否为空字符串
if obj1.count == 0 {
   print("字符串为空字符串")
}

var string = "Hello-Swift"
//获取字符串的起始下标String.index类型
var startIndex = string.startIndex
//获取字符串的结束下标 String.index类型
var endIndex = string.endIndex
//获取某个下标后一个下标对应的字符 char="e"
var char = string[string.index(after: startIndex)]
//获取某个下标前一个下标对应的字符 char2 = "t"
var char2 = string[string.index(before: string.endIndex)]
//通过范围获取字符串中的一个子串 Hello
var subString = string[startIndex...string.index(startIndex, offsetBy: 4)]
var subString2 = string[string.index(endIndex, offsetBy: -5)..<endIndex]
string.removeAll()

var string2 = "My name is Jaki"
//全部转换为大写
string2 = string2.uppercased() //结果为"MY NAME IS JAKI"
//全部转换为小写
string2 = string2.lowercased() //结果为"my name is jaki"
//检查字符串是否有My前缀
string2.hasPrefix("My")
//检查字符串是否有jaki后缀
string2.hasSuffix("jaki")
