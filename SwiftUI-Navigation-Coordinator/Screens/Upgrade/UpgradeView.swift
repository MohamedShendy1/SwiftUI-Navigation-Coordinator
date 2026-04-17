//
//  UpgradeView.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  17/04/2026.
//

import SwiftUI

struct UpgradeView: View {
    @StateObject var viewModel: ViewModel
    var body: some View {
       
        VStack {
            Text("Would you like to upgrade your account")
            
            Button("Upgrade Account") {
                viewModel.onCloseScreen()
            }
        }
    }
}

#Preview {
    UpgradeView(viewModel: .init())
}
