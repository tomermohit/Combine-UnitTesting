//
//  OverLayButton.swift
//  Combine+UnitTesting
//
//  Created by ꧁☆༒☬MoʜɩtToɱɘʀ☬༒☆꧂ on 25/03/24.
//

import SwiftUI

struct OverLayButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                //.resizable()  don't use this
                .frame(width: 40, height: 40)
                .imageScale(.small)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    OverLayButton()
}
