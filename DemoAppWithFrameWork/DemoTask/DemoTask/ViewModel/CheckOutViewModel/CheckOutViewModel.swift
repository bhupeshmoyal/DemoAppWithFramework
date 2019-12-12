//
//  CheckOutViewModel.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit
import BMPayments

class CheckOutViewModel {
    
    let navTitle = "Check Out".localized()
    let noOfItem = "No of Items".localized()
    let totalAmount = "Total Amount".localized()
    let tax = "Tax".localized()
    let amountPay = "Amount to Pay".localized()
    let title = "CheckOutVC"
    let buttonText = "Pay".localized()
    
    let objPay = PaymentDetails()
    lazy var arrayPaymentOptions : [[String:Any]] = {
        [["name":"All Payment","id":1],["name":"Debit Card","id":2],["name":"Credit Card","id":3]]
    }()

}
