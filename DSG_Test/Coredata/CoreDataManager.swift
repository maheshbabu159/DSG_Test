

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}

    func saveFavourite(fav_id : Int) {
        let context = CoreDataStack.shared.getMainContext()
        let entity = NSEntityDescription.entity(forEntityName: "Favourite", in: context)
        let favData = NSManagedObject(entity: entity!, insertInto: context)
        favData.setValue(fav_id, forKey: "event_id")
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    func deleteFavourite(fav_id : Int) {
        let context = CoreDataStack.shared.getMainContext()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favourite")
        fetchRequest.predicate = NSPredicate(format: "event_id = %d", fav_id)
        if let result = try? context.fetch(fetchRequest) {
            for object in result {
                context.delete(object)
            }
        }
    }
    func fetchFavourites() -> [Favourite] {
        let context = CoreDataStack.shared.getMainContext()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Favourite.self)) as NSFetchRequest
        fetchReq.returnsObjectsAsFaults = false
        do {
            if let objects = try context.fetch(fetchReq) as? [Favourite] {
                return objects
            }
        } catch { print(error) }
        return []
    }
    func favouriteIdExists(id: Int) -> Bool {
        let context = CoreDataStack.shared.getMainContext()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favourite")
        fetchRequest.predicate = NSPredicate(format: "event_id = %d", id)

        var results: [NSManagedObject] = []
        do {
            results = try context.fetch(fetchRequest)
        }
        catch {
            print("error executing fetch request: \(error)")
        }
        return results.count > 0
    }
   
}
