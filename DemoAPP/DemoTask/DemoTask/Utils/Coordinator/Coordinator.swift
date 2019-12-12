//
//  Coordinator.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoorninator : [Coordinator] {get set}
    var navController : UINavigationController {get set}
    
    func start()  
}
