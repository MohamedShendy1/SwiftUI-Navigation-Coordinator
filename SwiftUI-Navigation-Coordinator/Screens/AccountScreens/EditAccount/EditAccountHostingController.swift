//
//  EditAccountHostingController.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  25/03/2026.
//

import Foundation

class EditAccountHostingController: HostingController<EditAccountView, EditAccountView.ViewModel>{}


// MARK: - Lifecycle

extension EditAccountHostingController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup / Confirguration
private extension EditAccountHostingController {
    
    func setupViews(){
        title = "Edit Account"
        setCustomBackButton(target: self, selector: #selector(onBackTapped))
    }
}


// MARK: - Actions 
 extension EditAccountHostingController {
    
     @objc func onBackTapped() {
         viewModel.onBack()
     }
}


