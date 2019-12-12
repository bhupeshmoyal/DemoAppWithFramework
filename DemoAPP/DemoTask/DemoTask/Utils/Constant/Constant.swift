//
//  Constant.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import Foundation
import UIKit


enum CardType : Int {
    case savedCard = 1
    case debitCard = 2
    case creditCard = 3
}

struct PaymentDetails {
    var NoOfItems = 6
    var TotalAmount = 600.00
    var Tax = 50.00
    var AmountToPay = 650.00
}
