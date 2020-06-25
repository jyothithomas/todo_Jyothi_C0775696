//
//  Support.swift
//  todo_Jyothi_C0775696
//
//  Created by user176475 on 6/25/20.
//  Copyright © 2020 user176475. All rights reserved.
//

import Foundation
import CoreData
import UIKit

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

func saveContext(){
    if context.hasChanges
    {
        do{
            try context.save()
        }
        catch
        {
            print(error)
        }
    }
    
}
