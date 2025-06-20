//
//  C_HeadingView.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 10/15/24.
//

import SwiftUI

struct C_ToolbarPrincipalText: ToolbarContent {
    
    let text: String

    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            C_Text(text, type: .subHeading)
        }
    }
    
    init(_ text: String) {
        self.text = text
    }
}

#Preview {
    NavigationStack {
        Text("Content View")
            .toolbar {
                C_ToolbarPrincipalText("Hi Oye")
            }
            .toolbarBackground(C_Color.backgroundPrimary.rawValue, for: .navigationBar)
    }
}
