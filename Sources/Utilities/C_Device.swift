//
//  File.swift
//  C_Library
//
//  Created by ARahmanQ on 9/11/25.
//

import Foundation
import UIKit
import Combine

@MainActor
public final class C_Device: ObservableObject {
    
    public static let shared = C_Device()
    
    @Published public private(set) var isLandscape: Bool
    
    private var cancellable: AnyCancellable?
    
    private init() {
        self.isLandscape = UIScreen.main.bounds.width > UIScreen.main.bounds.height
        
        cancellable = NotificationCenter.default
            .publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { [weak self] _ in
                guard let self else { return }
                DispatchQueue.main.async {
                    self.isLandscape = UIScreen.main.bounds.width > UIScreen.main.bounds.height
                }
            }
    }
}

