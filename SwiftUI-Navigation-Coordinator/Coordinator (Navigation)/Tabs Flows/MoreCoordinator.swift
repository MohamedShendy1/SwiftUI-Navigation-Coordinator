//
//  MoreCoordinator.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 11/03/2026.
//

import UIKit
import SwiftUI

class MoreCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        ShowingMoreScreen()
    }
}



//MARK: - Showing Screens
private extension MoreCoordinator {
    
    func ShowingMoreScreen() {
        let view = MoreView()
        let controller = UIHostingController(rootView: view)
        controller.title = "More"
        
        presenter.setViewControllers([controller], animated: true)
        
    }
}

