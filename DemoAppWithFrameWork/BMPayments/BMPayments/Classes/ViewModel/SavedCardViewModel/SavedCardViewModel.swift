//
//  SavedCardViewModel.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit
import CoreData

class SavedCardViewModel {

    let navTitle = "Save Card".localized()
    var cardDetails : [CardDetails] = [CardDetails]()
    
    func getSaveUsersDetails() {
        cardDetails.removeAll()
        
        let managedObjectContext = CoreDataManager.shared.managedObjectContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CardDetails")
        do {
            let result = try managedObjectContext.fetch(request)
            
            let mappedCardDetails = result.map { (item) -> CardDetails? in
                return (item as? CardDetails)
            }.filter { (item) -> Bool in
                if let _ = item {
                    return true
                }
                return false
                
            } as! [CardDetails]
            
            if mappedCardDetails.count > 0 {
                cardDetails.append(contentsOf: mappedCardDetails)
            }
        } catch {
            print("Failed")
        }
    }
    
    func delete(cardDetai: CardDetails) {
        do {
            let managedObjectContext = CoreDataManager.shared.managedObjectContext
            managedObjectContext.delete(cardDetai)
            try managedObjectContext.save()
        } catch {
            print("Failed")
        }
    }
}
