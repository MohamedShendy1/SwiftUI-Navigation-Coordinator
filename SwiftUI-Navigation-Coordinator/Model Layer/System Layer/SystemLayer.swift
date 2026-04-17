//
//  SystemLayer.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by Mohamed Shendy  on 17/04/2026.
//

import Foundation


class SystemLayer    {
    
    let userDefaults: UserDefaultsManager
    
    init(userDefaults: UserDefaultsManager) {
        self.userDefaults = userDefaults
    }
}


extension SystemLayer {
    
    func logout() {
        userDefaults.clearAllUserDefaults()
    }
}
