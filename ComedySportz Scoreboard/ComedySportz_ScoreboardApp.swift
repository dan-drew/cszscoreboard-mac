//
//  ComedySportz_ScoreboardApp.swift
//  ComedySportz Scoreboard
//
//  Created by user247872 on 11/11/23.
//

import SwiftUI

@main
struct ComedySportz_ScoreboardApp: App {
    static public let DOCUMENTATION_URL = URL(string: "https://docs.google.com/document/d/13iQDgkSyzAIu081jAqJ1sTHh7XaiV4Ny3FXpckTTWuo/edit#heading=h.3wanvi147w7")!
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Window("Booth", id: "booth") {
            BoothView.create()
        }
        .defaultSize(width: 1200, height: 800)
        .commands {
            CommandGroup(replacing: .windowList) {
                Button("Booth") {
                    BoothView.show()
                }
                Menu("TV") {
                    ForEach(ScreenInfo.all) { screen in
                        Button(screen.displayName, action: {
                            appDelegate.setTVScreen(screen)
                        }).menuIndicator(.visible)
                    }
                }
            }
            CommandGroup(replacing: .help, addition: {
                Link("Documentation", destination: ComedySportz_ScoreboardApp.DOCUMENTATION_URL)
            })
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var launched = false
    
    private var tvWindow: TVWindow?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        self.launched = true
        NSApp.applicationIconImage = NSImage(named: "AppIcon")
        cleanupMenu()
        tvWindow = TVWindow()
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationDidUpdate(_ notification: Notification) {
        if launched && BoothView.closed {
            quit()
        } else {
            cleanupMenu()
        }
    }
    
    func setTVScreen(_ screen: ScreenInfo) {
        tvWindow?.screen = screen
    }
    
    func quit() {
        NSApp.stop(self)
    }
    
    func cleanupMenu() {
        let unwantedMenus: [String] = ["File","Edit","View"]
        
        unwantedMenus.forEach { menu in
            NSApp.mainMenu?.item(withTitle: menu).map {
                NSApp.mainMenu?.removeItem($0)
            }
        }
    }
}
