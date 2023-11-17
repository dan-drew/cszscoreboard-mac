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
    
    static var window: NSWindow? {
        return NSApp.windows.first(where: { it in
            let id = it.identifier?.rawValue
            return id == nil ? false : id!.starts(with: "booth")
        })
    }
    
    static var closed: Bool {
        let window = self.window
        return window == nil || !(window!.isVisible || window!.isMiniaturized)
    }
    
    static func show() {
        guard let window = self.window else { return }
        window.setIsVisible(true)
        window.setIsMiniaturized(false)
    }
}

#Preview {
    BoothView()
}

