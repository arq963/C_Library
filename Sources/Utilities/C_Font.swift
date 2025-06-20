//
//  CustomFonts.swift
//  SecureConnect
//
//  Created by Ali ur Rahman Qureshi on 01/12/2023.
//

import Foundation
import SwiftUI

struct C_Font {
    
    var font: Font
    var lineHeight: CGFloat
    var kerning: CGFloat
    var allignment: Alignment
    
    init(_ size: CGFloat,
         _ name: C_FontName = .system,
         _ weight: Font.Weight = .regular,
         allignment: Alignment = .leading) {
        
        switch name {
        case .system:
            self.font = Font.system(size: size, weight: weight)
        default:
            self.font = Font.custom(C_FontName.get(name, weight), size: size)
        }
                
        self.allignment = allignment
        self.kerning = 0
        
        switch size {
            
            case 35: self.lineHeight = 48
            case 23: self.lineHeight = 31.32
            case 20: self.lineHeight = 27
            case 18: self.lineHeight = 24
            case 17: self.lineHeight = 22
            case 16: self.lineHeight = 21.8
            case 14: self.lineHeight = 19.1
            case 13: self.lineHeight = 17.77
            case 12: self.lineHeight = 16
            case 11: self.lineHeight = 17.77
            case 10: self.lineHeight = 14
            case 9:  self.lineHeight = 12
            case 7:  self.lineHeight = 12
            
            default: self.lineHeight = 17.77
        }
    }
}
