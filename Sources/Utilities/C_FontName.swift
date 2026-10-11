//
//  C_FontName.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 2/13/25.
//

import Foundation
import SwiftUI
import CoreText

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
    
    // MARK: - Public Properties
    
    /// Call once during app launch
    public static func registerFonts() {
        registerFonts(ext: "otf")
        registerFonts(ext: "ttf")
    }
    
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
            
        case .gilroy:
            switch fontWeight {
            case .ultraLight:   return "Gilroy-UltraLight"
            case .thin:         return "Gilroy-Thin"
            case .light:        return "Gilroy-Light"
            case .regular:      return "Gilroy-Regular"
            case .medium:       return "Gilroy-Medium"
            case .semibold:     return "Gilroy-SemiBold"
            case .heavy:        return "Gilroy-Heavy"
            case .bold:         return "Gilroy-Bold"
            case .black:        return "Gilroy-Black"
            default:            return "Font: No Font Found"
            }
            
        case .cera:
            switch fontWeight {
            case .ultraLight:   return "CeraPro-Light"
            case .thin:         return "CeraPro-Light"
            case .light:        return "CeraPro-Light"
            case .regular:      return "CeraPro-Regular"
            case .medium:       return "CeraPro-Medium"
            case .semibold:     return "CeraPro-Medium"
            case .heavy:        return "CeraPro-ExtraBold"
            case .bold:         return "CeraPro-Bold"
            case .black:        return "CeraPro-Black"
            default:            return "Font: No Font Found"
            }
            
        case .poppins:
            switch fontWeight {
            case .ultraLight:   return "Poppins-Thin"
            case .thin:         return "Poppins-Thin"
            case .light:        return "Poppins-Light"
            case .regular:      return "Poppins-Regular"
            case .medium:       return "Poppins-Medium"
            case .semibold:     return "Poppins-SemiBold"
            case .heavy:        return "Poppins-ExtraBold"
            case .bold:         return "Poppins-Bold"
            default:            return "Font: No Font Found"
            }
            
        case .jakarta:
            return ""
            
        case .lexend:
            return ""
            
        case .jameelNooriNastaleeq:
            return "Jameel Noori Nastaleeq"
        }
    }
    
    // MARK: - Private Properties
    
    private static func registerFonts(ext: String) {
        
        guard let urls = Bundle.module.urls(forResourcesWithExtension: ext,
                                            subdirectory: nil)
        else {
            return
        }
        
        if urls.isEmpty {
            print("Font: No fonts registered")
        } else {
            print("Font: \(urls.count) .\(ext) fonts registered")
            for url in urls {
                CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
            }
        }
    }
    
    
    private static func fromRawValue(_ value: Int) -> Font.Weight {
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
}

private final class FontRegistrarMarker {}
