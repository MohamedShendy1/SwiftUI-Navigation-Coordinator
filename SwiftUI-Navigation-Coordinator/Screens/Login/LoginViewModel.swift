//
//  LoginViewModel.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  04/03/2026.
//

import SwiftUI
import Combine

protocol LoginNavDelegate: AnyObject {
    func onLoginRegisterTapped()
    func onLoginSuccessfullyTapped()
}

extension LoginView {
    
    class ViewModel:BaseViewModel, ObservableObject {
        @Published var email: String = ""
        @Published var password: String = ""
        
        weak var navDelegate: LoginNavDelegate?
        
        let userDefaults: UserDefaultsManager
        
        init(userDefaults: UserDefaultsManager){
            self.userDefaults = userDefaults
        }
        
    }
}


extension LoginView.ViewModel {
    func onLoginTapped() {
        userDefaults.isLoggedIn = true
        navDelegate?.onLoginSuccessfullyTapped()
    }
    
    func onLoginRegisterTapped() {
        navDelegate?.onLoginRegisterTapped()
    }
}
