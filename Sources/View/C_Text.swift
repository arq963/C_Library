//
//  C_TextView.swift
//  SecureBusinessConnect
//
//  Created by Ali ur Rahman Qureshi on 22/01/2024.
//

import SwiftUI

public struct C_Text: View {
    
    public let text: String
    public let typography: C_Font
    public let width: CGFloat?
    public let alignment: Alignment?
    public let lineSpacing: CGFloat
    public let color: C_Color

    private let textAlignment: TextAlignment
    
    public var body: some View {
        
        Text(text)
            .font(typography.font)
            .fixedSize(horizontal: false, vertical: true)
            .lineSpacing(lineSpacing)
            .multilineTextAlignment(textAlignment)
            .foregroundStyle(color.rawValue)
            .frame(width: width, alignment: alignment ?? typography.allignment)
    }
    
    public init(_ text: String,
         _ size: CGFloat,
         color: C_Color = .textPrimary,
         fontName: C_FontName = .system,
         fontWeight: Font.Weight = .regular,
         alignment: Alignment = .leading,
         width: CGFloat? = nil,
         lineSpacing: CGFloat? = 0) {
        
        self.text = text
        self.typography = C_Font(size, fontName, fontWeight, allignment: alignment)
        self.width = width
        self.alignment = alignment
        self.color = color
        
        if let lineSpacing {
            self.lineSpacing = lineSpacing
        } else {
            self.lineSpacing = 0
        }
        
        switch alignment {
                
            case .center:
                textAlignment = .center
            case .leading:
                textAlignment = .leading
            case .trailing:
                textAlignment = .trailing
        default:
            textAlignment = .leading
        }
    }
    
    public init(_ text: String,
         type: C_TextType = .body,
         color: C_Color? = nil,
         fontWeight: Font.Weight? = nil,
         alignment: TextAlignment = .center,
         width: CGFloat? = nil,
         fontSize: CGFloat? = nil) {
        
        self.text = text
        self.typography = C_Font(fontSize ?? type.fontSize,
                                 type.fontName,
                                 fontWeight == nil ? type.fontWeight : fontWeight!,
                                 allignment: type.alignment)
        
        self.color = color ?? type.color
        self.alignment = type.alignment
        self.textAlignment = alignment
        self.width = width
        self.lineSpacing = 0
    }
}

#Preview {
    C_Text("Testing Text", 20)
}
