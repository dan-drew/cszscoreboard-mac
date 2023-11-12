//
//  ComedySportz_ScoreboardApp.swift
//  ComedySportz Scoreboard
//
//  Created by user247872 on 11/11/23.
//

import SwiftUI

@main
struct ComedySportz_ScoreboardApp: App {
    @Environment(\.openWindow) private var openWindow
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Window("Booth", id: "booth") {
            BoothView.create()
        }.defaultSize(width: 1200, height: 800)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var launched = false

    @Environment(\.openWindow) private var openWindow
    private var tvWindow: TVWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        self.launched = true
        //hideTitleBar()
        cleanupMenu()
        //openWindow(id: "live")
        tvWindow = TVWindow()
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationDidUpdate(_ notification: Notification) {	
        if launched && BoothView.closed() {
            quit()
        }
    }
    
    func quit() {
        NSApp.stop(self)
    }
    
    func cleanupMenu() {
        let unwantedMenus = ["File","Edit","View","Help"]
                
        unwantedMenus.forEach { menu in
            NSApp.mainMenu?.item(withTitle: menu).map {
                NSApp.mainMenu?.removeItem($0)
            }
        }

    }
}
