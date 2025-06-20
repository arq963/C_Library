//
//  CustomColors.swift
//  SecureConnect
//
//  Created by Ali ur Rahman Qureshi on 04/09/2020.
//

import Foundation
import SwiftUI
import Combine

public enum C_Color {
    
    case backgroundPrimary, backgroundSecondary,
         darkBlue0, darkBlue1, lightBlue, darkBlueStartingColor,
         textPrimary, textSecondary, textPlaceholder, textSectionHeader,
         appYellow, appBlue, green,
         red, red1, orange, yellow,
         black, darkGray, gray, lightGray, veryLightGray,
         systemGray,
         white,
         whiteDisabled, whiteEnabled,
         outline,
         clear
    
    var rawValue: Color {
        
        switch self {
        case .backgroundPrimary:        return Color(.backgroundPrimary)
        case .backgroundSecondary:      return Color(.backgroundSecondary)
        case .textPrimary:              return Color(.textPrimary)
        case .textSecondary:            return Color(.textSecondary)
        case .textPlaceholder:          return Color(.textPlaceholder)
        case .textSectionHeader:        return Color(.textSectionHeader)
        case .darkBlue0:                return getColor(red: 3,   green: 25,  blue: 50)
        case .darkBlue1:                return getColor(red: 23,  green: 51,  blue: 113)
        case .darkBlueStartingColor:    return getColor(red: 8,   green: 19,  blue: 47)
        case .lightBlue:                return getColor(red: 204, green: 206, blue: 230)
        case .appYellow:                return getColor(red: 255, green: 188, blue: 45)
        case .appBlue:                  return getColor(red: 23,  green: 51,  blue: 113)        
        case .black:                    return getColor(red: 0,   green: 0,   blue: 0)
        case .white:                    return getColor(red: 255, green: 255, blue: 255)
        case .darkGray:                 return getColor(red: 51,  green: 51,  blue: 51)
        case .gray:                     return getColor(red: 77,  green: 77,  blue: 77)
        case .systemGray:               return Color.gray
        case .lightGray:                return getColor(red: 102, green: 102, blue: 102)
        case .veryLightGray:            return getColor(red: 200, green: 200, blue: 200)
        case .outline:                  return getColor(red: 217, green: 217, blue: 217)
        case .whiteDisabled:            return getColor(red: 255, green: 255, blue: 255, alpha: 0.6)
        case .whiteEnabled:             return getColor(red: 255, green: 255, blue: 255)
        case .red:                      return getColor(red: 255, green: 0,   blue: 0)
        case .red1:                     return getColor(red: 200, green: 40,  blue: 40)
        case .orange:                   return getColor(red: 255, green: 149, blue: 0)
        case .yellow:                   return getColor(red: 255, green: 255, blue: 0)
        case .green:                    return getColor(red: 0,   green: 255, blue: 0)
        case .clear:                    return Color.clear
        }
    }
    
    var uiColor: UIColor {
        switch self {
        case .backgroundPrimary:        return UIColor(resource: .backgroundPrimary)
        case .backgroundSecondary:      return UIColor(resource: .backgroundSecondary)
        case .textPrimary:              return UIColor(resource: .textPrimary)
        case .textSecondary:            return UIColor(resource: .textSecondary)
        case .textPlaceholder:          return UIColor(resource: .textPlaceholder)
        case .textSectionHeader:        return UIColor(resource: .textSectionHeader)
        case .darkBlue0:                return getColor(red: 3,   green: 25,  blue: 50)
        case .darkBlue1:                return getColor(red: 23,  green: 51,  blue: 113)
        case .darkBlueStartingColor:    return getColor(red: 8,  green: 19,  blue: 47)
        case .lightBlue:                return getColor(red: 204, green: 206, blue: 230)
        case .appYellow:                return getColor(red: 255, green: 188, blue: 45)
        case .appBlue:                  return getColor(red: 23,  green: 51,  blue: 113)
        case .black:                    return getColor(red: 0,   green: 0,   blue: 0)
        case .white:                    return getColor(red: 255, green: 255, blue: 255)
        case .darkGray:                 return getColor(red: 51,  green: 51,  blue: 51)
        case .gray:                     return getColor(red: 77,  green: 77,  blue: 77)
        case .systemGray:               return UIColor.gray
        case .lightGray:                return getColor(red: 102, green: 102, blue: 102)
        case .veryLightGray:            return getColor(red: 200, green: 200, blue: 200)
        case .outline:                  return getColor(red: 217, green: 217, blue: 217)
        case .whiteDisabled:            return getColor(red: 255, green: 255, blue: 255, alpha: 0.6)
        case .whiteEnabled:             return getColor(red: 255, green: 255, blue: 255)
        case .red:                      return getColor(red: 255, green: 0,   blue: 0)
        case .red1:                     return getColor(red: 220, green: 20,  blue: 20)
        case .orange:                   return getColor(red: 255, green: 149, blue: 0)
        case .yellow:                   return getColor(red: 255, green: 255, blue: 0)
        case .green:                    return getColor(red: 0,   green: 255, blue: 0)
        case .clear:                    return UIColor.clear
        }
    }
    
    var gradientDarkToLight: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [C_Color.backgroundSecondary.rawValue,
                                                          C_Color.backgroundSecondary.rawValue,
                                                          C_Color.backgroundPrimary.rawValue]),
                              startPoint: .top,
                              endPoint: .bottom)
    }
    
    var gradientLightDarkLight: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [C_Color.backgroundPrimary.rawValue,
                                                          C_Color.backgroundSecondary.rawValue,
                                                          C_Color.backgroundSecondary.rawValue,
                                                          C_Color.backgroundPrimary.rawValue]),
                              startPoint: .top,
                              endPoint: .bottom)
    }
    
    var gradientLightToDark: LinearGradient {
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
    
    public func getColor(red: Int, green: Int, blue: Int, alpha: Double = 1.0) -> UIColor {
        
        return UIColor.init(
            red: Double(red)/255,
            green: Double(green)/255,
            blue: Double(blue)/255,
            alpha: alpha)
    }
}
