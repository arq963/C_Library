//
//  C_BusyCircleView.swift
//  SecureBusinessConnect
//
//  Created by Ali ur Rahman Qureshi on 28/01/2024.
//

import SwiftUI

public struct C_BusyCircleView: View {
    
    @State private var isRotating = true
    var radius: CGFloat
    var background: Color
    let innerCircle: CGFloat
    let barSize: CGFloat
    
    public var body: some View {
        
        ZStack {

            Circle()
                .trim(from: 0, to: 0.3)
                .stroke(style: StrokeStyle(lineWidth: barSize,
                                           lineCap: .round,
                                           lineJoin: .round))
                .foregroundColor(C_Color.appYellow.rawValue)
                .rotationEffect(Angle(degrees: isRotating ? 0 : 360))
                .onAppear() {
                    withAnimation(Animation.linear(duration: 1.0)
                        .repeatForever(autoreverses: false)) {
                        self.isRotating.toggle()
                    }
                }
                .frame(width: radius)
        }
    }
    
    public init(radius: CGFloat = 50,
                barSize: CGFloat = 10,
                background: C_Color = C_Color.backgroundPrimary) {
        self.radius = radius
        self.background = background.rawValue
        self.barSize = barSize
        self.innerCircle = radius - barSize
    }
}

#Preview {
    C_BusyCircleView(radius: 56)
}
