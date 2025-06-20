//
//  C_ButtonFilledView.swift
//  SecureBusinessConnect
//
//  Created by Ali ur Rahman Qureshi on 22/01/2024.
//

import SwiftUI

public struct C_ButtonFilledView: View {
    
    public let display: String
    public let action: () -> ()
    public let width: CGFloat?
    public let height: CGFloat?
    public let color: C_Color
    let textColor: C_Color
    
    public var body: some View {
        
        Button(action: action) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(color.rawValue)
                
                C_Text(display, 18, color: textColor, fontWeight: .semibold)
            }
            .frame(width: width, height: height)
        }
    }
    
    init(text: String,
         style: ButtonDesign = .yellow,
         width: CGFloat? = nil,
         height: CGFloat? = C_Size.height_textField,         
         action: @escaping () -> Void) {
        
        self.display = text
        self.action = action
        self.width = width
        self.height = height
        self.color = style.backgroundColor
        self.textColor = style.textColor
    }
}

enum ButtonDesign {
    case yellow
    case blue
    case clear
    
    var backgroundColor: C_Color {
        switch self {
        case .yellow:
            return .appYellow
        case .blue:
            return .appBlue
        case .clear:
            return .clear
        }
    }
    
    var textColor: C_Color {
        switch self {
        case .yellow:
            return .appBlue
        case .blue:
            return .white
        case .clear:
            return .textPrimary
        }
    }
}

#Preview {
    C_ButtonFilledView(text: "Button Text") {
        
    }
}
