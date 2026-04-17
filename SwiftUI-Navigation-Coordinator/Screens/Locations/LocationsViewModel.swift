//
//  LocationsViewModel.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 11/03/2026.
//

import Foundation

protocol LocationNavDelegate: AnyObject {
    func onLocationsBackTapped()
    func onLocationsShowingUpgradeScreen()
    func onLocationsYourAccountTapped()
}


extension LocationsView {
    
    class ViewModel:BaseViewModel, ObservableObject {
        
        weak var navDelegate: LocationNavDelegate?
        var showBackButton = false
    }
    
}


//MARK: - ACtions
extension LocationsView.ViewModel {
    
    func onBatckTap() {
        navDelegate?.onLocationsBackTapped()
    }

    func onUpgradeTap() {
        navDelegate?.onLocationsShowingUpgradeScreen()
    }
    
    func onYourAccountTap() {
        navDelegate?.onLocationsYourAccountTapped()
    }
}

