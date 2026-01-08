//
//  CustomFonts.swift
//  SecureConnect
//
//  Created by Ali ur Rahman Qureshi on 01/12/2023.
//

import Foundation
import SwiftUI
import UIKit
import CoreText

public struct C_Font {
    
    public var font: Font
    public var alignment: Alignment
    
    public init(_ size: CGFloat,
                _ name: C_FontName = .system,
                _ weight: Font.Weight = .regular,
                alignment: Alignment = .leading,
                relativeTo style: Font.TextStyle = .body) {
        
        switch name {
        case .system:
            self.font = Font.system(size: size, weight: weight)
        default:
            self.font = Font.custom(C_FontName.get(name, fontWeight: weight),
                                    size: size,
                                    relativeTo: style)
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
}
