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
    
    var body: some Scene {
        WindowGroup {
            BoothContentView().onAppear(perform: {
                openWindow(id: "live")
            })
        }.defaultSize(width: 800, height: 600)
        Window("TV", id: "live") {
            LiveContentView()
        }.defaultSize(width: 1000, height: 800).windowStyle(.hiddenTitleBar)
    }
}
