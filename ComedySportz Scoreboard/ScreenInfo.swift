//
//  ScreenInfo.swift
//  ComedySportz Scoreboard
//
//  Created by user247872 on 11/18/23.
//

import SwiftUI
import OSLog

class ScreenInfo: Identifiable {
    var id: ObjectIdentifier
    
    let screen: NSScreen
    let name: String
    let main: Bool
    let width: Int
    let height: Int
    let index: Int
    
    private static var _all: [ScreenInfo]? = nil
    
    init(_ index: Int, _ screen: NSScreen) {
        self.screen = screen
        self.index = index
        id = ObjectIdentifier(NSUniqueIDSpecifier())
        name = screen.localizedName
        main = NSScreen.main == screen
        width = Int(screen.frame.width)
        height = Int(screen.frame.height)
    }
    
    static var main: ScreenInfo {
        return all.first(where: { $0.main })!
    }
    
    static var secondary: ScreenInfo {
        if (all.count > 1) {
            return all.first { !$0.main }!
        } else {
            return all[0]
        }
    }

    var displayName:  String {
        let result =  "#\(index) \(name) (\(width)x\(height))"
        if (main) {return "\(result) - MAIN"}
        return result
    }
    
    var rect: CGRect {
        return CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    static var all: [ScreenInfo] {
        if (_all == nil) {
            let logger = Logger()
            _all = []
            var index = 0
            NSScreen.screens.forEach { screen in
                if (screen.deviceDescription[NSDeviceDescriptionKey.isScreen] != nil) {
                    let it = ScreenInfo(index, screen)
                    _all?.append(it)
                    logger.info("Found screen \(it.displayName, privacy: .public)")
                    index += 1
                }
            }
            logger.info("Found \(index) screens")
        }
        return _all!
    }
    
}
