//
//  SaveCardCell.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit
protocol SaveCardDelegate : class{
    func paymentClicked(index:Int)
    func deleteClicked(index:Int)
}
class SaveCardCell: UITableViewCell {

    static let identifier = SaveCardCell.name
    @IBOutlet weak var lblCardDetails: UILabel!
    @IBOutlet weak var buttonPay: UIButton!
    @IBOutlet weak var buttonDelete: UIButton!

    weak var delegate : SaveCardDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        lblCardDetails.font = FontManager.shared.localizedFont(FontManager.shared.fontMedium, CGFloat(FontManager.shared.h18))        
        buttonPay.setTitle("Pay".localized(), for: .normal)
        buttonPay.setTitleColor(UIColor.Common.whiteColor, for: .normal)
        buttonPay.backgroundColor = UIColor.Common.payButtonColor
        buttonPay.titleLabel?.font = FontManager.shared.localizedFont(FontManager.shared.fontMedium, CGFloat(FontManager.shared.h14))
    }
    
    func configureCell(indexPath:IndexPath, data: CardDetails){
        buttonDelete.tag = indexPath.row
        buttonPay.tag = indexPath.row
        let paymentName = String(format: "%ld", data.cardNumber)
        var resultString = String()
        
        paymentName.enumerated().forEach { (index, character) in
            if index % 4 == 0 && index > 0 {
                resultString += " "
            }
            if index < 12 && index > 0 {
                resultString += "*"
            } else {
                resultString.append(character)
            }
        }
        lblCardDetails.text = resultString
    }
}

extension SaveCardCell{
    
    @IBAction func btnPayClicked(sender: UIButton){
        delegate?.paymentClicked(index: sender.tag)
    }
    @IBAction func btnDeleteClicked(sender: UIButton){
        delegate?.deleteClicked(index: sender.tag)
    }
}
