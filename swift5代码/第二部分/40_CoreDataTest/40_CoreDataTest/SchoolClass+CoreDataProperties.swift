//
//  SchoolClass+CoreDataProperties.swift
//  40_CoreDataTest
//
//  Created by 珲少 on 2021/2/9.
//
//

import Foundation
import CoreData


extension SchoolClass {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SchoolClass> {
        return NSFetchRequest<SchoolClass>(entityName: "SchoolClass")
    }

    @NSManaged public var studentCount: Int16
    @NSManaged public var name: String?
    @NSManaged public var monitor: Student?

}

extension SchoolClass : Identifiable {

}
