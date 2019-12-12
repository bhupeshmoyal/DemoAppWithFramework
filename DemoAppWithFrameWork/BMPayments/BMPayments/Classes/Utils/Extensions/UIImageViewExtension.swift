//
//  UIImageViewExtension.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func makeCircle() {
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
}
