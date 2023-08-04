//
//  ViewController.swift
//  40_CoreDataTest
//
//  Created by 珲少 on 2021/2/9.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据模型文件地址
        let modelUrl = Bundle.main.url(forResource: "_0_CoreDataTest", withExtension: "momd")
        //创建数据模型管理实例
        let modelManager = NSManagedObjectModel(contentsOf: modelUrl!)
        //创建存储管理实例
        let store = NSPersistentStoreCoordinator(managedObjectModel: modelManager!)
        //设置存储路径
        let path = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains (.documentDirectory, .userDomainMask, true).first! + "/SchoolSQL.sqlite")
        print(path)
        //设置存储方式为SQLite数据库
        try! store.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: path, options: nil)
        //创建数据操作上下文实例
        let context = NSManagedObjectContext(concurrencyType:
.mainQueueConcurrencyType)
        //进行存储环境的关联
        context.persistentStoreCoordinator = store
        //创建班级数据
        let schoolClass:SchoolClass = NSEntityDescription.insertNewObject
(forEntityName: "SchoolClass", into: context) as! SchoolClass
        schoolClass.name = "三年二班"
        schoolClass.studentCount = 60
        //创建学生数据
        let student:Student = NSEntityDescription.insertNewObject
(forEntityName: "Student", into: context) as! Student
        student.name = "Jaki"
        student.age = 24
        schoolClass.monitor = student
        //进行存储
        if ((try? context.save()) != nil) {
            print("新增数据成功")
        }
    }


}

