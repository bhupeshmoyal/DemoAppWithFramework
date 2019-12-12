//
//  CoreDataManager.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataManager {
    
    public static let shared = CoreDataManager()
    
    public init() {
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let sdkBundle = Bundle(for: CoreDataManager.self)
        let modelURL = sdkBundle.url(forResource: "DemoTask", withExtension: "mom")!
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)
        
        let container = NSPersistentContainer(name: "DemoTask", managedObjectModel: managedObjectModel!)
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                Log.error("Unresolved error \(error), \(error.userInfo)")
            } else {
                Log.debug("Store Description \(storeDescription)")
            }
        }
        
        return container
    }()
    
    public var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data Saving support
    public func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
