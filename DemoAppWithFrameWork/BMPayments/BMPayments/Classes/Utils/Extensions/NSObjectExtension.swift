//
//  NSObjectExtension.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import Foundation

extension NSObject {
    
    public class var name: String {
        return String(describing: self)
    }
}

extension String {
    
    public func localized() -> String  {
        return NSLocalizedString(self, comment: "")
    }
}
