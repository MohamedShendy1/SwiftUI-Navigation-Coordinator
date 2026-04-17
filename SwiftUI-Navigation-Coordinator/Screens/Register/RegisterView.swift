//
//  RegisterView.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  08/03/2026.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel: ViewModel
    var body: some View {
        VStack{
            Spacer()
            
            EmailField(value: $viewModel.email)
                .padding(.bottom, 10)
            
            PasswordField(value: $viewModel.password)
                .padding(.bottom, 10)
            
            PasswordField(value: $viewModel.confirmPassword, placeholder: "Confirm Password")
                .padding(.bottom, 10)
            
            Button("Register"){
                viewModel.onRegisterTapped()
            }
        Spacer()
            Button ("Login"){
                viewModel.onLoginTapped()
            }
            
        }
        .padding(.horizontal, 40)
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            Button("Ok", role: .none) {
                if viewModel.registerationSuccessful {
                    viewModel.onRegisterComplete()
                }
            }
        }
    }
}

#Preview {
    RegisterView(viewModel: .init())
}
