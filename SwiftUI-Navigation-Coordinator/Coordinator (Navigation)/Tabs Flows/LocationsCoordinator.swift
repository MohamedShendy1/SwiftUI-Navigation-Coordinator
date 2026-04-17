//
//  LocationsCoordinator.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  11/03/2026.
//

import UIKit
import SwiftUI


protocol LocationsCoordinatorDelegate: AnyObject {

    func onLocationCoordinationComplete(coordinator: LocationsCoordinator)
}

class LocationsCoordinator: BaseCoordinator<UINavigationController>, UpgradeCoordinating {
    
    weak var delegate: LocationsCoordinatorDelegate?
    override func start() {
        showingLocationsScreen()
    }
}


//MARK: - Showing Screens
private extension LocationsCoordinator {
    
    func showingLocationsScreen() {
        let viewModel = LocationsView.ViewModel()
        viewModel.navDelegate = self
        viewModel.showBackButton =  embeddedInExistingNavStack
        let view =  LocationsView(viewModel: viewModel)
        let controller = LocationsHostingController(rootView: view, viewModel: viewModel)
        controller.title = "Locations"
        
       pushInitialControllerBasedOnEmbeddedNavState(controller: controller)
    }
    
}

//MARK: - Starting Account Flow
private extension LocationsCoordinator {
    
    func startAccountFlow(delegate: AccountCoordinatorDelegate) {
        let accountPresenter = UINavigationController()
        let coordinator = AccountCoordinator(presenter: accountPresenter,modelLayer: modelLayer)
        coordinator.delegate = delegate
        coordinator.start()
        
        presenter.present(accountPresenter, animated: true)
        store(coordinator: coordinator)
    }
}



//MARK: - LocationNavDelegate
extension LocationsCoordinator: LocationNavDelegate {
    func onLocationsBackTapped(){
        presenter.popViewController(animated: true)
    }
    func onLocationsShowingUpgradeScreen(){
        showingUpgradeScreen()
    }
    func onLocationsYourAccountTapped(){
        startAccountFlow(delegate: self)
    }

}

extension LocationsCoordinator: AccountCoordinatorDelegate {
    func onAccountCoordinationComplete(coordinator: AccountCoordinator) {
        self.free(coordinator: coordinator)
    }
}

