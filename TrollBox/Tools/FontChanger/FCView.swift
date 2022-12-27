//
//  FCView.swift
//  TrollBox
//
//  Created by Constantin Clerc on 27/12/2022.
//

import SwiftUI

struct FontToReplace {
  var name: String
  var postScriptName: String
  var repackedPath: String
}

let fonts = [
  FontToReplace(
    name: "DejaVu Sans Condensed", postScriptName: "DejaVuSansCondensed",
    repackedPath: "DejaVuSansCondensed.woff2"),
  FontToReplace(
    name: "DejaVu Serif", postScriptName: "DejaVuSerif", repackedPath: "DejaVuSerif.woff2"),
  FontToReplace(
    name: "DejaVu Sans Mono", postScriptName: "DejaVuSansMono", repackedPath: "DejaVuSansMono.woff2"
  ),
  FontToReplace(name: "Go Regular", postScriptName: "GoRegular", repackedPath: "Go-Regular.woff2"),
  FontToReplace(name: "Go Mono", postScriptName: "GoMono", repackedPath: "Go-Mono.woff2"),
  FontToReplace(
    name: "Fira Sans", postScriptName: "FiraSans-Regular",
    repackedPath: "FiraSans-Regular.2048.woff2"),
  FontToReplace(name: "Segoe UI", postScriptName: "SegoeUI", repackedPath: "segoeui.woff2"),
  FontToReplace(
    name: "Comic Sans MS", postScriptName: "ComicSansMS", repackedPath: "Comic Sans MS.woff2"),
  FontToReplace(
    name: "Choco Cooky", postScriptName: "Chococooky", repackedPath: "Chococooky.woff2"),
]

struct FCView: View {
  @State private var message = "Choose a font."
  var body: some View {
    VStack {
      Text(message).padding(16)
      ForEach(fonts, id: \.name) { font in
        Button(action: {
          message = "Running"
          overwriteWithFont(name: font.repackedPath) {
            message = $0
          }
        }) {
          Text(font.name).font(.custom(font.postScriptName, size: 18))
        }.padding(8)
      }
    }
  }
}

struct FCView_Previews: PreviewProvider {
  static var previews: some View {
    FCView()
  }
}
