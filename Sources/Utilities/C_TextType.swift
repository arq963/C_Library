//
//  C_Themes.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 2/12/25.
//

import Foundation
import SwiftUI

/*
 Font Style         Size    Weight
 extraLargeTitle2    38     Bold
 extraLargeTitle     34     Bold
 largeTitle          34     Regular
 title               28     Regular
 title2              22     Regular
 title3              20     Regular
 headline            17     Semibold
 subheadline         15     Regular
 body                17     Regular
 callout             16     Regular
 caption             12     Regular
 caption2            11     Regular
 footnote            13     Regular
 
 case .title:                return 24
 case .heading:              return 20
 case .subHeading:           return 17
 case .labelTextPrimary:     return 17
 case .labelTextSecondary:   return 17
 case .labelTextPlaceholder: return 17
 case .themeButton:          return 17
 case .body:                 return 15
 case .sectionHeader:        return 14
 case .callout:              return 14
 case .caption:              return 12
 */

public enum C_TextType {
    
    case title
    case heading
    case subHeading
    case labelTextPrimary
    case labelTextSecondary
    case labelTextPlaceholder
    case sectionHeader
    case themeButton
    case body
    case callout
    case caption
    
    public var fontSize: CGFloat {
        switch self {
        case .title:                return 24
        case .heading:              return 20
        case .subHeading:           return 17
        case .labelTextPrimary:     return 17
        case .labelTextSecondary:   return 17
        case .labelTextPlaceholder: return 17
        case .themeButton:          return 17
        case .body:                 return 15
        case .sectionHeader:        return 14
        case .callout:              return 14
        case .caption:              return 12
        }
    }
    
    public var fontWeight: Font.Weight {
        switch self {
        case .title:                return .black
        case .heading:              return .bold
        case .subHeading:           return .semibold
        case .labelTextPrimary:     return .regular
        case .labelTextSecondary:   return .regular
        case .labelTextPlaceholder: return .regular
        case .sectionHeader:        return .regular
        case .themeButton:          return .semibold
        case .body:                 return .regular
        case .callout:              return .regular
        case .caption:              return .regular
        }
    }
    
    public var color: Color {
        switch self {
        case .title:                return .appYellow
        case .heading:              return .textPrimary
        case .subHeading:           return .textPrimary
        case .labelTextPrimary:     return .textPrimary
        case .labelTextSecondary:   return .textSecondary
        case .labelTextPlaceholder: return .textPlaceholder
        case .sectionHeader:        return .textSectionHeader
        case .themeButton:          return .appYellow
        case .body:                 return .textPrimary
        case .callout:              return .textSecondary
        case .caption:              return .textSecondary
        }
    }
    
    public var fontName: C_FontName {
        switch self {
        case .title:                return .system
        case .heading:              return .system
        case .subHeading:           return .system
        case .labelTextPrimary:     return .system
        case .labelTextSecondary:   return .system
        case .labelTextPlaceholder: return .system
        case .sectionHeader:        return .system
        case .themeButton:          return .system
        case .body:                 return .system
        case .callout:              return .system
        case .caption:              return .system
        }
    }
    
    public var alignment: Alignment {
        switch self {
        case .title:                return .center
        case .heading:              return .leading
        case .subHeading:           return .leading
        case .labelTextPrimary:     return .leading
        case .labelTextSecondary:   return .leading
        case .labelTextPlaceholder: return .leading
        case .sectionHeader:        return .leading
        case .themeButton:          return .leading
        case .body:                 return .leading
        case .callout:              return .leading
        case .caption:              return .leading
        }
    }
}
