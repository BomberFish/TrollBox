//
//  ToolsView.swift
//  TrollBox
//
//  Created by Constantin Clerc on 17/12/2022.
//


import SwiftUI
struct ToolsView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: PasscodeEditorView()) {
                        HStack {
                            Image(systemName: "lock.fill")
                                .resizable() 
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.primary)
                            Text("Passcode Themer")
                        }
                    }
                    NavigationLink(destination: CarrierNameChangerView()) {
                        HStack {
                            Image(systemName: "network")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.primary)
                            Text("Carrier Changer")
                        }
                    }
                    NavigationLink(destination: WalSetView()) {
                        HStack {
                            Image(systemName: "wand.and.rays")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.primary)
                            Text("Wallpaper Setter")
                        }
                    }
                    NavigationLink(destination: MainCardView()) {
                        HStack {
                            Image(systemName: "creditcard.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.primary)
                            Text("Apple Pay Card Custom image")
                        }
                    }
                    NavigationLink(destination: LSFootnoteChangerView()) {
                        HStack {
                            Image(systemName: "arrow.down.doc.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.primary)
                            Text("Lock Screen Footnote")
                        }
                    }
                    NavigationLink(destination: BadgeChangerView()) {
                        HStack {
                            Image(systemName: "app.badge.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.primary)
                            Text("Badge Color Changer")
                        }
                    }
                    NavigationLink(destination: LocationSimulationView()) {
                        HStack {
                            Image(systemName: "globe.americas")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.primary)
                            Text("LocSim")
                        }
                    }
                    Section {
                        NavigationLink(destination: STA_View()) {
                            HStack {
                                Image(systemName: "hourglass")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.primary)
                                Text("ScreenTime Remover")
                            }
                        }
                        NavigationLink(destination: NoCamSoundView()) {
                            HStack {
                                Image(systemName: "camera")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.primary)
                                Text("No Shutter Sound")
                            }
                        }
                        NavigationLink(destination: FCView()) {
                            HStack {
                                Image(systemName: "character.cursor.ibeam")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.primary)
                                Text("iOS System Font Changer")
                            }
                        }
                        NavigationLink(destination: DockView()) {
                            HStack {
                                Image(systemName: "rectangle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.primary)
                                Text("Dock Options")
                            }
                        }
                        NavigationLink(destination: VChangerView())  {
                            HStack {
                                Image(systemName: "i.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.primary)
                                Text("iOS Version Number Editor")
                            }
                        }
                        NavigationLink(destination: OtherView()) {
                            HStack {
                                Image(systemName: "ellipsis")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.primary)
                                Text("Other minor tools")
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("TrollBox")
            .padding(.top, 10)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        respring()
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        if let url3 = URL(string: "https://discord.gg/8gMyK6DSnB") {
                            UIApplication.shared.open(url3)
                        }
                    }) {
                        Image("discord")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 27, height: 27)
                    }
                }
            }
        }
    }
}

extension Color {
    static let primary = Color("AccentColor")
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
