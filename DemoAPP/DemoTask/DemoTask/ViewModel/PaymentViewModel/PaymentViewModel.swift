//
//  PaymentViewModel.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import Foundation

struct PaymentViewModel {
    
    var referenceNumber: String
    var status: Bool
    
    init(referenceNumber: String, status: Bool) {
        self.referenceNumber = referenceNumber
        self.status = status
    }
}
