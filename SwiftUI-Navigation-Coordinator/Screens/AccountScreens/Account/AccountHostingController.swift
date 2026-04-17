//
//  AccountHostingController.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  24/03/2026.
//

import UIKit
 
class AccountHostingController: HostingController<AccountView, AccountView.ViewModel>{}

//MARK: - Lifecycle
extension AccountHostingController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}


//MARK: - View Setup / Configuration
private extension AccountHostingController{
    
    func setupViews() {
        title = "Account"
        
        if viewModel.showExitButton {
            // Show the Exit Button
            setNavigationExitButton(target: self, selector: #selector(onExitButtonTapped))
        }else {
            // setup Back Button
            setCustomBackButton(target: self, selector: #selector(onBackButtonTapped))
        }
        
    }
}

//MARK: - Actions

extension AccountHostingController{
    
    @objc func onExitButtonTapped() {
        viewModel.onExitTapped()
    }
    
    @objc func onBackButtonTapped() {
        viewModel.onBackTapped()
    }
   
}
