//
//  C_ToolbarBackButton.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 3/25/25.
//

import SwiftUI

struct C_ToolbarBackButton: ToolbarContent {
    let imageWidth: CGFloat = 25
    let action: (() -> Void)
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: action) {
                C_Image(name: .leftArrow,
                        color: .appYellow,
                        width: imageWidth)
            }
            .frame(width: C_Size.button_minimumSize, height: C_Size.button_minimumSize)
        }
    }
}

#Preview {
    NavigationStack {
        Text("Content View")
            .toolbar {
                C_ToolbarBackButton() {
                    
                }
            }
            .toolbarBackground(C_Color.backgroundPrimary.rawValue, for: .navigationBar)
    }
}
