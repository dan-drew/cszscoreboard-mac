//
//  ContentView.swift
//  ComedySportz Scoreboard
//
//  Created by user247872 on 11/11/23.
//

import SwiftUI
import WebKit


struct BoothView: View {
    static let url = "https://cszscoreboard.ddrew.com"
    
    var body: some View {
        WebView(BoothView.url)
    }
    
    static func create() -> some View {
        return BoothView()
    }
    
    static func window() -> NSWindow? {
        return NSApp.windows.first(where: { it in
            it.identifier?.rawValue == "booth"
        })
    }
    
    static func closed() -> Bool {
        let window = self.window()!
        return !window.isVisible && !window.isMiniaturized
    }
}

#Preview {
    BoothView()
}

