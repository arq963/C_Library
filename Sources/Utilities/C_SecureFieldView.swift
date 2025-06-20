//
//  C_SecureFieldView.swift
//  SecureBusinessConnect
//
//  Created by Ali ur Rahman Qureshi on 22/01/2024.
//

import SwiftUI

struct C_SecureFieldView: View {
    
    @Binding var input: String
    
    let blankText: String
    let background: Color
    let outlineColor: Color
    let width: CGFloat?
    let height: CGFloat
    
    @State var isShowingPassword = false
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(background)
            
            HStack {
                
                if isShowingPassword {
                    TextField("",
                              text: $input,
                              prompt: Text(blankText).foregroundColor(C_Color.textPlaceholder.rawValue))
                        .font(C_Font(14).font)
                        .foregroundStyle(C_Color.textPlaceholder.rawValue)
                        .frame(height: C_Paddings.textFieldHeight)
                        .padding(.leading, 8)
                } else {
                    SecureField("", text: $input, prompt: Text(blankText).foregroundColor(C_Color.lightGray.rawValue))
                        .font(C_Font(14).font)
                        .foregroundStyle(C_Color.textPrimary.rawValue)
                        .frame(height: C_Paddings.textFieldHeight)
                        .padding(.leading, 8)
                }
                
                Button(action: { isShowingPassword.toggle() }) {
                    Image(systemName: isShowingPassword ? "eye.slash.fill" : "eye.fill")
                        .foregroundStyle(C_Color.lightGray.rawValue)
                        .padding(.trailing, 8)
                }
#if os(macOS)
                .buttonStyle(PlainButtonStyle())
#endif
            }
        }    
        .frame(width: width, height: height)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(outlineColor, lineWidth: 2))
    }
    
    init(input: Binding<String>,
         placeHolder: String,
         isShowingPassword: Bool = false,
         background: C_Color = .white,
         outlineColor: C_Color = .appYellow,
         width: CGFloat? = nil,
         height: CGFloat = C_Size.height_textField) {
        
        _input = input
        self.blankText = placeHolder
        self.isShowingPassword = isShowingPassword
        self.background = background.rawValue
        self.width = width
        self.height = height
        self.outlineColor = outlineColor.rawValue
    }
}


#Preview {
    C_SecureFieldView(input: .constant(""),
                      placeHolder: "Enter new password",
                      isShowingPassword: false,
                      background: .black)
    .padding(.top, 20)
    .padding(.horizontal, 20)
}
