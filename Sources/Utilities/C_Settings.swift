//
//  CustomSettings.swift
//  SecureConnect
//
//  Created by Ali ur Rahman Qureshi on 27/10/2020.
//

import SwiftUI

final class C_Settings: ObservableObject {
    
    
    static let maxWidth = 500
    static let maxHeight = 500
    
    
    static func GetWidthSize(width: Float) -> CGFloat {
#if os(iOS)
        return (CGFloat(width) / 100) * UIScreen.main.bounds.width
#elseif os(macOS)
        return 500
#endif
    }
    
    static func GetHeightSize(height: Float) -> CGFloat {
#if os(iOS)
        return (CGFloat(height) / 100) * UIScreen.main.bounds.height
#elseif os(macOS)
        return 500
#endif
    }    
}

