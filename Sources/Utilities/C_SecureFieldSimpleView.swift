//
//  C_SecureFieldSimpleView.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 3/22/25.
//

import SwiftUI

struct C_SecureFieldSimpleView: View {
    
    @Binding var input: String
    
    let textColor: C_Color
    let placeHolder: String
    
    @State var isShowingPassword = false
    
    var body: some View {
        
        HStack {
            
            if isShowingPassword {
                TextField(placeHolder, text: $input)
                    .font(C_Font(17).font)
                    .foregroundStyle(textColor.rawValue)
            } else {
                SecureField("", text: $input, prompt: Text(placeHolder).foregroundColor(C_Color.textPlaceholder.rawValue))
                    .font(C_Font(17).font)
                    .foregroundStyle(textColor.rawValue)
            }
            
            Spacer()
            
            Button(action: { isShowingPassword.toggle() }) {
                Image(systemName: isShowingPassword ? "eye.slash.fill" : "eye.fill")
                    .foregroundStyle(C_Color.lightGray.rawValue)
                    .padding(.trailing, 8)
            }
        }
    }
    
    init(input: Binding<String>,
         placeHolder: String,
         color: C_Color = .textPrimary) {
        
        _input = input
        self.placeHolder = placeHolder
        self.isShowingPassword = false
        self.textColor = color
    }
}

#Preview {
    C_SecureFieldSimpleView(input: .constant("Input String"),
                            placeHolder: "Enter Something")
}
