//
//  CreditsView.swift
//  TrollBox
//
//  Created by Constantin Clerc on 24/12/2022.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    LinkCell(imageName: "mypage-icon", url: "https://github.com/c22dev", title: "c22dev (main dev, adapting code)")
                    LinkCell(imageName: "sourcelocation", url: "https://github.com/sourcelocation", title: "sourcelocation (Plugins and Tools/AirTroller)")
                    LinkCell(imageName: "s8ngyu", url: "https://github.com/s8ngyu", title: "s8ngyu (gestures)")
                    LinkCell(imageName: "Skittyblock", url: "https://github.com/Skittyblock", title: "Skittyblock (WallSet)")
                    LinkCell(imageName: "cisc0disco", url: "https://github.com/cisc0disco", title: "cisc0disco (card changer)")
                    LinkCell(imageName: "haxi0", url: "https://github.com/haxi0", title: "haxi0 (supervising)")
                } header: {
                }
            }
            .navigationTitle("Credits")
        }
    }
}

struct LinkCell: View {
    var imageName: String
    var url: String
    var title: String
    var systemImage: Bool = false
    var circle: Bool = false
    
    var body: some View {
        HStack(alignment: .center) {
            Group {
                if systemImage {
                    Image(systemName: imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .frame(width: 30, height: 30)
            Button(title) {
                UIApplication.shared.open(URL(string: url)!)
            }
            .padding(.horizontal, 4)
        }
        .foregroundColor(.blue)
    }
}
