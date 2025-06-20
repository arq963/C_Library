//
//  C_ImageName.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 10/14/24.
//

import Foundation

enum C_ImageName: String {
    
    case passwordManager        = "passwordManager"
    
    case networkTraffic         = "total_network_traffic"
    case notesManager           = "NotesManager"
    
    case launchScreenImage      = "LaunchScreenImage"
    
    case firewallBackgroundEnabled  = "firewallBackground_enabled"
    case firewallBackgroundDisabled = "firewallBackground_disabled"
    
    case powerImage = "powerImage"
    
    case notificationsIcon = "Notification_yellow"
    case passwordSettings = "PM_settingsIcon"
    
    case subscriptions = "subscriptions"
    case shareApp = "share_icon"
    case rateUs = "rateUsTabBar_selected"
    
    case legal = "legal_icon"
    case privacyPolicy = "privacypolicy_icon"
    case learnMore = "learnmore_icon"
    
    case pligenceLogo = "poweredBy"
    case blockedSites = "blocked_sites"
    
    // MARK: - Notifications Icons
    
    case notifications              = "notifications_icon"
    case notificationIcon           = "notification_icon"
    case goToUrl                    = "gotourl"
    
    // MARK: - Tab Bar Icons
    
    case tabbarFirewall             = "home"
    case tabbarFirewall_selected    = "home_selected"
    
    case tabbarPasswordManager_selected = "passwords_icon_selected"
    case tabbarPasswordManager      = "passwords_icon"
    
    case tabbarNews                 = "news_icon"
    case tabbarNews_selected        = "news_icon_selected"
    
    case tabbarNotes                = "secure_notes_icon"
    case tabbarNotes_selected       = "secure_notes_icon_selected"
    
    case tabbarSettings             = "settings"
    case tabbarSettings_selected    = "settings_selected"
    
    // MARK: - Firewall View
    
    case firewall               = "firewall"
    case firewallBackground     = "firewallBackground"
    
    case firewallPartial0       = "firewallPartial0"
    case firewallPartial0Dark   = "firewallPartial0Dark"
    
    case firewallPartial1       = "firewallPartial1"
    case firewallPartial1Dark   = "firewallPartial1Dark"
    
    case firewallPartial2       = "firewallPartial2"
    
    case firewallElipseOn       = "firewallElipseOn"
    case firewallElipseOff      = "firewallElipseOff"
    
    case urlAllowed             = "url_allowed"
    case urlBlocked             = "url_blocked"
    
    case userDefinedBlocklist   = "userBlockedListImage"
    case userDefinedWhitelist   = "userWhiteListImage"
    
    case malicious              = "malicious_traffic_on"
    case phishing               = "phishing_icon"
    
    case webguard_on            = "webguard_on"
    case webguard_off           = "webguard_off"
    
    case privacy_on             = "privacy_on"
    case privacy_off            = "privacy_off"
    
    case adult_on               = "adult_on"
    case adult_off              = "adult_off"
    
    case ads_on                 = "ads_on_new"
    case ads_off                = "ads_off"
    
    // MARK: - Webguard

    case webguardOnBoardingMain0 = "webguardOnBoardingMain0"
    case webguardOnBoardingMain1 = "webguardOnBoardingMain1"
    case webguardOnBoardingMain2 = "webguardOnBoardingMain2"

    case webguardOnBoardingSub0 = "icon_settings"
    case webguardOnBoardingSub1 = "icon_safari"
    case webguardOnBoardingSub2 = "icon_pligence"
    
    // MARK: - On Boarding Images
    
    case onBoardingFirewallImage = "screenImage"
    case onBoardingPasswordImage = "screenImage1"
    case onBoardingAutoMagic     = "autoMagicImag"
    
    // MARK: - Passwords Images
    
    case emptyPasswordImage     = "emptyPasswordImage"
    
    // MARK: - Notes Images
    
    case notesGeneric            = "gnericNotes"
    case notesBankAccount        = "bankAccount"
    case notesCreditCard         = "creditCard"
    case notesDriverLicense      = "driverLicense"
    case notesEmailAccount       = "emailAccount"
    case notesHealthInsurance    = "healthInsurance"
    case notesInsurance          = "insurance"
    case notesMembmership        = "membership"
    case notesSocialSecurity     = "socialSecurity"
    case notesWifi               = "wifiPassword"
    
    // MARK: - Settings
    
    case updateMasterPassword   = "updateMasterPassword"
    case deleteAllPasswords     = "deleteAllPasswords"
    case deleteAllNotes         = "deleteAllNotes"
    case resetAll               = "resetAll"
    
    case deleteDataIcon         = "deleteDataIcon"
    case dataLostImage          = "dataLostImage"
    
    case confirmPasswordIcon    = "confirmPasswordIcon"
    case safariYellowIcon       = "icon_safariYellow"
    
    case telephone              = "telephone"
    
    // MARK: - System Images
    
