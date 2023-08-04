//
//  ViewController.swift
//  37_PlistTest
//
//  Created by 珲少 on 2021/2/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        //获取文件路径
//        let path = Bundle.main.path(forResource: "NewPlist", ofType: "plist")
//        //将文件内容读成字典
//        let dic = NSDictionary(contentsOfFile: path!)
//        //数据输出
//        print(dic ?? "dic为nil")//为空时 打印信息需要添加默认值
        
        let path = NSSearchPathForDirectoriesInDomains (.documentDirectory, .userDomainMask, true).first
        //拼接上文件名
        let fileName = path! + "/NewPlist.plist"
        let dic:NSDictionary = ["name":"jaki","age":"25"]
        //进行写文件
        dic.write(toFile: fileName, atomically: true)
        //将存储的Plist文件数据进行读取
        let dicRes = NSDictionary(contentsOfFile: fileName)
        print(dicRes ?? "dicRes为nil")
    }


}

