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

extension Color {
    static public let backgroundPrimary: Color = Color("backgroundPrimary")
    static public let backgroundSecondary: Color = Color("backgroundSecondary")
    static public let textPrimary: Color = Color("textPrimary")
    static public let textSecondary: Color = Color("textSecondary")
    static public let appAccent: Color = Color("appAccent")
    static public let appYellow: Color = Color("appYellow")
    static public let textPlaceholder: Color = Color("textPlaceholder")
    static public let textSectionHeader: Color = Color("textSectionHeader")
}

public enum C_Color {
    
         case appBlue, appYellow, appAccent, appAccentReversed,
         textPrimary, textSecondary, textTertiary, textPlaceholder, textSectionHeader
    
    public var rawValue: Color {
        
        switch self {
            
        case .textPrimary:              return Color("textPrimary")
        case .textSecondary:            return Color("textSecondary")
        case .textTertiary:             return Color("textTertiary")
        case .textPlaceholder:          return Color("textPlaceholder")
        case .textSectionHeader:        return Color("textSectionHeader")
        case .appAccent:                return Color("appAccent")
        case .appAccentReversed:        return Color("appAccentReversed")            
        case .appYellow:                return Color("appYellow")
        case .appBlue:                  return Color("appBlue")

        default: return getColor(red: 228, green: 227, blue: 232)
        }
    }

    public static func gradientDarkToLight() -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color.backgroundSecondary,
                                                          Color.backgroundSecondary,
                                                          Color.backgroundPrimary]),
                              startPoint: .top,
                              endPoint: .bottom)
    }
    
    public static func gradientLightDarkLight() -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color.backgroundPrimary,
                                                          Color.backgroundSecondary,
                                                          Color.backgroundSecondary,
                                                          Color.backgroundPrimary]),
                              startPoint: .top,
                              endPoint: .bottom)
    }
    
    public static func gradientLightToDark() -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color.backgroundPrimary,
                                                          Color.backgroundSecondary]),
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
    
#if os(macOS)
    public static let m_background = VisualEffectView()
#else
    public static let m_background = Color.clear
#endif
    
}

#if os(macOS)
public struct VisualEffectView: NSViewRepresentable {
    
    public func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()

        view.blendingMode = .behindWindow
        view.state = .active
        view.material = .underWindowBackground
        
        return view
    }

    public func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        //
    }    
}
#endif
