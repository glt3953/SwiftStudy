import UIKit

//使用枚举来模拟加减乘除四则运算
indirect enum Expression {
    //描述单个数字
    case num(param:Int)
    //表示加法运算，将 Expression 作为相关值参数类型
    case add(param1:Expression,param2:Expression)
    //表示减法运算
    case sub(param1:Expression,param2:Expression)
    //表示乘法运算
    case mul(param1:Expression,param2:Expression)
    //表示除法运算
    case div(param1:Expression,param2:Expression)
}

//创建单值5
var num5 = Expression.num(param:5)
//进行表达式5+5的描述
var exp1 = Expression.add(param1: num5,param2:num5)
//创建单值2
var num2 = Expression.num(param:2)
//进行表达式(5+5)*2的描述
var exp2 = Expression.mul(param1:exp1,param2:num2)
//创建单值8
var num8 = Expression.num(param:8)
//进行表达式(5+5)*2-8的描述
var exp3 = Expression.sub(param1:exp2,param2:num8)
//进行表达式((5+5)*2-8)/2的描述
var expFinal = Expression.div(param1: exp3,param2: num2)

//这个递归函数的作用是将Expression描述的表达式进行运算，并将结果返回
func expressionFunc(param:Expression) -> Int {
    switch param {
    //单值直接返回
    case let.num(param):
        return param
    case let .add(param1, param2):
        //返回加法运算结果
        return expressionFunc(param:param1)+expressionFunc(param:param2)
    case let .sub(param1, param2):
        //返回减法运算结果
        return expressionFunc(param:param1)-expressionFunc(param:param2)
    case let .mul(param1, param2):
        //返回乘法运算结果
        return expressionFunc(param:param1)*expressionFunc(param:param2)
    case let .div(param1, param2):
        //返回除法运算结果
        return expressionFunc(param:param1)/expressionFunc(param: param2)
    }
}
//进行((5+5)*2-8)/2运算，结果为6
expressionFunc(param: expFinal)

//定义形状枚举
enum Shape {
    //圆形，设置圆心和半径为相关值
    case circle(center:(Double,Double),radius:Double)
    //矩形，设置中心、宽、高为相关值
    case rect(center:(Double,Double),width:Double,height:Double)
    //三角形，设置3个顶点为相关值
    case triangle(point1:(Double,Double),point2:(Double,Double),point3:(Double,Double))
}
//创建圆形枚举实例，此圆的圆心为(0,0)，半径为3
var circle = Shape.circle(center: (0, 0), radius: 3)
//创建矩形枚举实例，此矩形的中心点为(1,1)，宽度为10，高度为15
var rect = Shape.rect(center: (1, 1), width: 10, height: 15)
//创建三角形枚举实例，此三角形的3个顶点为(2,2)、(3,3)、(2,5)
var triangle = Shape.triangle(point1: (2, 2), point2: (3, 3), point3: (2, 5))
//写一个匹配函数，参数为 Shape枚举类型
func shapeFunc(param:Shape){
    switch param {
    //进行参数捕获
    case let .circle(center,radius):
        print("此圆的圆心为：\(center)，半径为：\(radius)")
    case let .rect(center,width,height):
        print("此矩形的中心为：\(center)，宽为：\(width)，高为：\(height)")
    case let .triangle(point1,point2,point3):
        print("此三角形的3个顶点分别为：\(point1)，\(point2)，\(point3)")
    }
}
shapeFunc(param: circle)
shapeFunc(param: rect)
shapeFunc(param: triangle)

//为枚举类型指定一个原始值类型
enum CharEnum:Character {
    //通过赋值的方式来为枚举值设置一个原始值
    case a = "a"
    case b = "b"
    case c = "c"
    case d = "d"
}

//创建枚举变量
var char = CharEnum.a
//获取char枚举变量的原始值 "a"
var rawValue = char.rawValue
//通过枚举值的原始值来完成枚举实例的构造
var charEnum = CharEnum(rawValue: "b")

//创建一个姓氏枚举类型
enum Surname {
    case 张
    case 王
    case 李
    case 赵
}

var sur:Surname
sur = Surname.张
sur = .王
switch sur {
    case .张:
        print("姓氏张")
    case .王:
        print("姓氏王")
    case .李:
        print("姓氏李")
    case .赵:
        print("姓氏赵")
}

//创建整型的加法函数
func addFunc(param1:Int,param2:Int) -> Int {
    return param1+param2
}
//重载addFunc实现浮点型数据的加法
func addFunc(param1:Double,param2:Double)-> Double {
    return param1+param2
}
//再次重载addFunc实现字符串类型的加法
func addfunc(param1:String,param2:String)->String{
    return param1+param2
}

var b:UInt8 = 255
//进行支持溢出的加操作，b的值将变为0
b = b &+ 1
//进行支持溢出的减操作，b的值将变为255
b = b &- 1
//进行支持溢出的乘操作，b的值将变为254
b = b &* 2
//代码运行到这里会出现错误，运行直接中断
b = b+1

//十进制数8
var a:UInt8 = 0b1000
//运算后 a 的值变为十进制数247
a = ~a
//使用二进制数11110000与a进行按位与运算，运算结果为11110000，即十进制数240
a = 0b11110000&a
//使用二进制数11111111与a进行按位或运算，结果为11111111，即十进制数255
a = 0b11111111|a
//使用二进制数11110000与a进行按位异或运算，结果为00001111，即十进制数15
a = 0b11110000^a
//将a按位左移1位，结果为00011110，即十进制数30
a = a<<1
//将a按位右移1位，结果为00001111，即十进制数15
a = a>>1
