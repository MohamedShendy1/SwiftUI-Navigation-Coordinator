//
//  UpgradeCoordinating.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by Mohamed Shendy  on 17/04/2026.
//

import UIKit
 
protocol UpgradeCoordinating: BaseCoordinator<UINavigationController>, UpgradeViewNavDelegate {}


//MARK: - Showing Screen

extension UpgradeCoordinating {
    func showingUpgradeScreen() {
        
        let viewModel = UpgradeView.ViewModel()
        viewModel.navDelegate = self
        
        let view = UpgradeView(viewModel: viewModel)
        let controller = UpgradeHostingController(rootView: view, viewModel: viewModel)
        
        let wrapper = UINavigationController(rootViewController: controller)
        
        presenter.present(wrapper, animated: true)
    }
}

//MARK: - UpgradeCoordinating

extension UpgradeCoordinating {
    func onUpgradeClose() {
        presenter.dismiss(animated: true)
    }
}
