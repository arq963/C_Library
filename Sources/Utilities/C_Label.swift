//
//  C_ListLabel.swift
//  PrivacyDefender
//
//  Created by ARahmanQ on 4/4/25.
//

import SwiftUI

struct C_Label: View {
    
    @State var title: String
    @Binding var value: String
    @Binding var isEditing: Bool
    @State var valueTextType: C_TextType = .labelTextPrimary
    
    let blankText: String
    let keyBoard: UIKeyboardType
    let background: C_Color
    let titleWidth: CGFloat = 100
    let fontSize: CGFloat?
    let copyAction: (() -> ())?
    
    @State private var showCopyView = false
    
    var body: some View {
        
        LabeledContent {
            
            if isEditing {
                TextField("",
                          text: $value,
                          prompt: Text(blankText).foregroundColor(C_Color.textPlaceholder.rawValue))
                .multilineTextAlignment(.leading)
                .foregroundStyle(C_Color.textPrimary.rawValue)
                .keyboardType(keyBoard)                    
            } else {
                HStack {
                    C_Text(value.isEmpty ? blankText : value,
                           type: valueTextType)
                    Spacer()
                }
            }
        } label: {
            C_Text(title,
                   type: isEditing ? .labelTextSecondary : .labelTextPrimary,
                   width: titleWidth,
                   fontSize: fontSize)
        }
        .listRowBackground(background.rawValue)
        .popover(isPresented: $showCopyView) {
            C_Text("Copied")
                .presentationCompactAdaptation(.popover)
        }
        .onTapGesture {
            copyAction?()
            withAnimation {
                showCopyView = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                withAnimation {
                    showCopyView = false
                }
            }
        }
        .onAppear {
            updateValueTextType()
        }
        .onChange(of: isEditing) { _ in
            updateValueTextType()
        }
    }
    
    private func updateValueTextType() {
        if isEditing {
            if value.isEmpty {
                valueTextType = .labelTextPlaceholder
            } else {
                valueTextType = .labelTextPrimary
            }
        } else {
            if value.isEmpty {
                valueTextType = .labelTextPlaceholder
            } else {
                valueTextType = .labelTextSecondary
            }
        }
    }
    
    init(title: String,
         value: Binding<String>,
         isEditing: Binding<Bool>,
         placeHolder: String,
         background: C_Color = .backgroundSecondary,
         keyboard: UIKeyboardType = .default,
         fontSize: CGFloat? = nil,
         action: (() -> ())? = nil) {
        
        self.title = title
        self._value = value
        self.background = background
        self._isEditing = isEditing
        self.blankText = placeHolder
        self.keyBoard = keyboard
        self.fontSize = fontSize
        self.copyAction = action
    }
}

#Preview {
    List {
        C_Label(title: "Title 1",
                value: .constant("Value = Yes Editing = false"),
                isEditing: .constant(false),
                placeHolder: "Enter a value") {
            // Copy action
        }
        
        
        C_Label(title: "Title 2",
                value: .constant(""),
                isEditing: .constant(false),
                placeHolder: "Value = No Editing = false") {
            // Copy action
        }
        
        C_Label(title: "Title 3",
                value: .constant("Editing is true"),
                isEditing: .constant(true),
                placeHolder: "Enter a value") {
            // Copy action
        }
        
        C_Label(title: "Title 4",
                value: .constant("Editing is true"),
                isEditing: .constant(true),
                placeHolder: "Enter a value") {
            // Copy action
        }
    }
    .scrollContentBackground(.hidden)
    .background(C_Color.backgroundPrimary.rawValue)
}

