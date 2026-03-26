//
//  LocationsCoordinator.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 11/03/2026.
//

import UIKit
import SwiftUI

class LocationsCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        super.init()
        showingLocationsScreen()
    }
}



//MARK: - Showing Screens
private extension LocationsCoordinator {
    
    func showingLocationsScreen() {
        let view =  LocationsView()
        let controller = UIHostingController(rootView: view)
        controller.title = "Locations"
        
        presenter.setViewControllers([controller], animated: true)
    }
    
}
