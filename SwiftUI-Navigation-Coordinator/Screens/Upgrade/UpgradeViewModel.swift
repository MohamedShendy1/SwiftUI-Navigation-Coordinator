//
//  UpgradeViewModel.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  17/04/2026.
//

import Foundation
import UIKit

protocol UpgradeViewNavDelegate: AnyObject {
    func onUpgradeClose()
}

extension UpgradeView {
    
    class ViewModel: BaseViewModel, ObservableObject{
        
        weak var navDelegate: UpgradeViewNavDelegate?
        
    }
    

}



//MARK: - Actions

extension UpgradeView.ViewModel {
    func onCloseScreen() {
        navDelegate?.onUpgradeClose()
    }
}
