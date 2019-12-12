//
//  BaseViewController.swift
//  DemoTask
//
//  Created by Bhupesh Moyal on 11/12/19.
//  Copyright © 2019 Bhupesh Moyal. All rights reserved.
//

import Foundation
import UIKit


class BaseViewController: UIViewController {
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let greyView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startSpinning(isBlur:Bool = true) {
        
        DispatchQueue.main.async { [weak self] in
            
            guard let self = self else {
                return
            }
            self.activityIndicator.style = .whiteLarge
            self.activityIndicator.color = UIColor.Common.blackColor
            self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            self.activityIndicator.center = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.height / 2)
            self.view.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
            self.disableUserInteraction()

            if isBlur{
                self.greyView.frame = CGRect(x:0, y:0, width:self.view.bounds.width, height:self.view.bounds.height)
                self.greyView.backgroundColor = UIColor.lightGray
                self.greyView.alpha = 0.3
                self.view.addSubview(self.greyView)
            }
        }
    }
    
    func disableUserInteraction() {
        self.view.isUserInteractionEnabled = false
    }
    func enableUserInteraction()  {
        self.view.isUserInteractionEnabled = true
    }
    func stopSpinning() {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.activityIndicator.stopAnimating()
            self.enableUserInteraction()
            self.greyView.removeFromSuperview()
        }
        
    }
}

extension BaseViewController{
    
    func setAppIconOnNavBar(){
        
        let customImageBarBtn1 = UIBarButtonItem(
            image: UIImage(named: "credit-card.png")?.withRenderingMode(.alwaysOriginal),
            style: .plain, target: self, action: #selector(handleClick))
        navigationItem.rightBarButtonItems = [customImageBarBtn1]
        
    }
    
    func setNavigationBar(){
        
        self.navigationController?.navigationBar.barTintColor = UIColor.NavigationBarColor.navColor
        self.navigationController?.navigationBar.tintColor = UIColor.Common.whiteColor
        
        let navigationFont = UIFont(name: "HelveticaNeue-Bold", size: 20)
        let navigationLargeFont = UIFont(name: "HelveticaNeue-Bold", size: 34)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Common.whiteColor, NSAttributedString.Key.font: navigationFont!]
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Common.whiteColor, NSAttributedString.Key.font: navigationLargeFont!]
        
    }
    
    func setNavIconsPaymentSucsess(){
        
        let customImageBarBtn1 = UIBarButtonItem(
            image: UIImage(named: "credit-card.png")?.withRenderingMode(.alwaysOriginal),
            style: .plain, target: self, action: #selector(handleClick))
        navigationItem.leftBarButtonItems = [customImageBarBtn1]
        
        
        let customImageBarBtn2 = UIBarButtonItem(
            image: UIImage(named: "close-button")?.withRenderingMode(.alwaysOriginal),
            style: .plain, target: self, action: #selector(closeVC))
        navigationItem.rightBarButtonItems = [customImageBarBtn2]
        
    }
    @objc func closeVC(){
        
    }
    @objc private func bottomBarClicked(){
        
    }
    
    @objc private func handleClick(){
        
    }
    
    func addBottomBar(){
        
        self.navigationController?.isToolbarHidden = false
        var items = [UIBarButtonItem]()
        let customImageBarBtn1 = UIBarButtonItem(
            image: UIImage(named: "securePay.png")?.withRenderingMode(.alwaysOriginal),
            style: .plain, target: self, action: #selector(bottomBarClicked))
        items.append(
            customImageBarBtn1
        )
        toolbarItems = items
    }
}
