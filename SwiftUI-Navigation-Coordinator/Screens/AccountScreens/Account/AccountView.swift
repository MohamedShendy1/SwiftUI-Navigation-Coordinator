//
//  AccountView.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  11/03/2026.
//

import SwiftUI

private enum Constants {
    static let avatarBackgroundSize: CGFloat = 70
    static var avatarSize: CGFloat { avatarBackgroundSize * 0.5}
}

struct AccountView: View {
    
    @StateObject  var viewModel: ViewModel
    
    var body: some View {
        VStack{
            
            ScrollView {
                VStack{
                    //Avatar image
                    ZStack{
                        Circle()
                            .foregroundStyle(.gray.opacity(0.5))
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                width: Constants.avatarSize,
                                height: Constants.avatarSize
                            )
                    }
                    .frame(
                        width: Constants.avatarBackgroundSize,
                        height: Constants.avatarBackgroundSize
                    )
                    
                    Text("Mohamed")
                        .padding(.top, 20)
                    
                    Spacer()
                        .frame(height: 100)
                    
                    ListRow(title: "email", trailingText: "dev.moh@gmail.com")
                }
                .padding(.top, 20)
                
            }
            
            Button("Edit Accout"){
                viewModel.onEditTapped()
            }
            .padding(.bottom, 20)
            
            Button("Logout"){
                viewModel.onlogoutTapped()
            }
            .padding(.bottom, 20)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AccountView(viewModel: .init())
}
