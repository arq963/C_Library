//
//  C_Button.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 2/14/25.
//

import SwiftUI

public struct C_Button<Label>: View where Label: View {
    
    let action: () -> Void
    let label: Label
    
    public init(action: @escaping () -> Void, @ViewBuilder label: () -> Label) {
        self.action = action
        self.label = label()
    }
    
    public var body: some View {
        Button(action: action) {
            label
        }
        
        .frame(minWidth: C_Size.button_minimumSize,
               minHeight: C_Size.button_minimumSize)
    }
}

#Preview {
    C_Button(action: {
        
    }) {
        Text("Next")
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
    }
}
