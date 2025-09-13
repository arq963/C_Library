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
