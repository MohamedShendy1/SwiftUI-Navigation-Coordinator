//
//  ListRow.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 24/03/2026.
//

import SwiftUI

struct ListRow: View {
    
    var title: String
    var trailingText: String?
    var systemImageName: String?
    var showingTrailingChevron = false
    var action: (() -> Void)? = nil
    
    var body: some View {
        VStack{
            HStack{
                
                if let systemImageName{
                    Image(systemName: systemImageName)
                        .frame(width: 20)
                }
                
                Text(title)
                
                Spacer()
                
                if let trailingText {
                    Text(verbatim: trailingText)
                }
                
                if showingTrailingChevron {
                    Image(systemName: "chevron.right")
                }
                
            }//end-> HStack
            .padding(.trailing, 20)
            
         Rectangle()
                .foregroundStyle(.gray.opacity(0.5))
                .frame(height: 1)
            
        }//end -> VStack
        .contentShape(Rectangle())
        .onTapGesture {
            action?()
        }
        .padding(.leading, 20)
        .padding(.top,5)
    }
}

#Preview {
    ListRow(title: "email", trailingText: "dev.mohamed.shendy@gmail.com",systemImageName: "person.fill")
        
}
