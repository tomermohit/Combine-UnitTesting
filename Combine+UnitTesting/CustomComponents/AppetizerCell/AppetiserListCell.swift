//
//  AppetiserListCell.swift
//  Combine+UnitTesting
//
//  Created by ꧁☆༒☬MoʜɩtToɱɘʀ☬༒☆꧂ on 25/03/24.
//

import SwiftUI

struct AppetiserListCell: View {
    
    var appetiser: Appetiser
    
    var body: some View {
        HStack {
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 90)
                .clipShape(.rect(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(appetiser.name)")
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetiser.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding()// .leading
            
        }
        //.background(Color.red)
    }
}

#Preview {
    AppetiserListCell(appetiser: MockData.sampleAppetiser)
}
