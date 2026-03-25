//
//  MoreView.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 11/03/2026.
//

import SwiftUI

struct MoreView: View {
    
    var viewModel: ViewModel
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                ListRow(title: "Accoumt", systemImageName: "person.crop.circle", showingTrailingChevron: true) {
                    viewModel.onAccountTapped()
                }
            }.navigationBarBackButtonHidden(true)
        }

    }
}

#Preview {
    MoreView(viewModel: .init())
}
