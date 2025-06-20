//
//  C_TextField.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 4/28/25.
//

import SwiftUI

struct C_TextField: View {
    
    @Binding var text: String
    
    let placeHolder: String
    let textColor: C_Color
    let keyBoardType: UIKeyboardType
    let textType: C_TextType
    
    var body: some View {
        
        TextField("", text: $text, prompt: Text(placeHolder).foregroundColor(C_Color.textPlaceholder.rawValue))
            .foregroundStyle(textColor.rawValue)
            .keyboardType(keyBoardType)
            .font(.system(size: textType.fontSize))
            .fontWeight(textType.fontWeight)
    }
    
    init(placeholder: String,
         text: Binding<String>,
         type: C_TextType = .body,
         keyBoard: UIKeyboardType = .default,
         textColor: C_Color? = .textPrimary) {
        
        self._text = text
        self.placeHolder = placeholder
        self.keyBoardType = keyBoard
        self.textType = type
        
        if let textColor {
            self.textColor = textColor
        } else {
            self.textColor = type.color
        }
    }
}

#Preview {
    C_TextField(placeholder: "Enter Something", text: .constant("Hello World"))
}
