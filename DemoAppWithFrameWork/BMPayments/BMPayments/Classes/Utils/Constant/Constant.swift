//
//  Constant.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit

public enum CardType : Int {
    case savedCard = 1
    case debitCard = 2
    case creditCard = 3
}

public struct PaymentDetails {
    
    public var NoOfItems = 6
    public var TotalAmount = 600.00
    public var Tax = 50.00
    public var AmountToPay = 650.00
    
    public init() {
    }
}
