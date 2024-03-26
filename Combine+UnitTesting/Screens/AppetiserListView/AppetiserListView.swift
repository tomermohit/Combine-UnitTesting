//
//  AppetiserListView.swift
//  Combine+UnitTesting
//
//  Created by ꧁☆༒☬MoʜɩtToɱɘʀ☬༒☆꧂ on 25/03/24.
//

import SwiftUI

struct AppetiserListView: View {
    
    @StateObject private var appetizerViewModel = AppetiserViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(appetizerViewModel.appetiser) { appetiser in
                    AppetiserListCell(appetiser: appetiser)
                        .onTapGesture {
                            appetizerViewModel.selectedAppetiser = appetiser
                            appetizerViewModel.isShowingDetailView = true
                        }
                }
                .listStyle(.plain)
                .navigationTitle("Appetisers")
                .disabled(appetizerViewModel.isShowingDetailView)
            }
            
            .onAppear {
                appetizerViewModel.getAppetiserList()
            }
            .blur(radius: appetizerViewModel.isShowingDetailView ? 20 : 0)
            
            if appetizerViewModel.isLoading {
                LoadingView()
            }
            
            if appetizerViewModel.isShowingDetailView {
                AppetiserDetailView(isShowDetailsView: $appetizerViewModel.isShowingDetailView, appetiser: appetizerViewModel.selectedAppetiser ?? MockData.sampleAppetiser)
            }
        }
        .alert(item: $appetizerViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetiserListView()
}
