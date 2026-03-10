//
//  BaseCoordinator.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 03/03/2026.
//

import UIKit

class BaseCoordinator<ContollerType> where ContollerType: UIViewController {
    
    let id = UUID()
    private (set) var childCoordinators = [UUID: Any]()
    var presenter: ContollerType!
    
    init(presenter: ContollerType) {
        self.presenter = presenter
    }
    
    func start() {
        preconditionFailure("Start method not immplemented")
    }
    
}

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
