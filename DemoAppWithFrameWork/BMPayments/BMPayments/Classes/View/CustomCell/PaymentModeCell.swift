//
//  PaymentModeCell.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit

class PaymentModeCell: UITableViewCell {

    static let identifier = PaymentModeCell.name
    @IBOutlet weak var lblPaymentOption: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblPaymentOption.font = FontManager.shared.localizedFont(FontManager.shared.fontMedium, CGFloat(FontManager.shared.h14))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(indexPath:IndexPath,data:[String:Any]){
        
        if let paymentName = data["name"] as? String{
            lblPaymentOption.text = paymentName.localized()
        }
    }

}
