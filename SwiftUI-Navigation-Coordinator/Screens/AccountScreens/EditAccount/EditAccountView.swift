//
//  EditAccountView.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 25/03/2026.
//

import SwiftUI

private enum Constants {
    
    static let labelPadding = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
}

struct EditAccountView: View {
    @StateObject var viewModel: ViewModel
    var body: some View {
        VStack{
            LabeledInputView(
                label: "Name",
                value: $viewModel.name
            )
            .padding(Constants.labelPadding)
            
            LabeledInputView(
                label: "Email",
                value: $viewModel.email,
                contentType: .emailAddress,
                autocapitalization: .none
                
            )
            .padding(Constants.labelPadding)
            
            
            Button("Submit"){
                viewModel.onSubmit()
            }
            .padding(.top, 20)
            
        }.navigationBarBackButtonHidden(true)
        
    }
}


extension EditAccountView {
    struct LabeledInputView: View {
        var label: String
        var placeholder: String = ""
        @Binding var value: String
        var contentType: UITextContentType? = .none
        var autocapitalization: TextInputAutocapitalization?
        
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(label)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField(placeholder,text: $value)
                    .textContentType(contentType)
                    .textInputAutocapitalization(autocapitalization)
                    .padding(.vertical,5)
                    .padding(.horizontal, 10)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    }
            }
        }
    }
}

#Preview {
    EditAccountView(viewModel: .init())
}
