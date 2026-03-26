//
//  AccountCoordinator.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 26/03/2026.
//

import UIKit


protocol AccountCoordinatorDelegate: AnyObject {
    
    func onAccountCoordinationComplete(coordinator: AccountCoordinator)
}

class AccountCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: AccountCoordinatorDelegate?
    
    override func start() {
        super.start()
        showAccountScreen()
    }
}


//MARK: - Showing Screen

extension AccountCoordinator {
    
    func showAccountScreen() {
        let viewModel = AccountView.ViewModel()
        viewModel.navDelegate = self
        viewModel.showExitButton = false
        let view = AccountView(viewModel: viewModel)
        let controller = AccountHostingController(rootView: view, viewModel: viewModel)
        controller.hidesBottomBarWhenPushed = true

        pushInitialControllerBasedOnEmbeddedNavState(controller: controller)
        
    }
    
    func showingEditAccountScreen() {
        let viewModel = EditAccountView.ViewModel()
        viewModel.navDelegate = self
        let view = EditAccountView(viewModel: viewModel)
        let controller = EditAccountHostingController(rootView: view, viewModel: viewModel)
        controller.hidesBottomBarWhenPushed = true
        presenter.pushViewController(controller, animated: true)
    }
}



//MARK: - AccountNavDelegate
extension AccountCoordinator: AccountNavDelegate {
    func onAccountBackTapped(){
        presenter.popViewController(animated: true)
        delegate?.onAccountCoordinationComplete(coordinator: self)
    }
    
    func onAccountExitTapped() {
        presenter.dismiss(animated: true){[weak self] in
            guard let self else { return }
            delegate?.onAccountCoordinationComplete(coordinator: self)
        }
    }
    
    func onAccountEditTapped() {
        showingEditAccountScreen()
    }
    
    func onAccountLogoutTapped() {
        
        // TODO: Send Notifications To Log out
    }
    
    
}


//MARK: - AccountNavDelegate
extension AccountCoordinator: EditAccountNavDelegate {
   
    func onEditAccountSubmitTapped(editEmail: Bool) {
        
    }
    
    func onEditAccountBackTapped() {
        
    }
    
}
