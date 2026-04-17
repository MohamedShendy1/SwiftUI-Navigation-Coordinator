//
//  AuthCoordinator.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  08/03/2026.
//

import UIKit


protocol AuthCoordinatorDelegate: AnyObject {
    func onAuthCoordinationComplete(authCoordinator: AuthCoordinator)
}

class AuthCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: AuthCoordinatorDelegate?
    
    override func start() {
        showLoginScreen()
    }
}


//MARK: -  Showing Screens
extension AuthCoordinator {
    
    func showLoginScreen() {
        
        let viewModel = LoginView.ViewModel(userDefaults: userDefaults)
        viewModel.navDelegate = self

        let view = LoginView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Login"
        presenter.setViewControllers([controller], animated: true)
    }
    
    
    
    func showRegisterScreen() {
        let viewModel = RegisterView.ViewModel()
        viewModel.navDelegate = self
        
        let view = RegisterView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Register"
        
        presenter.pushViewController(controller, animated: true)
    }
    
}


//MARK: - ConfirmEmailNavDelegate
extension AuthCoordinator: ConfirmEmailCoordinating {
   
    func onConfirmEmailSubmit() {
        showLoginScreen()
    }
    
    func onConfirmEmailBackTapped() {
        presenter.popViewController(animated: true)
    }
}

//MARK: - LoginNavigation Delegate
extension AuthCoordinator: LoginNavDelegate {
    
    func onLoginRegisterTapped() {
        showRegisterScreen()
    }
    
    func onLoginSuccessfullyTapped() {
        delegate?.onAuthCoordinationComplete(authCoordinator: self)
    }
}




//MARK: - RegisterNavDelegate
extension AuthCoordinator: RegisterNavDelegate {
   
    func onRegisterComplete() {
        showConfirmEmailScreen()
    }
    
    func OnRegisterLoginTapped() {
        showLoginScreen()
    }
}





