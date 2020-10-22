//
//  People.swift
//  SwiftStudy
//
//  Created by guoliting on 2020/10/22.
//  Copyright © 2020 guoliting. All rights reserved.
//

import UIKit

class People: NSObject, NSCoding {
    var name:String?
    var age:NSInteger = 0
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.name = aDecoder.decodeObject(forKey: "name") as! String?;
        self.age = aDecoder.decodeInteger(forKey: "age")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(age, forKey: "age")
        aCoder.encode(name, forKey: "name")
    }
}
