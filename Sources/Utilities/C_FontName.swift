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
    
    case system
    case gilroy
    case cera
    case poppins
    case jakarta
    case lexend
    case jameelNooriNastaleeq
    
    /*static func get(_ self: C_FontName, _ fontWeight: Font.Weight) -> String {

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
    }  */
    
    static func get(_ self: C_FontName,
                    fontWeight: Font.Weight? = nil,
                    fontWeightValue: Int? = nil) -> String {
        
        var weightOfFont: Font.Weight = .regular
        
        if fontWeight == nil,
            let fontWeightValue = fontWeightValue {
            
            weightOfFont = fromRawValue(fontWeightValue)
        } else if let fontWeight = fontWeight {
            weightOfFont = fontWeight
        }

        switch self {
            
        case .system:
            return ""
        case .jakarta:
            return "PlusJakartaSans" + getWeight(weightOfFont)
        case .lexend:
            return "Lexend" + getWeight(weightOfFont)
        case .gilroy:
            return "Lexend" + getWeight(weightOfFont)
        case .cera:
            return "Lexend" + getWeight(weightOfFont)
        case .poppins:
            return "Lexend" + getWeight(weightOfFont)
        case .jameelNooriNastaleeq:
            return "Lexend" + getWeight(weightOfFont)
        }
    }
    
    static func fromRawValue(_ value: Int) -> Font.Weight {
        let normalizedValue = max(100, min(value, 900)) // Clamp between 100-900
        
        switch normalizedValue {
        case 100..<200: return .ultraLight
        case 200..<300: return .thin
        case 300..<400: return .light
        case 400..<500: return .regular
        case 500..<600: return .medium
        case 600..<700: return .semibold
        case 700..<800: return .bold
        case 800..<900: return .heavy
        case 900:       return .black
        default:        return .regular // Fallback (shouldn't happen due to clamping)
        }
    }
    
    private static func getWeight(_ fontWeight: Font.Weight) -> String {
        
        switch fontWeight {
            
        case .ultraLight:
            return "-Thin"
            
        case .thin:
            return "-ExtraLight"
            
        case .light:
            return "-Light"
            
        case .regular:
            return "-Regular"
            
        case .medium:
            return "-Medium"
            
        case .semibold:
            return "-SemiBold"
            
        case .bold:
            return "-Bold"
            
        case .heavy:
            return "-ExtraBold"
            
        case .black:
            return "-Black"
            
        default:
            return "-Regular"
        }
    }
}
