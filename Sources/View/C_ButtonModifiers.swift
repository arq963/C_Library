//
//  File.swift
//  C_Library
//
//  Created by ARahmanQ on 10/11/25.
//

import Foundation
import SwiftUI

// MARK: - Cross-platform Glass Effect Modifier
public struct C_ModifierGlassEffect: ViewModifier {
    
    public func body(content: Content) -> some View {
#if os(iOS)
        if #available(iOS 26.0, *) {
            content.glassEffect()
        } else {
            content.background(.regularMaterial)
        }
#elseif os(macOS)
        if #available(macOS 26.0, *) {
            content.glassEffect()
        } else {
            // Emulate glass with material on older macOS
            content.background(.regularMaterial)
        }
#else
        // Default fallback for other platforms
        content.background(.regularMaterial)
#endif
    }
}

// MARK: - Cross-platform Capsule Border Shape Modifier
public struct C_ModifierCapsuleBorder: ViewModifier {
    public func body(content: Content) -> some View {
#if os(iOS)
        if #available(iOS 26.0, *) {
            content.buttonBorderShape(.capsule)
        } else {
            content.clipShape(Capsule())
        }
#elseif os(macOS)
        if #available(macOS 14.0, *) {
            // `.buttonBorderShape(.capsule)` available
            content.buttonBorderShape(.capsule)
        } else {
            content.clipShape(Capsule())
        }
#else
        content.clipShape(Capsule())
#endif
    }
}
