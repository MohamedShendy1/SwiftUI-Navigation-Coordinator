//
//  MoreView.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 11/03/2026.
//

import SwiftUI

struct MoreView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                ListRow(title: "Account", systemImageName: "person.crop.circle", showingTrailingChevron: true) {
                    viewModel.onAccountTapped()
                }

                ListRow(title: "Locations", systemImageName: "mappin.and.ellipse", showingTrailingChevron: true) {
                    viewModel.onLocationsTapped()
                }

                
                ListRow(title: "Upgrade", systemImageName: "crown", showingTrailingChevron: true) {
                    viewModel.onaccountUpgradeTapped()
                }


            }.navigationBarBackButtonHidden(true)
        }

    }
}

#Preview {
    MoreView(viewModel: .init())
}
