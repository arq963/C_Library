//
//  CustomTabBar.swift
//  SecureConnect
//
//  Created by Ali ur Rahman Qureshi on 13/12/2023.
//

import UIKit
import SwiftUI
import C_Library

public struct C_iTabView<T: Hashable & CaseIterable & RawRepresentable>: View where T.AllCases: RandomAccessCollection, T.RawValue == String {
    
    @Binding var selection: T
    
    let backgroundColor: Color
    let selectionTabColor: Color
    let selectedTextColor: Color
    let unselectedTextColor: Color
    let textSize: CGFloat
    
    public var body: some View {
        
        Picker("", selection: $selection) {
            ForEach(T.allCases, id: \.self) { item in
                Text(item.rawValue)
                    .tag(item)
            }
        }
        .pickerStyle(.segmented)
        .onAppear {
            let uiSegmented = UISegmentedControl.appearance()
            uiSegmented.selectedSegmentTintColor = UIColor(selectionTabColor)
            uiSegmented.isOpaque = true
            
            let selectedAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(selectedTextColor),
                .font: UIFont.systemFont(ofSize: textSize, weight: .semibold)
            ]
            
            let normalAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(unselectedTextColor),
                .font: UIFont.systemFont(ofSize: textSize, weight: .regular)
            ]
            
            uiSegmented.setTitleTextAttributes(selectedAttributes, for: .selected)
            uiSegmented.setTitleTextAttributes(normalAttributes, for: .normal)
        }
    }
    
    public init(selection: Binding<T>,
                backgroundColor: Color = .backgroundSecondary,
                selectedTabColor: Color = .appAccent,
                selectedTextColor: Color = .textPrimary,
                unselectedTextColor: Color = .textSecondary,
                textSize: CGFloat = 15) {
        
        _selection = selection
        self.backgroundColor = backgroundColor
        self.selectionTabColor = selectedTabColor
        self.selectedTextColor = selectedTextColor
        self.unselectedTextColor = unselectedTextColor
        self.textSize = textSize
    }
}
