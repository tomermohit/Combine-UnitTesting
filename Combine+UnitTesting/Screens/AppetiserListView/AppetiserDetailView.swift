//
//  AppetiserDetailView.swift
//  Combine+UnitTesting
//
//  Created by ꧁☆༒☬MoʜɩtToɱɘʀ☬༒☆꧂ on 25/03/24.
//

import SwiftUI

struct AppetiserDetailView: View {
    
    @Binding var isShowDetailsView: Bool
    let appetiser: Appetiser
    
    var body: some View {
        VStack {
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 225)
            VStack {
                Text(appetiser.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetiser.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack(spacing: 50) {
                    NutritionView(title: "Calories", value: appetiser.calories)
                    NutritionView(title: "Carbs", value: appetiser.carbs)
                    NutritionView(title: "Protein", value: appetiser.protein)
                }
            }
            
            Spacer()
            
            Button(action: {
                print("clicked")
            }, label: {
                Text("Add Appetiser")
                    .fontWeight(.bold)
            })
            .padding(.bottom, 30)
            .buttonModifier()
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 8))
        .shadow(radius: 40)
        .overlay(Button(action: {
            isShowDetailsView = false
        }, label: {
            OverLayButton()
        }), alignment: .topTrailing)
    }
}

#Preview {
    AppetiserDetailView(isShowDetailsView: .constant(false), appetiser: MockData.sampleAppetiser)
}

struct NutritionView: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .bold()
            Text("\(value)")
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .fontDesign(.serif)
        }
    }
}
