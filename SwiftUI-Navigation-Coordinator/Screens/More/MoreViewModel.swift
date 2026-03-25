//
//  MoreViewModel.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 11/03/2026.
//

import UIKit
import SwiftUI

protocol MoreViewNavDelegate: AnyObject {
    func onMoreViewAccountTapped()
    func onMoreViewLocationsapped()
    func onMoreViewUpgradeTapped()
}


extension MoreView {
    class ViewModel: BaseViewModel, ObservableObject {
        
        weak var navDelegate: MoreViewNavDelegate?
        
        
    }
}

//MARK: - Actions
extension MoreView.ViewModel  {
    
    func onAccountTapped() {
        navDelegate?.onMoreViewAccountTapped()
    }
    func onLocationsTapped() {
        navDelegate?.onMoreViewLocationsapped()
    }
    
    func onaccountUpgradeTapped() {
        navDelegate?.onMoreViewUpgradeTapped()
    }
    
}
