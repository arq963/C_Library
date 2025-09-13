//
//  SwiftUIView.swift
//  C_Library
//
//  Created by ARahmanQ on 9/12/25.
//

import SwiftUI

public struct XStack<Content: View>: View {
    
    let isLandscape: Bool
    let content: () -> Content

    public init(isLandscape: Bool,
                @ViewBuilder content: @escaping () -> Content) {
        self.isLandscape = isLandscape
        self.content = content
    }

    public var body: some View {
        if isLandscape {
            HStack {
                VStack { Spacer() }
                content()
            }
        } else {
            VStack {
                HStack { Spacer() }
                content()
            }
        }
    }
}
