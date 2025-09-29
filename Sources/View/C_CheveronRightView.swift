//
//  C_CheveronRightView.swift
//  PligenceConnect
//
//  Created by ARahmanQ on 7/18/25.
//

import SwiftUI

public struct C_CheveronRightView: View {
    
    public init() {
        
    }
    
    public var body: some View {
        C_Image(systemImage: .chevronRight,
                color: .textTertiary,
                width: 8,
                height: 12)
    }
}

#Preview {
    C_CheveronRightView()
}
