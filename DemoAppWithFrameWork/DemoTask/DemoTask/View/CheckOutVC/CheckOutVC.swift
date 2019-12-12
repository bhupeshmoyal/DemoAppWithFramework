//
//  CheckOutVC.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit
import BMPayments

class CheckOutVC: BaseViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var lblNoOfItems: UILabel!
    @IBOutlet weak var lblNoOfItemsData: UILabel!
    
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var lblTotalAmountData: UILabel!
    
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblTaxData: UILabel!
    
    @IBOutlet weak var lblAmountToPay: UILabel!
    @IBOutlet weak var lblAmountToPayData: UILabel!
    
    @IBOutlet weak var btnPay: UIButton!
    @IBOutlet weak var tblCheckOut: UITableView!
    private let viewModel = CheckOutViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateTableView()
        btnPay.alpha = 0.5
        btnPay.isUserInteractionEnabled = false
        self.title = viewModel.navTitle
        setUpFontsAndText()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isToolbarHidden = true
    }
}

extension CheckOutVC{
    
    private func setDelegateTableView()  {
        self.tblCheckOut.delegate = self
        self.tblCheckOut.dataSource = self
        self.tblCheckOut.tableFooterView = UIView()
        reloadTableView()
    }
    
    private func reloadTableView() {
        self.tblCheckOut.reloadData()
    }
    
    private func setUpFontsAndText(){
        
        lblNoOfItems.text = viewModel.noOfItem
        lblTotalAmount.text = viewModel.totalAmount
        lblTax.text = viewModel.tax
        lblAmountToPay.text = viewModel.amountPay
        setButtonTextAndColor()
        
        lblNoOfItemsData.text = "\(viewModel.objPay.NoOfItems)"
        lblTaxData.text = "\(viewModel.objPay.Tax)"
        lblAmountToPayData.text = "\(viewModel.objPay.AmountToPay)"
        lblTotalAmountData.text = "\(viewModel.objPay.TotalAmount)"
        
        lblNoOfItems.font = FontManager.shared.localizedFont(FontManager.shared.fontBold, CGFloat(FontManager.shared.h14))
        lblTotalAmount.font = FontManager.shared.localizedFont(FontManager.shared.fontBold, CGFloat(FontManager.shared.h14))
        lblTax.font = FontManager.shared.localizedFont(FontManager.shared.fontBold, CGFloat(FontManager.shared.h14))
        lblAmountToPay.font = FontManager.shared.localizedFont(FontManager.shared.fontBold, CGFloat(FontManager.shared.h14))
    }
    
    private func setButtonTextAndColor() {
        btnPay.setTitle(viewModel.buttonText, for: .normal)
        btnPay.setTitleColor(UIColor.Common.whiteColor, for: .normal)
        btnPay.backgroundColor = UIColor.Common.payButtonColor
        btnPay.titleLabel?.font = FontManager.shared.localizedFont(FontManager.shared.fontBold, CGFloat(FontManager.shared.h14))
        
    }
    
}
extension CheckOutVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayPaymentOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PaymentOptionCell = tableView.dequeueReusableCell(withIdentifier: PaymentOptionCell.identifier) as! PaymentOptionCell
        cell.delegate = self
        cell.configureCell(indexPath: indexPath, data: viewModel.arrayPaymentOptions[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}
extension CheckOutVC : PaymentOptionDelegate{
    
    func paymentOptionClicked(index: Int) {
        btnPay.alpha = 1
        btnPay.isUserInteractionEnabled = true
    }
    
}

extension CheckOutVC {
    
    @IBAction  func btnPayClicked(sender : UIButton)  {
        
        coordinator?.paymentHandler = { [weak self] (paymentViewModel) in
            self?.coordinator?.navController.popToRootViewController(animated: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                guard let self = self else {
                    return
                }
                Utilities.showAlert(title: "Payment Success", message: "Transaction reference: \(paymentViewModel.referenceNumber)", viewController: self)
            }
        }
        coordinator?.paymentMode(objPay: viewModel.objPay)
    }
}

