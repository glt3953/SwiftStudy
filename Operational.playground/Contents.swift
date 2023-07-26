import UIKit

for item in 100...999 {
    //获取个位数字
    let dig = item%10
    //获取十位数字
    let tens=item/10%10
    //获取百位数字
    let hundred=item/100
    //获取结果，这里可以考虑用pow(DoubleDouble)函数代替diq*diq*dia
    let sum = dig*dig*dig + tens*tens*tens + hundred*hundred*hundred

    //所谓“水仙花数”，是指一个三位数，其各位数字的立方和等于该数本身。
    if sum == item {
        print(item)
    }
}

for indexH in 1...4 {
    //每行有10列符号
    print("")
    for indexV in 1...10 {
        //第一行和最后一行为*
        if indexH==1 || indexH==4 {
        print ("*", separator:"",terminator: "") //print()函数会自动在打印末尾添加换行符，使用带三个参数的print()函数，并且将后两个参数设置为空字符串可以屏蔽print函数的自动换行功能。
        } else {
            //第一列和最后一列为*
            if indexV==1 || indexV==10 {
            print("*", separator: "",terminator: "")
            } else {
                //其余为?
                print("?",separator:"",terminator:"")
            }
        }
    }
}

var mark = 40
var people = mark>30 ? "主选手" : "辅助选手"

// arc4random()为Swift标准函数库中的随机数生成函数
var rand = arc4random()%7+1

func myFuncTwo(param:Int) {
    guard param>0 else {
        return
    }
    print("其他操作")
}

MyLabel:for indexI in 0...2 {
    for indexJ in 0...2 {
        print("indexJ的值为\(indexJ)")
        if indexI == 1 {
            break MyLabel
//            continue MyLabel //此时效果等同于break
//            continue
        }
        print("第\(indexI)\(indexJ)次循环")
    }
}

var tuple=(0,0)
//进行数据绑定
switch tuple{
//对元组中的第一个元素进行捕获
case (let a,1):
    print(a)
case (let b,0):
    print(b)
//捕获元组中的两个元素，let(a,b)与(let a,let b)意义相同
case let(a,b):
    print(a,b)
default:
    print("")
}

//使用Switch语句进行元组的匹配
var tuple=(0,0)
switch tuple {
//进行完全匹配
case (0,1):
    print("Sure")
//进行选择性匹配
case (_,1):
    print("Sim")
//进行元组元素的范围匹配
case (0...3,0...3):
    print("SIM")
default:
    print("")
}

var charac = "b"
//同一个case中可以包含多个分支
switch charac {
case "a","b","c":
    print("charac is word")
case "1","2","3":
    print("charac is num")
default:
    print("no charac")
}

var j = 0
//先执行一次循环体，再判断循环条件是否成立
repeat {
    print("repeat while")
    j+=1
} while j<10

var collection1:Dictionary = [1:1,2:2,3:3,4:4]
var collection2:Set = [1,2,3,4]
for (key,value) in collection1 {
    print(key,value)
}
for obj in collection2 {
    print(obj)
}

var sum=0
for _ in 1...3 {
    sum+=1
}
print(sum)

//a...b为闭区间写法
for index in 0...3 {
   print(index)
}
//a..<b为左闭右开区间
for index in 0..<3 {
   print(index)
}

//创建范围 >=0 且<=10 的闭区间
var range1 = 0...10
//创建范围>=0 且<10 的半开区间
var range2 = 0..<10
//8是否在range1中
print(range1 ~= 8)  //输出 true
print(range2 ~= 10)  //输出 false

//空合并运算符
var q:Int? = 8
var value:Int
value = q ?? 0 //等同于value = (q != nil) ? (q!) : 0

var m = 3
var n = 6
print(m>n ? "m>n":"m<=n")

var tp1 = (3,4,"5")
var tp2 = (2,6,"9")
var tp3 = ("1",4,5)
tp1<tp2             //将返回false

var a = 1
var b = -2
+b //-2
-a //-1

var tmp=1
//加赋值复合运算
tmp+=3  //tmp = tmp +3
//减赋值复合运算
tmp-=3  //tmp = tmp -3
//乘赋值复合运算
tmp*=3  //tmp = tmp *3
//除赋值复合运算
tmp/=3  //tmp = tmp /3
//取余赋值复合运算
tmp%=3  //tmp = tmp %3

//字符串赋值
var str = "Hello, playground"
//整型赋值
var count = 5
//元组赋值
var group = (1,2,"12")
//Bool赋值
var bol = true
// 进行解构赋值
var (n1, n2, n3) = (1, 2, 3)
print(n1, n2 ,n3) // 1, 2, 3
