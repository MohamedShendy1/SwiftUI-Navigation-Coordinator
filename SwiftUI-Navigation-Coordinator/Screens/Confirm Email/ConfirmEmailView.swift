//
//  ConfirmEmailView.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  25/03/2026.
//

import SwiftUI

struct ConfirmEmailView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack{
            Text("Confirm EmailAddress")
            
            TextField("", text: $viewModel.emailCode)
                .multilineTextAlignment(.center)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .cornerRadius(10)
                .background(Color(UIColor.systemGray6))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                    
                }
                .frame(width: 100)
            
            Button("Submit"){
                viewModel.onSubmitTapped()
            }
            .padding(.top, 30)
        }
        .navigationBarBackButtonHidden()
        .alert("Code Submitted", isPresented: $viewModel.showSubmittedAlert) {
            Button("OK", role: .none){
                viewModel.onConfirmSubmited()
            }
        }
    }
}

#Preview {
    ConfirmEmailView(viewModel: .init())
}
