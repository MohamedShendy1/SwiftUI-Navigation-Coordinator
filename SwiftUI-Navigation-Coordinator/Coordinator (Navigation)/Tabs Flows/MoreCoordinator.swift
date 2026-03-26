//
//  MoreCoordinator.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 11/03/2026.
//

import UIKit
import SwiftUI

protocol MoreDelegate: AnyObject {
    func onMoreLogoutTapped(coordinator: MoreCoordinator)
}
class MoreCoordinator: BaseCoordinator<UINavigationController> {
    weak var delegate: MoreDelegate?
    
    override func start() {
        super.init()
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

// MARK: - MoreView Nave Delegate
extension MoreCoordinator: MoreViewNavDelegate {
    func onMoreViewAccountTapped() {
//        showAccountScreen()
    }
    
    func onMoreViewLocationsapped() {
        
    }
    
    func onMoreViewUpgradeTapped() {
        
    }
    
    
}


