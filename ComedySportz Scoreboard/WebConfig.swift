//
//  DataStore.swift
//  ComedySportz Scoreboard
//
//  Created by user247872 on 11/12/23.
//

import Foundation
import WebKit


struct WebConfig {
    let config = WKWebViewConfiguration()
    static let store = WKWebsiteDataStore.default()
    
    init() {
        self.config.websiteDataStore = WebConfig.store
        self.config.applicationNameForUserAgent = "ComedySportz Scoreboard"
    }
}
