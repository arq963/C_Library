//
//  C_CheckBoxView.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 2/10/25.
//

import SwiftUI

struct C_CheckBoxView: View {
    
    @Binding var isChecked: Bool
    let size: CGFloat
    
    var body: some View {
        
        Button(action: {
            isChecked.toggle() // Toggle the state
        }) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .foregroundColor(isChecked ? C_Color.appBlue.rawValue : .gray)
                .frame(width: size, height: size)                
        }
    }
}

#Preview {
    C_CheckBoxView(isChecked: .constant(true), size: 20)
}
