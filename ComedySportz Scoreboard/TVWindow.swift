//
//  BorderlessWindow.swift
//  ComedySportz Scoreboard
//
//  Created by user247872 on 11/14/23.
//

import SwiftUI
import OSLog

struct TVWindow {
    static let url = "https://cszscoreboard.ddrew.com/live"

    private let window: NSWindow
    private let view: WebView
    private var _screen: ScreenInfo?
    
    init() {
        let secondary = ScreenInfo.secondary
        window = NSWindow(contentRect: secondary.rect, styleMask: [.borderless, .fullSizeContentView], backing: .buffered, defer: false)
        
        view = WebView(TVWindow.url)
        window.contentView = view.makeNSView()
        screen = secondary
    }
    
    var screen: ScreenInfo {
        get { return _screen! }
        set {
            let logger = Logger()
            self._screen = newValue
            logger.info("Setting TV screen to \(newValue.displayName, privacy: .public)")
            window.setFrameOrigin(newValue.screen.frame.origin)
            window.setFrame(newValue.screen.frame, display: true)
            window.setIsVisible(true)
        }
    }
}
	
