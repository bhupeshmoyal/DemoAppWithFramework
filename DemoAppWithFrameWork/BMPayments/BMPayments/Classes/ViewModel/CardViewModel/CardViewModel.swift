//
//  CardViewModel.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit
import CoreData

class CardViewModel {
    let cardErrorMessage  = "Please enter valid card details".localized()
    let saveCard = "Save Card".localized()
    let btnContinueText = "Continue".localized()
    
    func saveCard(cardNumber: String, cardHolderName: String, cardExpiry: String) {
        let managedObjectContext = CoreDataManager.shared.managedObjectContext
        let entity = NSEntityDescription.entity(forEntityName: "CardDetails", in: managedObjectContext)
        let newCard = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
        
        if let cardNum = Int(cardNumber.replacingOccurrences(of: " ", with: "")) {
            newCard.setValue(NSNumber(value:cardNum), forKey: "cardNumber")
            newCard.setValue(cardHolderName, forKey: "cardName")
            newCard.setValue(cardExpiry, forKey: "expDate")
            do {
                try managedObjectContext.save()
            } catch {
                print("Failed saving")
            }
        }
    }
}
