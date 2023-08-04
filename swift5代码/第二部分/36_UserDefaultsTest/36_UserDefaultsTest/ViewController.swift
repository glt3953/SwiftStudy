//
//  ViewController.swift
//  36_UserDefaultsTest
//
//  Created by 珲少 on 2021/2/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //获取应用程序默认的userDefaults实例
        let userDefaults = UserDefaults.standard
        //进行url数据的存储
        userDefaults.set(URL(string: "http://www.baidu.com"), forKey: "urlKey")
        //进行字符串数据的存储
        userDefaults.set("stringValue", forKey: "stringKey")
        //进行Bool值数据的存储
        userDefaults.set(true, forKey: "boolKey")
        //进行Double类型数据的存储
        userDefaults.set(Double(0.1), forKey: "doubleKey")
        //进行Float类型数据的存储
        userDefaults.set(Float(1.5), forKey: "floatKey")
        //进行Int类型数据的存储
        userDefaults.set(5, forKey: "intKey")
        //进行字典数据的存储
        userDefaults.set(["1":"一"], forKey: "dicKey")
        //进行数组数据的存储
        userDefaults.set([1,2,3,4], forKey: "arrKey")
        //进行Data数据的存储
        userDefaults.set(Data(), forKey: "dataKey")
        //将操作进行同步
        userDefaults.synchronize()
        
        //获取url数据
        print(userDefaults.url(forKey: "urlKey"))
        //获取字符串数据
        print(userDefaults.string(forKey: "stringKey"))
        //获取布尔数据
        print(userDefaults.bool(forKey: "boolKey"))
        //获取Double数据
        print(userDefaults.double(forKey: "doubleKey"))
        //获取Float数据
        print(userDefaults.float(forKey: "floatKey"))
        //获取Int数据
        print(userDefaults.integer(forKey: "intKey"))
        //获取字典数据
        print(userDefaults.dictionary(forKey: "dicKey"))
        //获取数组数据
        print(userDefaults.array(forKey: "arrKey"))
        //获取Data数据
        print(userDefaults.data(forKey: "dataKey"))
    }


}

