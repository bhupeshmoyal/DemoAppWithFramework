//
//  UIImageExtension.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    struct Action {
        static let call = #imageLiteral(resourceName: "CallButton")
        static let mail = #imageLiteral(resourceName: "EmailButton")
        static let message = #imageLiteral(resourceName: "MessageButton")
        static let favorite = #imageLiteral(resourceName: "FavouriteButton")
        static let favoriteSelected = #imageLiteral(resourceName: "FavouriteButtonSelected")
        static let takePhoto = #imageLiteral(resourceName: "CameraButton")
    }
}
