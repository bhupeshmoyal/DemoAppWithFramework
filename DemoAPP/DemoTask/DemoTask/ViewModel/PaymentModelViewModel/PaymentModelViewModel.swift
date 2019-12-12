//
//  PaymentModelViewModel.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit

class PaymentModelViewModel {
    let navTitle = "Payment Mode".localized()
    let amountToPay = "Amount to Pay".localized()
    lazy var arrayPayment : [[String:Any]] = {
        [["name":"Saved Card","id":1],["name":"Debit Card","id":2],["name":"Credit Card","id":3]]
    }()
}
