//
//  HomeCoordinator.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 11/03/2026.
//

//import UIKit
import SwiftUI

class HomeCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        showingHomeScreen()
    }
}


//MARK: - Showing (Home) Screens
extension HomeCoordinator{
    
    func showingHomeScreen(){
        let view = HomeView()
        let controller = UIHostingController(rootView: view)
        controller.title = "Home"
        
        presenter.setViewControllers([controller], animated: true)
    }
}
