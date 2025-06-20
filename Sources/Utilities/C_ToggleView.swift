//
//  C_ToggleView.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 11/6/24.
//

import SwiftUI

struct C_ToggleView: View {
    
    @Binding var isOn: Bool
    var isEnabled: Bool = true
    let scaleEffect: CGFloat
    private let width: CGFloat

    var body: some View {
        HStack {
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(C_Color.appYellow.rawValue)
                .opacity(isEnabled ? 1 : 0)
                .scaleEffect(scaleEffect)
                .frame(width: width)
        }
    }
    
    init(isOn: Binding<Bool>, isEnabled: Bool = true, scaleEffect: CGFloat = 1) {
        self._isOn = isOn
        self.isEnabled = isEnabled
        self.width = 30 * scaleEffect
        self.scaleEffect = scaleEffect
    }
}

#Preview {
    C_ToggleView(isOn: .constant(true), isEnabled: true, scaleEffect: 1)
    C_ToggleView(isOn: .constant(true), isEnabled: true, scaleEffect: 1.5)
}
