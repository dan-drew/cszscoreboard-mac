//
//  BorderlessWindow.swift
//  ComedySportz Scoreboard
//
//  Created by user247872 on 11/14/23.
//

import SwiftUI

struct TVWindow {
    static let url = "https://cszscoreboard.ddrew.com/live"

    let window: NSWindow
    let view: WebView
    
    init() {
        let screen = FullScreen.findTargetScreen()
        let rect = screen.frame
        window = NSWindow(contentRect: rect, styleMask: [.borderless, .fullSizeContentView], backing: .buffered, defer: false, screen: screen)
        window.setIsVisible(true)
        
        view = WebView(TVWindow.url)
        window.contentView = view.makeNSView()
    }
}
	
