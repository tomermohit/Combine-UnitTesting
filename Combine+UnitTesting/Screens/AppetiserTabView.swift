//
//  AppetiserTabView.swift
//  Combine+UnitTesting
//
//  Created by ꧁☆༒☬MoʜɩtToɱɘʀ☬༒☆꧂ on 25/03/24.
//

import SwiftUI

struct AppetiserTabView: View {
    var body: some View {
        TabView {
            AppetiserListView()
                .tabItem { Label("Home", systemImage: "house") }
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
        }
    }
}

#Preview {
    AppetiserTabView()
}
