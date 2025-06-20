//
//  C_BusyView.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 10/22/24.
//

import SwiftUI

struct C_BusyView: View {
    
    var body: some View {
        
        VStack {
            HStack { Spacer() }
            Spacer()
            C_Image(name: .launchScreenImage, width: 206, height: 157)
            Spacer()
            C_BusyCircleView(radius: 50)
            Spacer()
        }
        .background(C_Color.backgroundPrimary.rawValue.ignoresSafeArea())
    }
}

#Preview {
    C_BusyView()
}
