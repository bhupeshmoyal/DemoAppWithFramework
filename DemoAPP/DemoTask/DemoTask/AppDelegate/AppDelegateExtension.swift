//
//  AppDelegate.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    func setupNavigationBarAppearance() {
        UINavigationBar.appearance().tintColor = UIColor.Common.tint
    }
    func prepareRootViewController(){
        let navController = UINavigationController()
        coordinator = MainCoordinator(navController: navController)
        coordinator?.start()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
