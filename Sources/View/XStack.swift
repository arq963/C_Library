//
//  SwiftUIView.swift
//  C_Library
//
//  Created by ARahmanQ on 9/12/25.
//

import SwiftUI

public struct C_VStack<Content: View>: View {
    
    let spacing: CGFloat?
    let alignment: HorizontalAlignment
    let content: () -> Content

    public init(spacing: CGFloat? = nil,
                alignment: HorizontalAlignment = .center,
                @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.spacing = spacing
        self.alignment = alignment
    }

    public var body: some View {
        
        VStack(alignment: alignment, spacing: spacing) {
            HStack { Spacer() }
            content()
        }
    }
}

public struct C_HStack<Content: View>: View {
    
    let spacing: CGFloat?
    let alignment: VerticalAlignment
    let content: () -> Content

    public init(spacing: CGFloat? = nil,
                alignment: VerticalAlignment = .center,
                @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.spacing = spacing
        self.alignment = alignment
    }

    public var body: some View {
        
        HStack(alignment: alignment, spacing: spacing) {
            VStack { Spacer() }
            content()
        }
    }
}

public struct XStack<Content: View>: View {
    
    let isHStack: Bool
    let spacing: CGFloat?
    let content: () -> Content

    public init(isHStack: Bool = false,
                spacing: CGFloat? = nil,
                @ViewBuilder content: @escaping () -> Content) {
        self.isHStack = isHStack
        self.content = content
        self.spacing = spacing
    }

    public var body: some View {
        if isHStack {
            HStack(spacing: spacing) {
                VStack { Spacer() }
                content()
            }
        } else {
            VStack(spacing: spacing) {
                HStack { Spacer() }
                content()
            }
        }
    }
}
