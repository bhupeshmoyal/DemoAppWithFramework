//
//  PaymentModeVC.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit

public class PaymentModeVC: BaseViewController, Storyboarded {
    
    @IBOutlet weak var lblAmountToPay: UILabel!
    @IBOutlet weak var tblPayment: UITableView!
    @IBOutlet weak var lblAmount: UILabel!
    private let viewModel = PaymentModelViewModel()
    weak var coordinator: MainCoordinator?
    
    var objPay : PaymentDetails?

    override public func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle()
        setDelegateTableView()
        // Do any additional setup after loading the view.
    }
}

extension PaymentModeVC {
    
    private func setNavigationTitle() {
        self.title = viewModel.navTitle
        self.setAppIconOnNavBar()
        self.addBottomBar()
        self.setUpFontsAndText()
    }
    
    private func setDelegateTableView()  {
        self.tblPayment.delegate = self
        self.tblPayment.dataSource = self
        self.tblPayment.tableFooterView = UIView()
        reloadTableView()
    }
    
    private func reloadTableView() {
        self.tblPayment.reloadData()
    }
    
    private func setUpFontsAndText(){
        
        lblAmountToPay.text = viewModel.amountToPay
        if let objPayment = objPay{
            lblAmount.text = "\(objPayment.AmountToPay)"
        }
        lblAmountToPay.font = FontManager.shared.localizedFont(FontManager.shared.fontBold, CGFloat(FontManager.shared.h14))
    }
}

extension PaymentModeVC : UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayPayment.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PaymentModeCell = tableView.dequeueReusableCell(withIdentifier: PaymentModeCell.identifier) as! PaymentModeCell
        cell.accessoryType = .disclosureIndicator
        
        cell.configureCell(indexPath: indexPath, data: viewModel.arrayPayment[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let savedCardId = viewModel.arrayPayment[indexPath.row]["id"] as? Int{
            
            if let cardType = CardType(rawValue: savedCardId){
                switch (cardType){
                case .savedCard :
                    coordinator?.savedCard(title: viewModel.arrayPayment[indexPath.row]["name"] as? String)
                    
                case .creditCard, .debitCard:
                    if let objPay = objPay{
                        coordinator?.cardPage(title: viewModel.arrayPayment[indexPath.row]["name"] as? String,objPay: objPay)
                    }
                }
            }
        }
    }
}
