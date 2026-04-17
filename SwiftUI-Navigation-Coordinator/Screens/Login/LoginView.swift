//
//  LoginView.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  03/03/2026.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: ViewModel
    var body: some View {
        VStack{
            Spacer()
            Text("Navigation App")
                .padding(.bottom,30)
            EmailField(value: $viewModel.email)
            PasswordField(value: $viewModel.password)
            Button("Submit"){
                viewModel.onLoginTapped()
            }
            Spacer()
            Button("Register"){
                viewModel.onLoginRegisterTapped()
            }
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    LoginView(viewModel: .init(userDefaults: .init()))
}
