//
//  C_FontName.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 2/13/25.
//

import Foundation
import SwiftUI

/*
 100: Thin
 200: Extra Light
 300: Light
 400: Normal (Regular)
 500: Medium
 600: Semi-Bold (Demi-Bold)
 700: Bold
 800: Extra Bold
 900: Black (Heavy)
 */

public enum C_FontName {
    
    case gilroy
    case cera
    case poppins
    case system
    
    static func get(_ self: C_FontName, _ fontWeight: Font.Weight) -> String {

        switch self {
            
        case .gilroy:
            
            switch fontWeight {
                
            case .ultraLight:
                return "Gilroy-Light"

            case .thin:
                return "Gilroy-Light"

            case .light:
                return "Gilroy-Light"

            case .regular:
                return "Gilroy-Medium"

            case .medium:
                return "Gilroy-Medium"

            case .semibold:
                return "Gilroy-SemiBold"

            case .heavy:
                return "Gilroy-ExtraBold"

            case .bold:
                return "Gilroy-ExtraBold"
                
            case .black:
                return "Gilroy-ExtraBold"
                
            default:
                return ""
            }
            
        case .cera:
            
            switch fontWeight {
                
            case .ultraLight:
                return "Cera Pro Light"

            case .thin:
                return "Cera Pro Light"

            case .light:
                return "Cera Pro Light"

            case .regular:
                return "Cera Pro Light"

            case .medium:
                return "Cera Pro Medium"

            case .semibold:
                return "Cera Pro Medium"

            case .heavy:
                return "Cera Pro Bold"

            case .bold:
                return "Cera Pro Bold"
                
            default: return ""
                
            }
            
        case .poppins:
            
            switch fontWeight {
                
            case .ultraLight:
                return "Poppins-Thin"

            case .thin:
                return "Poppins-Thin"

            case .light:
                return "Poppins-Light"

            case .regular:
                return "Poppins-Regular"

            case .medium:
                return "Poppins-Medium"

            case .semibold:
                return "Poppins-SemiBold"

            case .heavy:
                return "Poppins-ExtraBold"

            case .bold:
                return "Poppins-Bold"
                
            default:
                return ""
                
            }
            
        case .system:
            return ""
        }
    }
}
