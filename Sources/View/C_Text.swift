//
//  C_TextView.swift
//  SecureBusinessConnect
//
//  Created by Ali ur Rahman Qureshi on 22/01/2024.
//

import SwiftUI

public struct C_Text: View {
    
    public let text: String
    public let font: Font
    public let width: CGFloat?
    public let alignment: Alignment
    public let color: Color
    public let fixedSizeVertical: Bool
    public let fontWeight: Font.Weight?
    
    private let textAlignment: TextAlignment
    
    public var body: some View {
        
        Text(text)
            .font(font)
            .fontWeight(fontWeight)
            .multilineTextAlignment(textAlignment)
            .foregroundStyle(color)
            .fixedSize(horizontal: false, vertical: fixedSizeVertical)
            .frame(width: width, alignment: alignment)
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
        let cfont = C_Font(size, fontName, fontWeight, alignment: alignment)
        self.font = cfont.font
        self.width = width
        self.alignment = alignment
        self.color = color
        self.fontWeight = fontWeight
        
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
                type: Font = .body,
                color: Color? = nil,
                fontWeight: Font.Weight? = nil,
                alignment: TextAlignment = .center,
                width: CGFloat? = nil,
                fixedSizeVertical: Bool = true) {
        
        self.text = text
        self.font = type
        self.color = color ?? .textPrimary
        self.fontWeight = fontWeight
        self.textAlignment = alignment
        
        switch alignment {
        case .center:
            self.alignment = .center
        case .leading:
            self.alignment = .leading
        case .trailing:
            self.alignment = .trailing
        }
        
        self.width = width
        self.fixedSizeVertical = fixedSizeVertical
    }
}

#Preview {
    C_Text("Testing Text", size: 20)
}
