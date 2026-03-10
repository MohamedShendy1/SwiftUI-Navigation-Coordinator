//
//  RegisterViewModel.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 08/03/2026.
//

import Combine
import SwiftUI

protocol RegisterNavDelegate: AnyObject {
    func onRegisterComplete()
    func OnRegisterLoginTapped()
    
}
extension RegisterView {
    class ViewModel: BaseViewModel,ObservableObject {
        weak var navDelegate: RegisterNavDelegate?
        
        @Published var email: String = ""
        @Published var password: String = ""
        @Published var confirmPassword: String = ""
        
        @Published var showAlert: Bool = false
         var alertTitle: String = ""
         var alertMessage: String = ""
         var registerationSuccessful: Bool = false
        
        
            
    }

}


//MARK: - Actions

extension RegisterView.ViewModel {
    
    func onRegisterTapped() {
        registerationSuccessful = true
        alertTitle = "Registeration Successfully"
        alertMessage = "An activation email has been sent to your \(email) address."
        showAlert = true
    }
    
    func onLoginTapped() {
        navDelegate?.OnRegisterLoginTapped()
    }
}
