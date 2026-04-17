//
//  UpgradeHostingController1.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by Mohamed Shendy  on 17/04/2026.
//

import Foundation

class UpgradeHostingController: HostingController<UpgradeView, UpgradeView.ViewModel>{}


//MARK: - Lifycycle

extension UpgradeHostingController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

//MARK: - Setup / Configurations

private extension UpgradeHostingController {

    func setupViews() {
        title = "Upgrade"
        setNavigationExitButton(target: self, selector: #selector(onExitTapped))
    }
}


//MARK: - Actions

extension UpgradeHostingController {
    
    @objc func onExitTapped() {
        viewModel.onCloseScreen()
    }
    
}
