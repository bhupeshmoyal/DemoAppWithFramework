//
//  SavedCardVC.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import UIKit

class SavedCardVC:  BaseViewController,Storyboarded {
    
    @IBOutlet  weak var tblSaveDetails : UITableView!
    weak var coordinator: MainCoordinator? 
    private let viewModel = SavedCardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle()
        viewModel.getSaveUsersDetails()

        if viewModel.cardDetails.count <= 0{
            Utilities.showAlert(title: "Error!".localized(), message: "No Saved Card Found".localized(), viewController: self) { [weak self] (alertAction) in
                self?.navigationController?.popViewController(animated: true)
            }
        }
        // Do any additional setup after loading the view.
    }
}

extension SavedCardVC {
    
    private func setNavigationTitle() {
        self.title = viewModel.navTitle
        self.setAppIconOnNavBar()
        self.addBottomBar()
        self.setDelegateTableView()
    }
    
    private func setDelegateTableView()  {
        self.tblSaveDetails.delegate = self
        self.tblSaveDetails.dataSource = self
        self.tblSaveDetails.tableFooterView = UIView()
        reloadTableView()
    }
    
    private func reloadTableView() {
        self.tblSaveDetails.reloadData()
    }
}

extension SavedCardVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cardDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SaveCardCell = tableView.dequeueReusableCell(withIdentifier: SaveCardCell.identifier) as! SaveCardCell
        cell.delegate = self
        cell.configureCell(indexPath: indexPath, data: viewModel.cardDetails[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 142
    }
}

extension SavedCardVC : SaveCardDelegate {
    
    func paymentClicked(index: Int) {
        coordinator?.paymentSuccessVC()
    }
    
    func deleteClicked(index: Int) {
        viewModel.delete(cardDetai: viewModel.cardDetails[index])
        viewModel.getSaveUsersDetails()
        reloadTableView()
    }
}
