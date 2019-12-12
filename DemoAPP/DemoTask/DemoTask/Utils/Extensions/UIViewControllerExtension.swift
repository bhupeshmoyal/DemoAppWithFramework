//
//  UIViewControllerExtension.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit

extension UIViewController{
    
    class func getBlankViewController() ->  UIViewController{
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = vc
        window.backgroundColor = .clear
        window.windowLevel = .alert + 1
        window.makeKeyAndVisible()
        return vc
    }
}
class Utilities {
    
    static func showAlert(title: String, message: String, viewController: UIViewController? = nil, handler: ((UIAlertAction) -> Void)? = nil){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
            if let vc = viewController {
                vc.present(alert, animated: true, completion: nil)
            } else {
                UIViewController.getBlankViewController().present(alert, animated: true, completion: nil)
            }
        }
    }
}
