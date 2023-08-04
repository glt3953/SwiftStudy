//
//  ViewController.swift
//  39_SQLiteLibTest
//
//  Created by 珲少 on 2021/2/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //调用Objective-C文件中的类执行sql语句
        Objective_C_Hander.runNormalSql("create table Student(name text PRIMARY KEY,age integer DEFAULT 15)")
        Objective_C_Hander.runNormalSql("insert into Student(name,age) values(\"珲少\",25)")
    }


}

