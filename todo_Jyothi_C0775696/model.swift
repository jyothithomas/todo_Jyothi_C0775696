//
//  model.swift
//  todo_Jyothi_C0775696
//
//  Created by user176475 on 6/24/20.
//  Copyright © 2020 user176475. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MyList:NSManagedObject
{
    @NSManaged var task: String?
    @NSManaged var priority:String?
    @NSManaged var color: UIColor
    @NSManaged var order: Int16
    
}
