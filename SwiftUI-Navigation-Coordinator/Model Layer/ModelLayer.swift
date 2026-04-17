//
//  ModelLayer.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by Mohamed Shendy  on 17/04/2026.
//

import Foundation

class ModelLayer {
        let systemLayer: SystemLayer
    
    init(systemLayer: SystemLayer) {
        self.systemLayer = systemLayer
    }
}

extension ModelLayer {
     func logout() {
         systemLayer.logout()
    }
}
