//
//  Task+CoreDataProperties.swift
//  ToDo
//
//  Created by Lauren on 2019-04-19.
//  Copyright © 2019 Lauren Cochran. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var summary: String?
    @NSManaged public var toDo: String?

}
