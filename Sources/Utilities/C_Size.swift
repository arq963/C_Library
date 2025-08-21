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
    public static var paddingHorizontal: CGFloat {
        switch UIDevice.current.userInterfaceIdiom {
        case .unspecified:
            return 0
        case .phone:
            return 20
        case .pad:
            return 20
        case .tv:
            return 20
        case .carPlay:
            return 20
        case .mac:
            return 20
        case .vision:
            return 20
        @unknown default:
            return 20
        }
    }
    
    @MainActor
    public var isLandscape: Bool = UIDevice.current.orientation.isLandscape
    
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
    
    public static let listPaddingTopSectionToSection: CGFloat = 35
    public static let listHeightCell: CGFloat = 44
    public static let listPaddingLeadingImage: CGFloat = 20
    public static let listPaddingTrailingImage: CGFloat = 15
    public static let listPaddingLeadingDivider: CGFloat = imageNormal + listPaddingLeadingImage + listPaddingTrailingImage
    public static let listWidthIconNavigation: CGFloat = 13.5
    
    public static let cornerRadius: CGFloat = 10
    
    // Recommended Min = 44
    // Recommended Max = 50
    
    public static let button_minimumSize: CGFloat = 46
    public static let height_textField: CGFloat = 47
    
    public static let m_appMaxWidth: CGFloat = 550 + 200
    public static let m_appMaxHeight: CGFloat = 640 + 65
    
    private var cancellable: AnyCancellable?

    public static let p_vpnContentWidth: CGFloat = 500
    public static let p_onBoardingContentWidth: CGFloat = 400
    
    public static let i_buttonWidth: CGFloat = 318
    
    public static let width_textField: CGFloat = 318
    
    public static let m_inputViewWidth: CGFloat = 450
    public static let m_ButtonWidth: CGFloat = 330

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
