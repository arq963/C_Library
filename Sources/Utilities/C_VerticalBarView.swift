//
//  C_VerticalBarView.swift
//  SecureBusinessConnect
//
//  Created by Ali ur Rahman Qureshi on 22/01/2024.
//

import SwiftUI

public struct C_VerticalBarView: View {
    
    var progress: CGFloat
    var letter: String
    @State var height: CGFloat = 50
    @State var width: CGFloat = 6.74
    @State var cornerRadius: CGFloat = 20
    @State var fontSize: CGFloat = 6
    @State var isIpad: Bool = false
    
    public var body: some View {
        
        let progressHeight = height * progress / 100
        
        return VStack {
            
            ZStack(alignment: .bottom) {
                
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(C_Color.gray.rawValue)
                    .frame(width: width, height: height)
                
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(C_Color.textPrimary.rawValue)
                    .frame(
                        width: width,
                        height: progress <= 100 ? progressHeight : height)
            }
            
            C_Text(letter, fontSize, color: C_Color.veryLightGray)
        }
        .onAppear() {
            setupView()
        }
    }
    
    private func setupView() {
        
        if isIpad {
            height *= 1.3
            width *= 1.3
            cornerRadius *= 1.3
            fontSize *= 1.3
        }
    }
    
    public init(progress: CGFloat,
                letter: String,
                isIpad: Bool = false) {
        self.progress = progress
        self.letter = letter
        self.isIpad = isIpad
    }
}

#Preview {
    C_VerticalBarView(progress: 60, letter: "M", isIpad: true)
}
