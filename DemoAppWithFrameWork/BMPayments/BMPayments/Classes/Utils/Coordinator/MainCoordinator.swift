//
//  MainCoordinator.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit

public class MainCoordinator: Coordinator {
    
    public var childCoorninator = [Coordinator]()
    public var navController: UINavigationController
    
    public var paymentHandler: ((PaymentViewModel) -> (Void))?
    
    public init(navController: UINavigationController) {
        self.navController = navController
    }
    
    public func start() {
        
    }
    
    public func paymentMode(objPay: PaymentDetails) {
        let objPaymentModeVC = PaymentModeVC.instantiate()
        objPaymentModeVC.coordinator = self
        objPaymentModeVC.objPay = objPay
        navController.pushViewController(objPaymentModeVC, animated: true)
    }

    public func cardPage(title : String?,objPay:PaymentDetails)  {
        let objCardPageVC = CardPageVC.instantiate()
        objCardPageVC.coordinator = self
        if let title = title{
            objCardPageVC.navTitle =  title
        }
        objCardPageVC.objPay = objPay

        navController.pushViewController(objCardPageVC, animated: true)
    }
    
    public func savedCard(title : String?)  {
        let objCardPageVC = SavedCardVC.instantiate()
        objCardPageVC.coordinator = self
        
        navController.pushViewController(objCardPageVC, animated: true)
    }
    
    public func paymentSuccessVC()  {
        let objPaymentSuccessVC = PaymentSuccessVC.instantiate()
        objPaymentSuccessVC.coordinator = self

        navController.pushViewController(objPaymentSuccessVC, animated: true)
    }
}
