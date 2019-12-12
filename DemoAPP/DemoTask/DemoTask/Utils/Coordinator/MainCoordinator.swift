//
//  MainCoordinator.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoorninator = [Coordinator]()
    var navController: UINavigationController
    
    var paymentHandler: ((PaymentViewModel) -> (Void))?
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    func start() {
        let objCheckOutVC = CheckOutVC.instantiate()
        objCheckOutVC.coordinator = self
        navController.pushViewController(objCheckOutVC, animated: false)
    }
    
    func paymentMode(objPay:PaymentDetails) {
        let objPaymentModeVC = PaymentModeVC.instantiate()
        objPaymentModeVC.coordinator = self
        objPaymentModeVC.objPay = objPay
        navController.pushViewController(objPaymentModeVC, animated: true)
    }

    func cardPage(title : String?,objPay:PaymentDetails)  {
        let objCardPageVC = CardPageVC.instantiate()
        objCardPageVC.coordinator = self
        if let title = title{
            objCardPageVC.navTitle =  title
        }
        objCardPageVC.objPay = objPay

        navController.pushViewController(objCardPageVC, animated: true)
    }
    
    func savedCard(title : String?)  {
        let objCardPageVC = SavedCardVC.instantiate()
        objCardPageVC.coordinator = self
        
        navController.pushViewController(objCardPageVC, animated: true)
    }
    
    func  paymentSuccessVC()  {
        let objPaymentSuccessVC = PaymentSuccessVC.instantiate()
        objPaymentSuccessVC.coordinator = self

        navController.pushViewController(objPaymentSuccessVC, animated: true)
    }
}
