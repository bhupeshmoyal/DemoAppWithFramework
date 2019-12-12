//
//  PaymentSuccessVC.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit

class PaymentSuccessVC: BaseViewController,Storyboarded {
    
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var lblStatusCode: UILabel!
    @IBOutlet weak var lblRefNumber: UILabel!
    @IBOutlet weak var lblPaymentStatus: UILabel!
    @IBOutlet weak var imageResult: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationTitle()
        self.setUpFontsAndText()
        self.title = "Payment".localized()
        // Do any additional setup after loading the view.
    }
    
    override func closeVC() {
        coordinator?.paymentHandler?(PaymentViewModel(referenceNumber: "XXXXXXXXX", status: true))
        // self.navigationController?.popToRootViewController(animated: true)
    }
}

extension PaymentSuccessVC {
    
    private func setNavigationTitle() {
        self.setNavIconsPaymentSucsess()
        self.addBottomBar()
    }
    
    private func setUpFontsAndText() {
        
        lblStatusCode.text = "XXXXXXXXX"
        lblRefNumber.text = "Ref Number".localized()
        lblPaymentStatus.text = "Payment Successful".localized()
        lblRefNumber.font = FontManager.shared.localizedFont(FontManager.shared.fontMedium, CGFloat(FontManager.shared.h14))
        lblPaymentStatus.font = FontManager.shared.localizedFont(FontManager.shared.fontMedium, CGFloat(FontManager.shared.h14))
    }
}
