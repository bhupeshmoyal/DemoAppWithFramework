//
//  PaymentViewModel.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import Foundation

public struct PaymentViewModel {
    
    public var referenceNumber: String
    public var status: Bool
    
    public init(referenceNumber: String, status: Bool) {
        self.referenceNumber = referenceNumber
        self.status = status
    }
}
