//
//  ConfirmEmailHostingController.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 25/03/2026.
//

import Foundation

class ConfirmEmailHostingController: HostingController<ConfirmEmailView, ConfirmEmailView.ViewModel>{}


//MARK: - Lifycycle

extension ConfirmEmailHostingController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

//MARK: - Setup / Configurations

private extension ConfirmEmailHostingController {
    
    
    func setupViews() {
        title = "Confirm Email"
        
        setCustomBackButton(target: self, selector: #selector(onBackTapped))
    }
}


//MARK: - Actions

extension ConfirmEmailHostingController {
    @objc func onBackTapped() {
        viewModel.onBackTapped()
    }
    
}
