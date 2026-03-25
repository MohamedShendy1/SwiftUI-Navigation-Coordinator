//
//  MoreCoordinator.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 11/03/2026.
//

import UIKit
import SwiftUI

protocol MoreDelegate: AnyObject {
    func onMoreLogoutTapped(coordinator: MoreCoordinator)
}
class MoreCoordinator: BaseCoordinator<UINavigationController> {
    weak var delegate: MoreDelegate?
    
    override func start() {
        ShowingMoreScreen()
    }
}



//MARK: - Showing Screens
private extension MoreCoordinator {
    
    func ShowingMoreScreen() {
        let viewModel = MoreView.ViewModel()
        viewModel.navDelegate = self
        let view = MoreView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "More"
        
        presenter.setViewControllers([controller], animated: true)
    }
    
func showAccountScreen() {
        let viewModel = AccountView.ViewModel()
        viewModel.navDelegate = self
        viewModel.showExitButton = false
    let view = AccountView(viewModel: viewModel)
    let controller = AccountHostingController(rootView: view, viewModel: viewModel)
    controller.hidesBottomBarWhenPushed = true
    presenter.pushViewController(controller, animated: true)
    
    }
    
}

// MARK: - MoreView Nave Delegate
extension MoreCoordinator: MoreViewNavDelegate {
    func onMoreViewAccountTapped() {
        showAccountScreen()
    }
    
    func onMoreViewLocationsapped() {
        
    }
    
    func onMoreViewUpgradeTapped() {
        
    }
    
    
}


extension MoreCoordinator: AccountNavDelegate {
    func onAccountBackTapped(){
        presenter.popViewController(animated: true)
    }
    
    func onAccountExitTapped(){
        
    }
    
    func onAccounrEditTapped(){
        
    }
    
    func onAccountLogoutTapped(){
        delegate?.onMoreLogoutTapped(coordinator: self)
    }
    

}
