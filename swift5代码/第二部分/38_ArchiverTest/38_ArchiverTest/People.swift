//
//  People.swift
//  38_ArchiverTest
//
//  Created by 珲少 on 2021/2/9.
//

import UIKit

class People: NSObject, NSCoding {
    //添加名称和年龄属性
    var name:String?
    var age:NSInteger = 0
    //构造方法
    override init() {
        super.init()
    }
    //解归档方法
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.name = aDecoder.decodeObject(forKey: "name") as! String?;
        self.age = aDecoder.decodeInteger(forKey: "age")
    }
    //归档方法
    func encode(with aCoder: NSCoder) {
        aCoder.encode(age, forKey: "age")
        aCoder.encode(name, forKey: "name")
    }
}
