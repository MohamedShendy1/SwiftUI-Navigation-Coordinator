//
//  AccountViewModel.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  24/03/2026.
//

import SwiftUI
import UIKit


protocol AccountNavDelegate: AnyObject {
    func onAccountBackTapped()
    func onAccountExitTapped()
    func onAccountEditTapped()
    func onAccountLogoutTapped()
    
    /**
     * Note:
     * This view is opened from multiple places.
     * - Presented Modally: Needs the exit button.
     * - Pushed in Stack: Does not need the exit button (back button handles it).
     * - So we have to add the "onAccountExitTapped" here...
     */
}


extension AccountView {
    
    class ViewModel: BaseViewModel,ObservableObject {
        weak var navDelegate: AccountNavDelegate?
        var showExitButton: Bool = false

    }
}


//MARK: - Actions
extension AccountView.ViewModel{
     
    func onBackTapped() {
        navDelegate?.onAccountBackTapped()
    }
    
    func onExitTapped() {
        navDelegate?.onAccountExitTapped()
    }
    
    func onEditTapped() {
        navDelegate?.onAccountEditTapped()
    }
    
    func onlogoutTapped() {
        navDelegate?.onAccountLogoutTapped()
    }
    
}
