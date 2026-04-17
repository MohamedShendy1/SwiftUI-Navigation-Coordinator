//
//  LocationsView.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 11/03/2026.
//

import SwiftUI

struct LocationsView: View {
    
    @StateObject var viewModel: ViewModel
    let locations = ["Syendny", "Newyork", "HoUstone", "Ontraio", "Texas", "Australia"]
    var body: some View {
        
        
        ScrollView {
            ForEach(Array(locations.enumerated()), id: \.offset) { _, location in
                ListRow(title: location)
            }
            
            Button("Your Accout") {
                viewModel.onYourAccountTap()
            }
            .padding(.top, 10)
        }
            .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    LocationsView(viewModel: .init())
}
