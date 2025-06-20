//
//  C_CompanyNameView.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 2/10/25.
//

import SwiftUI

struct C_CompanyNameView: View {
    
    let textSize: CGFloat
    
    var body: some View {
        
        HStack(spacing: 3) {
            
            C_Text("Privacy",
                       textSize,
                       color: .white,
                       fontName: .gilroy,
                       fontWeight: .black)
            
            C_Text("Defender",
                       textSize,
                       color: .appYellow,
                       fontName: .cera,
                       fontWeight: .medium)
        }
    }
    
    init(textSize: CGFloat = 24) {
        self.textSize = textSize
    }
}

#Preview {
    C_CompanyNameView(textSize: 34)
}
