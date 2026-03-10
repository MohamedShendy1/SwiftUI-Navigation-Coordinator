//
//  DefaultTextField Style.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 04/03/2026.
//

import SwiftUI

struct DefaultTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(style: StrokeStyle(lineWidth: 1))
            }
            
    }
}


#Preview {
    TextField("Email", text: .constant(""))
        .textFieldStyle(DefaultTextFieldStyle())
        .padding()
}
