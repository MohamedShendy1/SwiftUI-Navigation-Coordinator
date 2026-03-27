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

class AccountCoordinator: BaseCoordinator<UINavigationController>, ConfirmEmailCoordinating {
    
    weak var delegate: AccountCoordinatorDelegate?
    
    override func start() {
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

//MARK: - AccountNavDelegate -> Navigatons Actions to (back - dismiss - Navigate to EditeAccount screen - logout )
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
        
       // in the first condition we assume that the view doesnot emmbed in navigation stack and it present as modally  so we need to exit that modal presentation and then send request to logout (notification) but in the second case the view already embede in navigation stack and we need only to send notification to logout
        
        if !embeddedInExistingNavStack {
            presenter.dismiss(animated: true) {
                NotificationCenter.default.post(name: .logout, object: nil)
            }
        }else{
            NotificationCenter.default.post(name: .logout, object: nil)
        }
    }
    
    
}


//MARK: - AccountNavDelegate
extension AccountCoordinator: EditAccountNavDelegate {
   
    func onEditAccountBackTapped() {
        presenter.popViewController(animated: true)
    }

    func onEditAccountSubmitTapped(editEmail: Bool) {
        
        if editEmail {
            showConfirmEmailScreen()
        }else {
            presenter.popViewController(animated: true)
        }
    }
    
}


//MARK: - ConfirmEmailNavDelegate
extension AccountCoordinator {
    
    func onConfirmEmailSubmit() {
       
        if let accountController = presenter.viewControllers.first(where:{$0 is AccountHostingController}) {
            presenter.popToViewController(accountController, animated: true)
        }else {
            
            presenter.popViewController(animated: true)
        }
    }
    
    func onConfirmEmailBackTapped() {
        presenter.popViewController(animated: true)
    }
    
}