    case chevronUp              = "chevron.up"
    case chevronDown            = "chevron.down"
    case chevronLeft            = "chevron.left"
    case chevronRight           = "chevron.right"
    
    case personIcon             = "person.circle.fill"
    case copyIcon               = "square.on.square"
    
    case heart                  = "heart"
    case heartFilled            = "heart.fill"
    
    case leftArrow              = "arrow.left"
    
    case s_deleteIcon           = "trash"
    
    case s_paperclip            = "paperclip"
    case s_plus                 = "plus"
    case s_cancelImage          = "x.circle.fill"
    
    var type: ImageType {
        switch self {
        case .chevronUp, .chevronDown, .chevronLeft, .chevronRight, .leftArrow, .personIcon, .copyIcon, .heart, .heartFilled, .s_deleteIcon, .s_paperclip, .s_plus, .s_cancelImage:
            return .systemImage
        default: return .resourceImage
        }
    }
    
    var displayString: String {
        switch self {
            
        case .updateMasterPassword:
            return ""
        case .deleteAllPasswords:
            return ""
        case .deleteAllNotes:
            return ""
        case .resetAll:
            return ""
        case .deleteDataIcon:
            return ""
        case .dataLostImage:
            return ""
        case .confirmPasswordIcon:
            return ""
        case .passwordManager:
            return ""
        case .malicious:
            return ""
        case .phishing:
            return ""
        case .networkTraffic:
            return ""
        case .notesManager:
            return ""
        case .launchScreenImage:
            return ""
        case .firewallBackgroundEnabled:
            return ""
        case .firewallBackgroundDisabled:
            return ""
        case .powerImage:
            return ""
        case .webguard_on:
            return ""
        case .webguard_off:
            return ""
        case .privacy_on:
            return ""
        case .privacy_off:
            return ""
        case .adult_on:
            return ""
        case .adult_off:
            return ""
        case .ads_on:
            return ""
        case .ads_off:
            return ""
        case .notificationsIcon:
            return ""
        case .passwordSettings:
            return ""
        case .subscriptions:
            return ""
        case .shareApp:
            return ""
        case .rateUs:
            return ""
        case .legal:
            return ""
        case .privacyPolicy:
            return ""
        case .learnMore:
            return ""
        case .pligenceLogo:
            return ""
        case .blockedSites:
            return ""
        case .notifications:
            return ""
        case .notificationIcon:
            return ""
        case .goToUrl:
            return ""
        case .safariYellowIcon:
            return ""
        case .tabbarFirewall:
            return ""
        case .tabbarFirewall_selected:
            return ""
        case .tabbarPasswordManager_selected:
            return ""
        case .tabbarPasswordManager:
            return ""
        case .tabbarNews:
            return ""
        case .tabbarNews_selected:
            return ""
        case .tabbarNotes:
            return ""
        case .tabbarNotes_selected:
            return ""
        case .tabbarSettings:
            return ""
        case .tabbarSettings_selected:
            return ""
        case .firewall:
            return ""
        case .firewallBackground:
            return ""
        case .firewallPartial0:
            return ""
        case .firewallPartial1:
            return ""
        case .firewallPartial2:
            return ""
        case .firewallElipseOn:
            return ""
        case .firewallElipseOff:
            return ""
        case .urlAllowed:
            return ""
        case .urlBlocked:
            return ""
        case .userDefinedBlocklist:
            return ""
        case .userDefinedWhitelist:
            return ""
        case .webguardOnBoardingMain0:
            return ""
        case .webguardOnBoardingMain1:
            return ""
        case .webguardOnBoardingMain2:
            return ""
        case .webguardOnBoardingSub0:
            return ""
        case .webguardOnBoardingSub1:
            return ""
        case .webguardOnBoardingSub2:
            return ""
        case .onBoardingFirewallImage:
            return ""
        case .onBoardingPasswordImage:
            return ""
        case .onBoardingAutoMagic:
            return ""
        case .emptyPasswordImage:
            return ""
        case .notesGeneric:
            return "Generic"
        case .notesBankAccount:
            return "Bank Account"
        case .notesCreditCard:
            return "Credit Card"
        case .notesDriverLicense:
            return "Driver's License"
        case .notesEmailAccount:
            return "Email Account"
        case .notesHealthInsurance:
            return "Health Insurance"
        case .notesInsurance:
            return "Insurance"
        case .notesMembmership:
            return "Membership"
        case .notesSocialSecurity:
            return "Social Security"
        case .notesWifi:
            return "Wifi Password"
        case .chevronUp:
            return ""
        case .chevronDown:
            return ""
        case .chevronLeft:
            return ""
        case .chevronRight:
            return ""
        case .personIcon:
            return ""
        case .copyIcon:
            return ""
        case .heart:
            return ""
        case .heartFilled:
            return ""
        case .leftArrow:
            return ""
        case .s_deleteIcon:
            return ""
            
        default: return ""
        }
    }
}

enum ImageType {
    case resourceImage
    case systemImage
}
