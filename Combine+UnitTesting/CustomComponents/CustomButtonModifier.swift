//
//  CustomButtonModifier.swift
//  Combine+UnitTesting
//
//  Created by ꧁☆༒☬MoʜɩtToɱɘʀ☬༒☆꧂ on 25/03/24.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .tint(.accent)
            .buttonStyle(.bordered)
            .controlSize(.large)
    }
}

extension View {
    func buttonModifier() -> some View {
        self.modifier(CustomButtonModifier())
    }
}
