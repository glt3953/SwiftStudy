//
//  Student+CoreDataProperties.swift
//  SwiftStudy
//
//  Created by guoliting on 2020/10/22.
//  Copyright © 2020 guoliting. All rights reserved.
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
