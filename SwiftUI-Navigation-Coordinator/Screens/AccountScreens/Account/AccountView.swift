//
//  AccountView.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 11/03/2026.
//

import SwiftUI
private enum Constants {
    static let avatarBackgroundSize: CGFloat = 70
    static var avatarSize: CGFloat { avatarBackgroundSize * 0.5}
}

struct AccountView: View {
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
                }
            }
        }
    }
}

#Preview {
    AccountView()
}
