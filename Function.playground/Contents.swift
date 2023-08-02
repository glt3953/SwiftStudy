import UIKit
import Darwin

//创建一个字典示例
let dic:Dictionary = [1:"1",2:"2",3:"3",4:"4",5:"5"]
//创建一个函数，通过闭包来传递遍历结果
func MyEnumDic(dic:Dictionary<Int,String>,closure:(_ key:Int, _ value:String) ->Bool) {
    //遍历字典，此时无序
    for item in dic {
    //执行闭包代码
        if closure(item.0,item.1) {
            //如果闭包返回值为true，则中断遍历
            return
        }
    }
}
MyEnumDic(dic:dic) { (key, value)->Bool in
    if key == 3 {
        //开发者自己控制中断遍历的逻辑
        print(value)
        return true
    }
    print(value)
    return false
}

//计算阶乘的函数
func funcOne(param:Int) -> Int {
    guard param>0 else {
        return 0
    }
    
    var tmp = param
    var result = 1
    while tmp>0 {
        result *= tmp
        tmp -= 1
    }
    
    return result
}
funcOne(param: 5)

//将闭包参数声明为自动闭包
func myFunc2(closure: @autoclosure ()->Bool) {
}
//调用函数时，直接传入一个表达式即可，编译器会自动生成闭包参数
myFunc2(closure: 1+2+3>10)

//原结构
mySort(array: &stuArr, sortClosure: {
($0 as! Student).achievement > ($1 as! Student).achievement
})
//后置闭包结构
mySort(array: &stuArr) {
    ($0 as! Student).achievement > ($1 as! Student).achievement
}

//编写一个学生类
class Student:CustomStringConvertible {
    //学生成绩
    let achievement:Int
    //学生姓名
    let name:String
    //构造方法
    init(name:String,achievement:Int) {
        self.achievement=achievement
        self.name=name
    }
    //自定义打印方法
    var description:String {
        return"\(name):\(achievement)"
    }
}

//创建4个学生
let stu1=Student(name:"小王", achievement:89)
let stu2=Student(name:"小李", achievement:69)
let stu3=Student(name:"小张", achievement:81)
let stu4=Student(name:"小孙", achievement:93)
//将学生放入数组
var stuArr:Array<Any>=[stu1,stu2,stu3,stu4]
//进行排序
//mySort(array: &stuArr) {
//    ($0 as! Student).achievement > ($1 as! Student).achievement
//}
//省略返回值
mySort(array: &stuArr, sortClosure: { (i, nextI) in
   return (i as! Student).achievement > (nextI as! Student).achievement
})

func mySort(array:inout Array<Any>,sortClosure:(Int,Int)->Bool) -> Array<Any> {
    //冒泡排序算法
    for indexI in array.indices {
        //最后一个元素直接返回
        if indexI == array.count-1 {
            break
        }
        
        //冒泡排序
        for indexJ in 0...((array.count-1)-indexI-1) {
            //调用传递进来的闭包算法，as!的作用是类型转换
            if sortClosure(array[indexJ] as! Int,array[indexJ+1] as! Int) {
                
            } else {
                //进行元素交换
                array.swapAt(indexJ, indexJ+1)
            }
        }
    }
    return array
}
var array:Array<Any> = [1,4,3,5,7,5,4,2,7]
mySort(array: &array, sortClosure: {(i:Any, nextI:Any) -> Bool in return (i as! Int) < (nextI as! Int)})
print(array)

//闭包的实现方式，标准结构：{(参数列表)->返回值 in 闭包体}
let myClosures = {(param:Int)->Int in
   return param*param
}
//对闭包进行调用，将返回9
myClosures(3)

//声明一个函数变量
var addFunc:(Int,Int)->Int
func myFunc15() -> (Int,Int)->Int {
    return {(param1:Int,param2:Int) in
        return param1+param2
    }
}
func myFunc16() -> (Int,Int)->Int {
    //函数嵌套
    func subFunc(param1:Int,param2:Int)->Int {
        return param1+param2
    }
    return subFunc
}
//使用addFunc变量获取返回值
addFunc = myFunc16()
//进行调用
addFunc(1,2)

func myFunc13(param1:Int,param2:Int) -> Int {
   return param2+param1
}
addFunc = myFunc13
addFunc(1,2)

//参数param的类型为函数类型(Int,Int)->Int
func myFunc14(param:(Int,Int)->Int) {
   print(param(1,2))
}
//将addFunc函数作为参数传递进myFunc14函数
myFunc14(param: addFunc)

//对函数变量进行赋值
addFunc = {(param1:Int,param2:Int) in return param1+param2} //闭包
//调用函数变量
addFunc(2,3)

//在函数内部修改参数变量的值
func myFunc12(param:inout Int) {
    param+=1
}
var para = 10;
myFunc12(param: &para) //传参时需要使用“&”符号，这个符号将传递参数变量的内存地址
//将打印11
print(para)

func myFunc11(param1:Int...,param2:String) {
    var sum=0
    for count in param1 {
        sum+=count
    }
    print("\(param2):\(sum)")
}
myFunc11(param1: 1,2,3, param2: "hello")

//为函数的参数添加外部命名
func myFunc6(out1 param1: Int,out2 param2: Int,out3 param3: Int) {
    //这里使用的param1、param2、param3是参数的内部命名
    param1+param2+param3
}
//调用函数时，参数将被外部命名标识，这里的 out1、out2、out3为函数参数的外部命名
myFunc6(out1:1,out2:2,out3:3)

func searchData(dataID:String)->(success:Bool,data:String) {
    let result = true
    let data = "数据实体"
    return (result,data)
}

if searchData(dataID:"1101").success {
    print(searchData(dataID:"1101").data)
}

//返回Optional类型值的函数
func myFunc4(param:Int)->Int?{
    guard param>100 else {
        return nil
    }
    
    return param-100
}

if let tmp = myFunc4(param: 100) {
    print(tmp)
}
