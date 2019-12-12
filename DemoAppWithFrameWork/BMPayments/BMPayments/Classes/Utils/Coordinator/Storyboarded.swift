//
//  Storyboarded.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit

public protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self : UIViewController{
    public static func instantiate() -> Self {
        let vcName = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: self))
        return storyboard.instantiateViewController(withIdentifier: vcName) as! Self
    }
}
