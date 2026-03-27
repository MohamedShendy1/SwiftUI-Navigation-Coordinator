//
//  EditAccountViewModel.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 25/03/2026.
//

import UIKit
import SwiftUI


protocol EditAccountNavDelegate: AnyObject {
    func onEditAccountSubmitTapped(editEmail: Bool)
    func onEditAccountBackTapped()
    
}
extension EditAccountView {
    
    class ViewModel: BaseViewModel, ObservableObject{
        
        weak var navDelegate: EditAccountNavDelegate?
        
        @Published var name: String = "Mohamed"
        @Published var email: String = "mohamed@gmail.com"
        
    }
}

// MARK: - Actions

extension EditAccountView.ViewModel {
    
    func onSubmit() {
        navDelegate?.onEditAccountSubmitTapped(editEmail: email != "mohamed@gmail.com")
    }
    
    func onBack() {
        navDelegate?.onEditAccountBackTapped()
    }
}
