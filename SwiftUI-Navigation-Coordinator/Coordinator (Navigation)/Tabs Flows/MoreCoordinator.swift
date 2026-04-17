//
//  MoreCoordinator.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  11/03/2026.
//

import UIKit
import SwiftUI

protocol MoreDelegate: AnyObject {
    func onMoreLogoutTapped(coordinator: MoreCoordinator)
}
class MoreCoordinator: BaseCoordinator<UINavigationController>, UpgradeCoordinating{
    weak var delegate: MoreDelegate?
    
    override func start() {
        ShowingMoreScreen()
    }
}



//MARK: - Showing Screens
private extension MoreCoordinator {
    
    func ShowingMoreScreen() {
        let viewModel = MoreView.ViewModel()
        viewModel.navDelegate = self
        let view = MoreView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "More"
        
        presenter.setViewControllers([controller], animated: true)
    }
    

    
}

//MARK: - Starting Account Flow
private extension MoreCoordinator {
    
    func startAccountFlow() {
        let coordinator = AccountCoordinator(presenter: presenter,modelLayer: modelLayer)
        coordinator.delegate = self
        coordinator.start()
        
        store(coordinator: coordinator)
    }
    
    func startLocationFlow() {
        let coordinator = LocationsCoordinator(presenter: presenter,modelLayer: modelLayer)
        coordinator.delegate = self
        coordinator.start()
        
        store(coordinator: coordinator)
    }
    
    
}
// MARK: - MoreView NaveDelegate
extension MoreCoordinator: MoreViewNavDelegate {
    
    func onMoreViewAccountTapped() {
        startAccountFlow()
    }
    
    func onMoreViewLocationsapped() {
        startLocationFlow()
    }
    
    func onMoreViewUpgradeTapped() {
        showingUpgradeScreen()
    }
    
    
}



// MARK: - AccountCoordinatorDelegate
extension MoreCoordinator: AccountCoordinatorDelegate {
    
    func onAccountCoordinationComplete(coordinator: AccountCoordinator) {
        free(coordinator: coordinator)
    }
    
}

// MARK: - LocationsCoordinatorDelegate
extension MoreCoordinator: LocationsCoordinatorDelegate {
    func onLocationCoordinationComplete(coordinator: LocationsCoordinator) {
        free(coordinator: coordinator)
    }
    
    
}
