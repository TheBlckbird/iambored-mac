//
//  MenuBarView.swift
//  I am bored
//
//  Created by Louis Weigel on 29.04.23.
//

import SwiftUI
struct MenuBarView: View {
    @Binding var text: String
    
    var body: some View {
        Group {
            Text(text == "" ? "Loading…" : text)
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
        .padding()
    }
}
