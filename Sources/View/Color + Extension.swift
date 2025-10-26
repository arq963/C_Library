//
//  File.swift
//  C_Library
//
//  Created by ARahmanQ on 10/10/25.
//

import Foundation
import SwiftUI
#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

#if os(iOS)
public typealias CPlatformColor = UIColor
#elseif os(macOS)
public typealias CPlatformColor = NSColor
#endif

public extension Color {
    /// Returns the RGB components (0...1 range) of a platform color if available
    static func getValues(for color: CPlatformColor) -> RGBValues? {
#if os(iOS)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        guard color.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }
        return RGBValues(red: red, green: green, blue: blue)
#elseif os(macOS)
        // Ensure the color is in the device RGB color space
        guard let converted = color.usingColorSpace(.deviceRGB) else { return nil }
        return RGBValues(red: converted.redComponent,
                         green: converted.greenComponent,
                         blue: converted.blueComponent)
#endif
    }
}

public struct RGBValues {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    
    static func getColor(value: RGBValues) -> Color {
        Color(red: value.red, green: value.green, blue: value.blue)
    }
}
