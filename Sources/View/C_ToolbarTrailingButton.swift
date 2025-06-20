//
//  C_ToolbarTrailingButton.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 3/25/25.
//

import SwiftUI

struct C_ToolbarTrailingButton: ToolbarContent {
    
    let imageWidth: CGFloat = 25
    let text: String?
    let action: (() -> Void)
    let textView: AnyView
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button(action: action) {
                textView
            }
            .frame(width: C_Size.button_minimumSize, height: C_Size.button_minimumSize)
        }
    }
    
    init(_ text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
        self.textView = AnyView(C_Text(text, type: .themeButton))
    }
    
    init(label: AnyView, action: @escaping () -> Void) {
        self.text = nil
        self.action = action
        self.textView = label
    }
}

#Preview {
    NavigationStack {
        Text("Content View")
            .toolbar {
                C_ToolbarTrailingButton("Button") {
                    
                }
            }
            .toolbarBackground(C_Color.backgroundPrimary.rawValue, for: .navigationBar)
    }
}
