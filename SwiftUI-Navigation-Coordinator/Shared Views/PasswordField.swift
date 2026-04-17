//
//  PasswordField.swift
//  SwiftUI-Navigation-Coordinator
//
// Created by Mohamed Shendy  04/03/2026.
//

import SwiftUI

struct PasswordField: View {
    
    @Binding var value: String
    var placeholder: String = "Password"
    
    var body: some View {
        TextField(placeholder, text: $value)
            .textFieldStyle(DefaultTextFieldStyle())
            .textInputAutocapitalization(.never)
    }
}

#Preview {
    PasswordField(value: .constant(""))
}
