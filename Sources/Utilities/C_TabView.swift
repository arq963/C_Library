//
//  CustomTabBar.swift
//  SecureConnect
//
//  Created by Ali ur Rahman Qureshi on 13/12/2023.
//

import SwiftUI

struct C_TabView<T: Hashable & CaseIterable & RawRepresentable>: View where T.AllCases: RandomAccessCollection, T.RawValue == String {
    
    @Binding var selection: T
    
    let backgroundColor: C_Color
    let selectionTabColor: C_Color = .appYellow
    let selectedTextColor: C_Color = .black      // Color for selected tab text
    let unselectedTextColor: C_Color = .textSecondary  // Color for unselected tab text
    
    var body: some View {
        Picker("", selection: $selection) {
            ForEach(T.allCases, id: \.self) { item in
                Text(item.rawValue)
                    .tag(item)
            }
        }
        .pickerStyle(.segmented)
        .onAppear {
            // Configure segmented control appearance
            UISegmentedControl.appearance().selectedSegmentTintColor = selectionTabColor.uiColor
            UISegmentedControl.appearance().backgroundColor = backgroundColor.uiColor
            
            // Selected state text attributes
            let selectedAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: selectedTextColor.uiColor
            ]
            
            // Normal state text attributes
            let normalAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: unselectedTextColor.uiColor
            ]
            
            UISegmentedControl.appearance().setTitleTextAttributes(selectedAttributes, for: .selected)
            UISegmentedControl.appearance().setTitleTextAttributes(normalAttributes, for: .normal)
        }
    }
    
    init(selection: Binding<T>,
         backgroundColor: C_Color = .backgroundSecondary,
         selectedTextColor: C_Color = .textPrimary,
         unselectedTextColor: C_Color = .textSecondary) {
        _selection = selection
        self.backgroundColor = backgroundColor
//        self.selectedTextColor = selectedTextColor
//        self.unselectedTextColor = unselectedTextColor
    }
}
