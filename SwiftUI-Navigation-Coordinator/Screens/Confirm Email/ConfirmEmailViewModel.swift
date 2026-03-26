//
//  ConfirmEmailViewModel.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 25/03/2026.
//

import Foundation


protocol ConfirmEmailViewNavDelegate: AnyObject {
    func onConfirmEmailSubmit()
    func onConfirmEmailBackTapped()
}
extension ConfirmEmailView {
    class ViewModel: BaseViewModel, ObservableObject {
        
        @Published var emailCode: String = "12345"
        @Published var showSubmittedAlert: Bool = false
        
        weak var navDelegate: ConfirmEmailViewNavDelegate?
        
        
        
        
    }
}


// MARK: - Actions

extension ConfirmEmailView.ViewModel {
    
    func onSubmitTapped() {
        showSubmittedAlert = true
    }
    
    func onConfirmSubmited() {
        navDelegate?.onConfirmEmailSubmit()
    }
    
    func onBackTapped() {
        navDelegate?.onConfirmEmailBackTapped()
    }
}
