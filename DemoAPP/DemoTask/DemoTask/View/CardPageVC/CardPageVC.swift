//
//  CardPageVC.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit
import CoreData

class CardPageVC: BaseViewController,Storyboarded {
    
    @IBOutlet weak var txtCVVNum: UITextField!
    @IBOutlet weak var txtCardExpYr: UITextField!
    @IBOutlet weak var txtCardName: UITextField!
    @IBOutlet weak var txtCardNumber: UITextField!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblSaveCard: UILabel!
    @IBOutlet weak var btnSaveCard: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    
    private let viewModel = CardViewModel()
    
    var objPay : PaymentDetails?
    
    var navTitle : String?
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let title = navTitle{
            self.title = title
        }
        setTextFieldDelegate()
        setUpFontsAndText()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension CardPageVC {
    
    private func setTextFieldDelegate(){
        txtCardNumber.delegate = self
        txtCardExpYr.delegate = self
        txtCVVNum.delegate = self
        txtCardName.delegate = self
        setNavigationTitle()
    }
    private func setNavigationTitle() {
        self.setAppIconOnNavBar()
        self.addBottomBar()
    }
    private func setUpFontsAndText(){
        
        lblSaveCard.text = viewModel.saveCard
        lblAmount.font = FontManager.shared.localizedFont(FontManager.shared.fontBold, CGFloat(FontManager.shared.h14))
        lblSaveCard.font = FontManager.shared.localizedFont(FontManager.shared.fontBold, CGFloat(FontManager.shared.h12))
        setButtonTextAndColor()
        if let objPayment = objPay{
            lblAmount.text = "\(objPayment.AmountToPay)"
        }
    }
    
    private func setButtonTextAndColor() {
        btnContinue.setTitle(viewModel.btnContinueText, for: .normal)
        btnContinue.setTitleColor(UIColor.Common.whiteColor, for: .normal)
        btnContinue.backgroundColor = UIColor.Common.payButtonColor
        btnContinue.titleLabel?.font = FontManager.shared.localizedFont(FontManager.shared.fontBold, CGFloat(FontManager.shared.h14))
        
    }
}
extension CardPageVC : UITextFieldDelegate{
    
    
    func canInsert(atLocation y:Int) -> Bool {
        return ((1 + y)%(4 + 1) == 0) ? true : false
    }
    
    func canRemove(atLocation y:Int) -> Bool {
        return (y != 0) ? (y%(4 + 1) == 0) : false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == txtCardNumber{
            return checkForValidCardNumber(string: string, textField: textField,range: range)
        }else if textField == txtCardExpYr{
            return checkForExpyr(string: string, textField: textField,range: range)
        }else if textField == txtCVVNum{
            if range.location >= 3 {
                return false
            }
        }else {
            return checkForValidName(string: string, textField: textField, range: range)
        }
        return true
    }
}
extension CardPageVC {
    
    func checkForValidName(string: String,textField : UITextField,range: NSRange) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                return false
            }
        }
        catch {
            print("ERROR")
        }
        return true
    }
    
    
    func checkForExpyr(string: String,textField : UITextField,range: NSRange) -> Bool {
        
        guard let text = textField.text, let textRange = Range(range, in: text) else {
            return false
        }
        var updatedText = text.replacingCharacters(in: textRange, with: string)
        updatedText.removeAll(where: {$0 == "/"})
        let newLength = updatedText.count + updatedText.count/2 - 1
        if newLength > 5 {
            return false
        }
        for i in stride(from: 2, to: newLength, by: 3) {
            let index = updatedText.index(updatedText.startIndex, offsetBy: i)
            updatedText.insert("/", at: index)
        }
        textField.text = updatedText
        return false
        
    }
    func checkForValidCardNumber(string: String,textField : UITextField,range: NSRange) -> Bool {
        
        let nsText = textField.text! as NSString
        
        if range.location == 19 { return false }
        
        if range.length == 0 && canInsert(atLocation: range.location) {
            textField.text! = textField.text! + " " + string
            return false
        }
        
        if range.length == 1 && canRemove(atLocation: range.location) {
            textField.text! = nsText.replacingCharacters(in: NSMakeRange(range.location-1, 2), with: "")
            return false
        }
        return true
    }
}

extension CardPageVC {
    
    @IBAction func btnContinueClicked(_ sender: UIButton) {
        if checkForValidation() {
            if btnSaveCard.isSelected {
                saveCardIntoDB()
            }
            coordinator?.paymentSuccessVC()
        } else {
            Utilities.showAlert(title: "Error!! ", message: viewModel.cardErrorMessage)
        }
    }
    
    @IBAction func btnSaveCardClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    private func saveCardIntoDB() {
        guard let cardNumber = txtCardNumber.text else {
            return
        }
        
        guard let cardHolderName = txtCardName.text else {
            return
        }
        
        guard let cardExpiry = txtCardExpYr.text else {
            return
        }
        
        viewModel.saveCard(cardNumber: cardNumber, cardHolderName: cardHolderName, cardExpiry: cardExpiry)
    }
    
    private func checkForValidation()->Bool{
        
        if txtCardName.text!.isEmpty{
            return false
        }else if txtCardNumber.text!.isEmpty{
            return false
        }else if txtCardNumber.text!.count < 16{
            return false
        }else if txtCardExpYr.text!.count < 5 {
            return false
        }else if txtCardExpYr.text!.isEmpty{
            return false
        }else if txtCVVNum.text!.isEmpty{
            return false
        }else if txtCVVNum.text!.count < 3{
            return false
        }
        return true
    }
}
