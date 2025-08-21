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
    public let color: Color
    public let fixedSizeVertical: Bool

    private let textAlignment: TextAlignment
    
    public var body: some View {
        
        Text(text)
            .font(typography.font)
            .lineSpacing(lineSpacing)
            .multilineTextAlignment(textAlignment)
            .foregroundStyle(color)
            .fixedSize(horizontal: false, vertical: fixedSizeVertical)
            .frame(width: width, alignment: alignment ?? typography.allignment)
    }
    
    public init(_ text: String,
                size: CGFloat,
                color: Color = .textPrimary,
                fontName: C_FontName = .system,
                fontWeight: Font.Weight = .regular,
                alignment: Alignment = .leading,
                width: CGFloat? = nil,
                lineSpacing: CGFloat? = 0,
                fixedSizeVertical: Bool = true) {
        
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
                                 allignment: type.alignment)
        
        self.color = color ?? type.color
        self.alignment = type.alignment
        self.textAlignment = alignment
        self.width = width
        self.lineSpacing = 0
        self.fixedSizeVertical = fixedSizeVertical
    }
}

#Preview {
    C_Text("Testing Text", size: 20)
}
