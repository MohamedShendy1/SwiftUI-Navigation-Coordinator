//
//  BaseCoordinator.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  03/03/2026.
//

import UIKit

class BaseCoordinator<ContollerType> where ContollerType: UIViewController {
    
    private(set) var embeddedInExistingNavStack = false
    
    
    let id = UUID()
    
    private(set) var childCoordinators = [UUID: Any]()
    
    var presenter: ContollerType
    let modelLayer: ModelLayer
    
    init(presenter: ContollerType, modelLayer: ModelLayer) {
        self.presenter = presenter
        self.modelLayer = modelLayer
        if let navController = presenter as? UINavigationController{
            embeddedInExistingNavStack = navController.viewControllers.count > 0
        }

    }
    
    func start() {
        preconditionFailure("Start method not immplemented")
    }
}

//MARK: - Convenience
extension BaseCoordinator {
    var userDefaults: UserDefaultsManager{modelLayer.systemLayer.userDefaults}
}


//MARK: -  Chield Coordenator Managment
extension BaseCoordinator{
    
    func store<U: UIViewController>(coordinator: BaseCoordinator<U>) {
        let coordinatorExiest = childCoordinators.contains(where: {(key, value) -> Bool in
            return key == coordinator.id})
        
        if !coordinatorExiest{
            childCoordinators[coordinator.id] = coordinator
        }
        
    }
    
    func free<U:UIViewController>(coordinator: BaseCoordinator<U>){
        let coordinatorExiest = childCoordinators.contains(where: {(key, value) -> Bool in
            return key == coordinator.id})
        
        
        if coordinatorExiest{
            childCoordinators[coordinator.id] = nil
        }
        
    }
    
    
    func freeAllChildCoordinators(){
        childCoordinators = [UUID: Any]()
    }
    
    func childCoordinator<T>(forKey key: UUID)-> T? {
        return childCoordinators.first(where: {$0.key == key})?.value as? T
    }
}


// MARK: - Utils
extension BaseCoordinator {
    
    func pushInitialControllerBasedOnEmbeddedNavState(controller: UIViewController) {
        guard let navController = presenter as? UINavigationController else {
            presenter.present(controller, animated: true)
            return
        }
        
        navController.pushViewController(controller, animated: embeddedInExistingNavStack)
    }
    
}
