//
//  ApiEndpoints.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 11/18/24.
//

import Foundation

public enum ApiEndpoints {
    
    case registerUser, checkOtpSubscriptionValidity, dnsValidation,
         firewallValidation, getOrganizationList, logEvent,
        postPurchaseReciept, getUserId, sendFeedback, verifyOtp, postFirebaseToken,
    webguardValidation, webguardWhiteBlackList, sendMobileNumberForOtp
         
    
    public var urlString: String {
        
        switch self {
        case .registerUser:
            return "/registration/"
        case .checkOtpSubscriptionValidity:
            return "/registration/subscription_status/"
        case .dnsValidation:
            return "/firewall/ml/"
        case .webguardValidation:
            return "/web-guard/v1/" //"/web-guard/ml_ios/"
        case .firewallValidation:
            return "/firewall/v1/"
        case .getOrganizationList:
            return "/registration/user_organization/"
        case .logEvent:
            return "/registration/firebase_post/"
        case .postPurchaseReciept:
            return "/subscription/apple_store/"
        case .getUserId:
            return "/stripe/get_unique_code/"
        case .sendFeedback:
            return "/firewall/rule/"
        case .verifyOtp:
            return "/registration/pda-otp-verification/"
        case .postFirebaseToken:
            return "/firebase_ios/"
        case .webguardWhiteBlackList:
            return "/web-guard/white_black_listing/"
        case .sendMobileNumberForOtp:
            return "/registration/verify_msisdn/"
        }
    }
    
    public var method: String {
        
        switch self {
            
        case .registerUser:
            return "POST"
        case .checkOtpSubscriptionValidity:
            return "GET"
        case .dnsValidation:
            return "POST"
        case .webguardValidation:
            return "POST"
        case .firewallValidation:
            return "POST"
        case .getOrganizationList:
            return "GET"
        case .logEvent:
            return "POST"
        case .postPurchaseReciept:
            return "POST"
        case .getUserId:
            return "POST"
        case .sendFeedback:
            return "POST"
        case .verifyOtp:
            return "POST"
        case .postFirebaseToken:
            return "POST"
        case .webguardWhiteBlackList:
            return "GET"
        case .sendMobileNumberForOtp:
            return "POST"
        }
    }
}
