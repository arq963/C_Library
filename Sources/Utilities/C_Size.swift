//
//  C_Size.swift
//  Essentials
//
//  Created by ARahmanQ on 5/23/24.
//

import Foundation
import Combine

public final class C_Size: ObservableObject {
    
    static let shared = C_Size()
    
    static let imageExtraLarge: CGFloat = 74
    static let imageLarge: CGFloat = 60
    static let imageNormal: CGFloat = 29
    static let imageSmall: CGFloat = 20
    
    static var paddingHorizontal: CGFloat {
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
    
    static let listPaddingLeadingSectionHeader: CGFloat = 10
    static let listPaddingTopSectionToSection: CGFloat = 35
    static let listHeightCell: CGFloat = 44
    static let listPaddingLeadingContent: CGFloat = 20
    static let listPaddingLeadingImage: CGFloat = 20
    static let listPaddingTrailingImage: CGFloat = 15
    static let listPaddingLeadingDivider: CGFloat = imageNormal + listPaddingLeadingImage + listPaddingTrailingImage
    static let listPaddingTrailingNavigationIcon: CGFloat = 20
    static let listWidthIconNavigation: CGFloat = 13.5
    static let listHeightIconNavigation: CGFloat = 13.5
    
    static let cornerRadius: CGFloat = 10
    
    // Min Recommended = 44
    // Max Recommended = 50
    static let button_minimumSize: CGFloat = 46
    
    static let p_vpnContentWidth: CGFloat = 500
    static let p_onBoardingContentWidth: CGFloat = 400
    
    static let width_textField: CGFloat = 318
    static let height_textField: CGFloat = 40
    
    static let m_appMaxWidth: CGFloat = 550
    static let m_appMaxHeight: CGFloat = 640
    
    static let m_navigationWindowWidth: CGFloat = 190
    static let m_navigationWindowHeight: CGFloat = 640
    
    static let m_detailWindowWidth: CGFloat = m_appMaxWidth - m_navigationWindowWidth
    static let m_detailWindowHeight: CGFloat = 640
    
    static let m_inputViewWidth: CGFloat = 350
    
    static let m_ButtonWidth: CGFloat = 330
}
