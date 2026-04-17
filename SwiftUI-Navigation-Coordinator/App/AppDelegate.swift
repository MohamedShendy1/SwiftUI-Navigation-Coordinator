//
//  Appdelegate.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  03/03/2026.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var applicationCoordinator: ApplicationCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        applicationCoordinator = ApplicationCoordinator(window: window)
        applicationCoordinator.start()
        
        return true
    }

}
