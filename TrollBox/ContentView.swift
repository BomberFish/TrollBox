//
//  ContentView.swift
//  TrollBox
//
//  Created by Constantin Clerc on 08/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ToolsView()
                .tabItem {
                    Label("Tools", systemImage: "wrench.and.screwdriver.fill")
                }
            AirSpam()
                .tabItem {
                    Label("AirSpammer", systemImage: "antenna.radiowaves.left.and.right")
                }
            CreditsView()
                .tabItem {
                    Label("Credits", systemImage: "heart.fill")
                }
            AboutView()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
