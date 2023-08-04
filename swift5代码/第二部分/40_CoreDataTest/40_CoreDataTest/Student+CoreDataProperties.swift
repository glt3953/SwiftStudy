//
//  Student+CoreDataProperties.swift
//  40_CoreDataTest
//
//  Created by 珲少 on 2021/2/9.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16

}

extension Student : Identifiable {

}
