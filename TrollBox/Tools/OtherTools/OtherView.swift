//
//  OtherView.swift
//  TSSwissKnife
//
//  Created by Constantin Clerc on 17/12/2022.
//

import SwiftUI
func writeIt(contents: String, filepath: String) {
        let fileManager = FileManager.default
        let url = URL(fileURLWithPath: filepath)
        fileManager.createFile(atPath: filepath, contents: nil)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        }
        catch {
            print("oops")
        }
    }
struct OtherView: View {
    @State private var showingAlert = false
    @State private var showAlert = false
    var body: some View {
            List {
                Section {
                    Button("Supervise !") {
                                            showAlert.toggle()
                                            writeIt(contents: "<?xml version=\"1.0\" encoding=\"UTF-8\"?> <!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\"> <plist version=\"1.0\"> <dict> <key>AllowPairing</key> <true/> <key>CloudConfigurationUIComplete</key> <true/> <key>ConfigurationSource</key> <integer>0</integer> <key>IsSupervised</key> <true/> <key>PostSetupProfileWasInstalled</key> <true/> </dict> </plist>", filepath: "/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/CloudConfigurationDetails.plist")
                                        }
                                        .alert(isPresented: $showAlert) {
                                            Alert(
                                                title: Text("Now supervised !!"),
                                                message: Text("You're device have been supervised successfully ! Please go respring to apply change."),
                                                primaryButton: .default(
                                                    Text("Respring"),
                                                    action: {
                                                        respring()
                                                    }
                                                ),
                                                secondaryButton: .default(
                                                    Text("OK")
                                                )
                                            )
                                        }
                    Button("No more lock after respringing") {
                                            showAlert.toggle()
                                            writeIt(contents: "<?xml version=\"1.0\" encoding=\"utf-8\"?> <!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"apple.com/DTDs/PropertyList-1.0.dtd\"> <plist version=\"1.0\"> <dict> <key>SBDontLockAfterCrash</key> <true/> </dict> </plist>", filepath: "/var/Managed Preferences/mobile/com.apple.springboard.plist")
                                        }
                                        .alert(isPresented: $showAlert) {
                                            Alert(
                                                title: Text("What a shot !"),
                                                message: Text("You can now hold your breath to get ready to the adventure of you're life..."),
                                                primaryButton: .default(
                                                    Text("Respring"),
                                                    action: {
                                                        respring()
                                                    }
                                                ),
                                                secondaryButton: .default(
                                                    Text("OK")
                                                )
                                            )
                                        }
                    Button("Unsupervise Your Device") {
                         showingAlert.toggle()
                         writeToFileWithContents(contents: "<?xml version=\"1.0\" encoding=\"UTF-8\"?> <!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\"> <plist version=\"1.0\"> <dict> <key>AllowPairing</key> <true/> <key>CloudConfigurationUIComplete</key> <true/> <key>ConfigurationSource</key> <integer>0</integer> <key>IsSupervised</key> <false/> <key>PostSetupProfileWasInstalled</key> <true/> </dict> </plist>", filepath: "/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/CloudConfigurationDetails.plist")
                     }
                     .alert(isPresented: $showingAlert) {
                         Alert(
                             title: Text("Goodbye..."),
                             message: Text("The text at the top of settings was annoying, that's true... Please respring"),
                             primaryButton: .default(
                                 Text("Respring"),
                                 action: {
                                     respring()
                                 }
                             ),
                             secondaryButton: .default(
                                 Text("OK")
                             )
                         )
                     }
                        }
                    }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        respring()
                    }) {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
            }
        }
func writeToFileWithContents(contents: String, filepath: String) {
        let fileManager = FileManager.default
        let url = URL(fileURLWithPath: filepath)
        fileManager.createFile(atPath: filepath, contents: nil)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        }
        catch {
            print("error")
        }
    }
