//
//  C_BaseView.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 5/30/25.
//

import SwiftUI

protocol C_BaseView: View {
    
    associatedtype ContentView: View
    
    var navigationTitle: String? { get }
    var goBackAction: (() -> Void)? { get }
    
    @ViewBuilder
    func content() -> ContentView
    func onAppear()
}

extension C_BaseView {
    
    var navigationTitle: String? { nil }
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(C_Color.backgroundPrimary.rawValue)
            .toolbar {
                C_ToolbarBackButton() {
                    goBackAction?()
                }
                
                C_ToolbarPrincipalText(navigationTitle ?? "")
            }
            .toolbarBackground(C_Color.backgroundPrimary.rawValue, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .onAppear() {
                onAppear()
            }
    }
}
