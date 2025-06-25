//
//  CustomColors.swift
//  SecureConnect
//
//  Created by Ali ur Rahman Qureshi on 04/09/2020.
//

import Foundation
import SwiftUI
import Combine
#if os(macOS)
import AppKit
public typealias NativeColor = NSColor
#else
import UIKit
public typealias NativeColor = UIColor
#endif

public enum C_Color {
    
    case backgroundPrimary, backgroundSecondary,
         appBlue, appYellow,
         darkBlue0, darkBlue1, lightBlue, darkBlueStartingColor,
         textPrimary, textSecondary, textPlaceholder, textSectionHeader,
         green, statusGreen,
         red, red1, yellow,
         errorOrange, orange,
         black, darkGray, gray, lightGray, veryLightGray, systemGray, darkScreen,
         white, whiteDisabled, whiteEnabled, offWhite,
         outline, inputBackGroundLight, inputBackgroundDark, circleInline, grayProgressBar, grayImage, buttonSelected,
         clear
    
    public var rawValue: Color {
        
        switch self {
            
        case .backgroundPrimary:        return Color("backgroundPrimary")
        case .backgroundSecondary:      return Color("backgroundSecondary")
            
        case .textPrimary:              return Color("textPrimary")
        case .textSecondary:            return Color("textSecondary")
        case .textPlaceholder:          return Color("textPlaceholder")
        case .textSectionHeader:        return Color("textSectionHeader")
            
        case .darkBlue0:                return getColor(red: 3,   green: 25,  blue: 50)
        case .darkBlue1:                return getColor(red: 23,  green: 51,  blue: 113)
        case .darkBlueStartingColor:    return getColor(red: 8,   green: 19,  blue: 47)
        case .lightBlue:                return getColor(red: 204, green: 206, blue: 230)
            
        case .appYellow:                return getColor(red: 255, green: 188, blue: 45)
        case .appBlue:                  return getColor(red: 23,  green: 51,  blue: 113)        
        
        case .black:                    return getColor(red: 0,   green: 0,   blue: 0)
        case .darkGray:                 return getColor(red: 51,  green: 51,  blue: 51)
        case .gray:                     return getColor(red: 77,  green: 77,  blue: 77)
        case .systemGray:               return Color.gray
        case .lightGray:                return getColor(red: 102, green: 102, blue: 102)
        case .veryLightGray:            return getColor(red: 200, green: 200, blue: 200)
        case .grayProgressBar:          return getColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        case .grayImage:                return getColor(red: 102, green: 102, blue: 102)
        
        case .white:                    return getColor(red: 255, green: 255, blue: 255)
        case .whiteDisabled:            return getColor(red: 255, green: 255, blue: 255, alpha: 0.6)
        case .whiteEnabled:             return getColor(red: 255, green: 255, blue: 255)
        case .offWhite:                 return getColor(red: 228, green: 227, blue: 232)
            
        case .red:                      return getColor(red: 255, green: 0,   blue: 0)
        case .red1:                     return getColor(red: 200, green: 40,  blue: 40)
            
        case .orange:                   return getColor(red: 255, green: 149, blue: 0)
        case .errorOrange:              return getColor(red: 205, green: 61, blue: 80)
            
        case .yellow:                   return getColor(red: 255, green: 255, blue: 0)
            
        case .green:                    return getColor(red: 0,   green: 255, blue: 0)
        case .statusGreen:              return getColor(red: 7, green: 153, blue: 109)
            
        case .clear:                    return Color.clear
            
        case .darkScreen:               return getColor(red: 0, green: 0, blue: 0, alpha: 0.15)
        case .inputBackGroundLight:     return getColor(red: 255, green: 255, blue: 255)
        case .inputBackgroundDark:      return getColor(red: 228, green: 227, blue: 232)
        
        case .circleInline:             return getColor(red: 230, green: 230, blue: 230)
        
        case .buttonSelected:            return getColor(red: 255, green: 255, blue: 255)
        case .outline:                  return getColor(red: 217, green: 217, blue: 217)
        }
    }
    
    public var uiColor: NativeColor {
        return NativeColor(self.rawValue)
    }

    public var gradientDarkToLight: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [C_Color.backgroundSecondary.rawValue,
                                                          C_Color.backgroundSecondary.rawValue,
                                                          C_Color.backgroundPrimary.rawValue]),
                              startPoint: .top,
                              endPoint: .bottom)
    }
    
    public var gradientLightDarkLight: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [C_Color.backgroundPrimary.rawValue,
                                                          C_Color.backgroundSecondary.rawValue,
                                                          C_Color.backgroundSecondary.rawValue,
                                                          C_Color.backgroundPrimary.rawValue]),
                              startPoint: .top,
                              endPoint: .bottom)
    }
    
    public var gradientLightToDark: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [C_Color.backgroundPrimary.rawValue,
                                                          C_Color.backgroundSecondary.rawValue]),
                              startPoint: .top,
                              endPoint: .bottom)
    }
    
    public func getColor(red: Int, green: Int, blue: Int, alpha: Double = 1.0) -> Color {
        
        return Color.init(
            red: Double(red)/255,
            green: Double(green)/255,
            blue: Double(blue)/255,
            opacity: alpha)
    }
    
    public func getColor(red: Int, green: Int, blue: Int, alpha: Double = 1.0) -> NativeColor {
        
        return NativeColor.init(
            red: Double(red)/255,
            green: Double(green)/255,
            blue: Double(blue)/255,
            alpha: alpha)
    }
}
