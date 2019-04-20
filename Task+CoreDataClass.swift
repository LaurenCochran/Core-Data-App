//
//  Task+CoreDataClass.swift
//  ToDo
//
//  Created by Lauren on 2019-04-19.
//  Copyright © 2019 Lauren Cochran. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Task)
public class Task: NSManagedObject {
    
    convenience init?(summary: String?, toDo: String?){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: Task.entity(), insertInto: managedContext)
        
        self.toDo = toDo
        self.summary = summary 
        
    }

}
