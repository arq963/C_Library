//
//  CustomFonts.swift
//  SecureConnect
//
//  Created by Ali ur Rahman Qureshi on 01/12/2023.
//

import Foundation
import SwiftUI

public struct C_Font {
    
    public var font: Font
    public var alignment: Alignment
    
    public init(
        _ size: CGFloat,
        _ name: C_FontName = .system,
        _ weight: Font.Weight = .regular,
        alignment: Alignment = .leading,
        relativeTo style: Font.TextStyle = .body // 👈 NEW
    ) {
        
        switch name {
        case .system:
            // System font adapts automatically
            self.font = Font.system(size: size, weight: weight)
            
        default:
            // Custom font tied to Dynamic Type
            self.font = Font.custom(
                C_FontName.get(name, weight),
                size: size,
                relativeTo: style // 👈 IMPORTANT
            )
        }
        
        self.alignment = alignment
    }
}

extension Font {
    public static var labelTextPrimary: Font {
        .system(size: 16, weight: .regular, design: .default)
    }
    
    public static var sectionHeader: Font {
        .system(size: 13, weight: .semibold, design: .default)
    }
    
    public func getFontColor(for font: Font) -> Color {
        
        switch font {
        case .labelTextPrimary:
            return .gray
        case .sectionHeader:
            return .textSectionHeader
        case .title3:
            return .textPrimary
        case .title2:
            return .textPrimary
        case .title:
            return .textPrimary
        case .body:
            return .textPrimary
        case .callout:
            return .textSecondary
        case .caption:
            return .textSecondary
        case .caption2:
            return .textSecondary
        case .footnote:
            return .textSecondary
        default:
            return .textSecondary
        }
        
    }
}
