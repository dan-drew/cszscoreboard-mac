//
//  FullScreen.swift
//  ComedySportz Scoreboard
//
//  Created by user247872 on 11/12/23.
//

import SwiftUI

struct FullScreen {
    static let liveScreen = findTargetScreen()
    
    @discardableResult
    static func makeFullScreen(view: some View) -> some View {
        let target = findTargetScreen().frame
        return view.position(x: target.width / 2, y: target.height / 2)
            .frame(width: target.width, height: target.height)
    }
    
    static func findTargetScreen() -> NSScreen {
        if (NSScreen.screens.count > 1) {
            return NSScreen.screens.first { it in
                it !== NSScreen.main
            }!
        } else {
            return NSScreen.main!
        }
    }

    static func hideTitleBar(_ window: NSWindow?) {
        guard window != nil else { return }
        window!.titlebarAppearsTransparent = true
        window!.standardWindowButton(.closeButton)?.isHidden = true
        window!.standardWindowButton(.miniaturizeButton)?.isHidden = true
        window!.standardWindowButton(.zoomButton)?.isHidden = true
    }
}
