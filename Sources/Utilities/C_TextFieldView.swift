//
//  C_TextFieldView.swift
//  SecureBusinessConnect
//
//  Created by Ali ur Rahman Qureshi on 22/01/2024.
//

import SwiftUI

struct C_TextFieldView: View {
    
    @Binding var input: String
    @FocusState private var isFocused: Bool
    
    let imageName: String?
    let blankText: String
    let background: Color
    let textColor: Color
    let drawOutline: Bool
    let width: CGFloat?
    let height: CGFloat
    let keyBoardType: UIKeyboardType
    let padding: CGFloat
    let alignment: TextAlignment
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(background)
            
            HStack {
                if let imageName {
                    Image(imageName)
                        .resizable()
                        .frame(width: 17, height: 17)
                        .padding(.leading, 8)
                }
                
                TextField("",
                          text: $input,
                          prompt: Text(blankText).foregroundColor(C_Color.textPlaceholder.rawValue))
                    .multilineTextAlignment(alignment)
                    .foregroundStyle(textColor)
                    .keyboardType(keyBoardType)
                    .focused($isFocused)
                    .padding(.leading, padding)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                isFocused = false
                            }
                        }
                    }
            }
        }
        .frame(width: width, height: height)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(C_Color.outline.rawValue,
                        lineWidth: drawOutline ? 2 : 0)
        )
        .onTapGesture {
            isFocused = false
        }
    }
    
    init(input: Binding<String>,
         blankText: String,
         imageName: String? = nil,
         keyBoard: UIKeyboardType = .default,
         background: C_Color = .white,
         textColor: C_Color = .textPrimary,
         drawOutline: Bool = true,
         alignment: TextAlignment = .leading,
         width: CGFloat? = nil,
         height: CGFloat = C_Size.height_textField) {
        
        _input = input
        
        self.imageName = imageName
        
        if imageName != nil {
            padding = 0
        } else {
            if alignment == .center {
                padding = 0
            } else {
                padding = 10
            }
        }
        self.blankText = blankText
        self.keyBoardType = keyBoard
        self.background = background.rawValue
        self.width = width
        self.height = height
        self.drawOutline = drawOutline
        self.textColor = textColor.rawValue
        self.alignment = alignment
    }
}

#Preview {
    C_TextFieldView(input: .constant("Hello World!"),
                    blankText: "Enter Something",
                    imageName: "AppIcon")
}
