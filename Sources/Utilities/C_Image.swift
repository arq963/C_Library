//
//  C_Image.swift
//  Essentials
//
//  Created by ARahmanQ on 7/9/24.
//

import SwiftUI

struct C_Image: View {

    let image: Image?
    let color: Color?
    let width: CGFloat?
    let height: CGFloat?
    
    var body: some View {
        
        if let image {
            image
                .resizable()
                .foregroundStyle(color ?? C_Color.white.rawValue)
                .scaledToFit()
                .frame(width: width, height: height)
        } else if width != nil || height != nil {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(width: width, height: height)
        }
    }
    
    init(name: C_ImageName?,
         color: C_Color? = nil,
         width: CGFloat? = nil,
         height: CGFloat? = nil) {
        
        if let name {
            if name.type == .systemImage {
                self.image = Image(systemName: name.rawValue)
            } else {
                self.image = Image(name.rawValue)
            }
        } else {
            image = nil
        }
         
        self.width = width
        self.height = height
        self.color = color?.rawValue
    }
    
    init(image: Image?, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.image = image
        self.width = width
        self.height = height
        self.color = nil
    }
    
    init(image: UIImage?, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        if let image = image {
            self.image = Image(uiImage: image)
        } else {
            self.image = nil
        }
        
        self.width = width
        self.height = height
        self.color = nil
    }
}

#Preview {
    C_Image(name: .chevronRight, width: 50, height: 50)
}
