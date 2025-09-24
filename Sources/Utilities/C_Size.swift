//
//  C_Size.swift
//  Essentials
//
//  Created by ARahmanQ on 5/23/24.
//

import Foundation
import Combine
#if os(iOS)
import UIKit
#endif

public final class C_Size: ObservableObject {
    
    @MainActor public static let shared = C_Size()
    
    public static let imageExtraLarge: CGFloat = 74
    public static let imageLarge: CGFloat = 60
    public static let imageNormal: CGFloat = 29
    public static let imageSmall: CGFloat = 20
    
#if os(iOS)
    
    @MainActor
    public var p_innerViewWidth: CGFloat {
        if isLandscape {
            return 650 - 80
        } else {
            return 650
        }
    }
    
    @MainActor
    public var p_innerViewHeight: CGFloat {
        if isLandscape {
            return 950 - 117
        } else {
            return 950
        }
    }
    
    @MainActor
    public static let i_appMaxWidth: CGFloat = UIScreen.main.bounds.width
    
#endif
    
    // Recommended Min = 44
    // Recommended Max = 50
    
    @MainActor
    public static var button_minimumSize: CGFloat {
        
        switch UIDevice.current.userInterfaceIdiom {
        case .unspecified:
            return 46
        case .phone:
            return 46
        case .pad:
            return 50
        case .tv:
            return 46
        case .carPlay:
            return 46
        case .mac:
            return 46
        case .vision:
            return 46
        @unknown default:
            return 46
        }
    }
    
    public static let listWidthIconNavigation: CGFloat = 13.5
    public static let listHeightCell: CGFloat = 44
    
    public static let cornerRadius: CGFloat = 10

    public static let height_textField: CGFloat = 47
    
    public static let m_appMaxWidth: CGFloat = 550 + 200
    public static let m_appMaxHeight: CGFloat = 640 + 65

    public static let p_vpnContentWidth: CGFloat = 500
    public static let p_onBoardingContentWidth: CGFloat = 400
    
    public static let i_buttonWidth: CGFloat = 318
    
    public static let inputFieldMaxWidth: CGFloat = 450
    public static let maximumContentWidth: CGFloat = 600
    public static let m_ButtonWidth: CGFloat = 330
    public static let textFieldHeight: CGFloat = 47
    
    private var cancellable: AnyCancellable?
    
    @MainActor
    private var isLandscape: Bool = UIDevice.current.orientation.isLandscape
    
    @MainActor
    init() {
        #if os(iOS)
        cancellable = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .compactMap { notification in
                UIDevice.current.orientation.isLandscape
            }
            .assign(to: \.isLandscape, on: self)
        #endif
    }
}
