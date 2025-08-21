//
//  CustomTabBar.swift
//  SecureConnect
//
//  Created by Ali ur Rahman Qureshi on 13/12/2023.
//

#if os(iOS)
import UIKit
#endif

import SwiftUI
import C_Library

public struct C_i_TabView<T: Hashable & CaseIterable & RawRepresentable>: View where T.AllCases: RandomAccessCollection, T.RawValue == String {
    
    @Binding var selection: T
    
    let backgroundColor: Color
    let selectionTabColor: Color
    let selectedTextColor: Color
    let unselectedTextColor: Color
    
    public var body: some View {
        
        Picker("", selection: $selection) {
            ForEach(T.allCases, id: \.self) { item in
                Text(item.rawValue)
                    .tag(item)
            }
        }
        .pickerStyle(.segmented)
        .onAppear {
#if os(iOS)
            let uiSegmented = UISegmentedControl.appearance()
            uiSegmented.selectedSegmentTintColor = UIColor(selectionTabColor)
            uiSegmented.isOpaque = true
            
            let selectedAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(selectedTextColor)
            ]
            
            let normalAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(unselectedTextColor)
            ]
            
            uiSegmented.setTitleTextAttributes(selectedAttributes, for: .selected)
            uiSegmented.setTitleTextAttributes(normalAttributes, for: .normal)
            
#endif
        }
    }
    
    public init(selection: Binding<T>,
                backgroundColor: Color = .backgroundSecondary,
                selectedTabColor: Color = .appAccent,
                selectedTextColor: Color = .textPrimary,
                unselectedTextColor: Color = .textSecondary) {
        
        _selection = selection
        self.backgroundColor = backgroundColor
        self.selectionTabColor = selectedTabColor
        self.selectedTextColor = selectedTextColor
        self.unselectedTextColor = unselectedTextColor
    }
}
