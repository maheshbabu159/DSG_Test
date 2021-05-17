//
//  Favourite+CoreDataClass.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation
import CoreData

@objc(Favourite)
public class Favourite: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favourite> {
        return NSFetchRequest<Favourite>(entityName: "Favourite")
    }
    @NSManaged public var event_id: Int64
}

extension Favourite : Identifiable {

}
