//
//  ConfirmEmailCoordinating.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  26/03/2026.
//

import UIKit

protocol ConfirmEmailCoordinating: BaseCoordinator<UINavigationController>, ConfirmEmailViewNavDelegate {}

extension ConfirmEmailCoordinating {
    
    func showConfirmEmailScreen() {
        let viewModel = ConfirmEmailView.ViewModel()
        viewModel.navDelegate = self
        let view = ConfirmEmailView(viewModel: viewModel)
        let controller = ConfirmEmailHostingController(rootView: view, viewModel: viewModel)
        presenter.pushViewController(controller, animated: true)
        
        
        
    }
}
