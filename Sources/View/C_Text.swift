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
    public let color: Color
    public let fixedSizeVertical: Bool

    private let textAlignment: TextAlignment
    
    public var body: some View {
        
        Text(text)
            .font(typography.font)
            .multilineTextAlignment(textAlignment)
            .foregroundStyle(color)
            .fixedSize(horizontal: false, vertical: fixedSizeVertical)
            .frame(width: width, alignment: alignment ?? typography.alignment)
    }
    
    public init(_ text: String,
                size: CGFloat,
                color: Color = .textPrimary,
                fontName: C_FontName = .system,
                fontWeight: Font.Weight = .regular,
                alignment: Alignment = .leading,
                width: CGFloat? = nil,
                fixedSizeVertical: Bool = true) {
        
        self.text = text
        self.typography = C_Font(size, fontName, fontWeight, alignment: alignment)
        self.width = width
        self.alignment = alignment
        self.color = color
        
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
        
        self.fixedSizeVertical = fixedSizeVertical
    }
    
    public init(_ text: String,
                type: C_TextType = .body,
                color: Color? = nil,
                fontWeight: Font.Weight? = nil,
                alignment: TextAlignment = .center,
                width: CGFloat? = nil,
                fontSize: CGFloat? = nil,
                fixedSizeVertical: Bool = true) {
        
        self.text = text
        self.typography = C_Font(fontSize ?? type.fontSize,
                                 type.fontName,
                                 fontWeight == nil ? type.fontWeight : fontWeight!,
                                 alignment: type.alignment)
        
        self.color = color ?? type.color
        self.alignment = type.alignment
        self.textAlignment = alignment
        self.width = width
        self.fixedSizeVertical = fixedSizeVertical
    }
}

#Preview {
    C_Text("Testing Text", size: 20)
}
