//
//  PaymentOptionCell.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit

protocol PaymentOptionDelegate : class{
    func paymentOptionClicked(index:Int)
}

class PaymentOptionCell: UITableViewCell {

    @IBOutlet weak var btnPayment: UIButton!
    @IBOutlet weak var lblPaymentText: UILabel!
    weak var delegate : PaymentOptionDelegate?
    static let identifier = PaymentOptionCell.name

    override func awakeFromNib() {
        super.awakeFromNib()
        lblPaymentText.font = FontManager.shared.localizedFont(FontManager.shared.fontMedium, CGFloat(FontManager.shared.h14))
        // Initialization code
    }
    @IBAction func btnPaymentClicked(sender:UIButton){
        sender.isSelected = !sender.isSelected
        delegate?.paymentOptionClicked(index: sender.tag)
    }
    func configureCell(indexPath:IndexPath,data:[String:Any]){
        btnPayment.tag = indexPath.row
        
        if let paymentName = data["name"] as? String{
            lblPaymentText.text = paymentName.localized()
        }
    }

}
