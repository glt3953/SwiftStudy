//
//  SchoolClass+CoreDataProperties.swift
//  SwiftStudy
//
//  Created by guoliting on 2020/10/22.
//  Copyright © 2020 guoliting. All rights reserved.
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
