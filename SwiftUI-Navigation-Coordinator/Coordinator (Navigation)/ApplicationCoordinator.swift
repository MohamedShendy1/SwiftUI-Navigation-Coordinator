//
//  ApplicationCoordinator.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 03/03/2026.
//

import UIKit
import SwiftUI

class ApplicationCoordinator: BaseCoordinator<UINavigationController> {
    
    let window: UIWindow
    init(window: UIWindow) {
        self.window = window
        let presenter = UINavigationController()
        
        presenter.isNavigationBarHidden = false
        super.init(presenter: presenter)
        self.window.rootViewController = presenter
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        startAuth()
    }
    
}

//MARK: - Showing Screens
extension ApplicationCoordinator {
    
    func startAuth(){
        let authCoordinator = AuthCoordinator(presenter: presenter)
        authCoordinator.delegate = self
        authCoordinator.start()
        self.store(coordinator: authCoordinator)
    }
    
    func startMain(){
        let view = TestView()
        let controller = UIHostingController(rootView: view)
        controller.title = "Test View"
        presenter.setViewControllers([controller], animated: true)
    }
    
}


extension ApplicationCoordinator: AuthCoordinatorDelegate {
    
    func onAuthCoordinationComplete(authCoordinator: AuthCoordinator) {
        startMain()
        self.free(coordinator: authCoordinator)
    }
        
}
