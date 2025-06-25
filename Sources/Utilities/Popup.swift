//
//  Popup.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 10/10/24.
//

import Foundation
import SwiftUI

public struct PopUp {
    
    public var isShowMessage = false
    public var alert: SwiftUI.Alert!
    
    public mutating func showOneButtonAlert(title: String,
                                     message: String,
                                     buttonText: String = "OK",
                                     action: (() -> ())? = nil) {
        alert = SwiftUI.Alert(
            title: Text(title),
            message: Text(message),
            dismissButton: .default(Text(buttonText)) {
                action?()                
            }
        )
        self.isShowMessage = true
    }
    
    public mutating func showTwoButtonsAlert(title: String,
                                      message: String,
                                      buttonTitle: String = "OK",
                                      action: @escaping () -> ()) {
        alert = SwiftUI.Alert(
            title: Text(title),
            message: Text(message),
            primaryButton: .default(Text(buttonTitle),
                                    action: action),
            secondaryButton: .cancel()
        )
        self.isShowMessage = true
    }
    
    public init() {}
}
