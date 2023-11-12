//
//  DataStore.swift
//  ComedySportz Scoreboard
//
//  Created by user247872 on 11/12/23.
//

import Foundation
import WebKit

struct WebConfig {
    let DATA_STORE_ID = UUID(uuidString: "752ed136-e31f-4a37-bc97-c5bdfb37d778")

    let config = WKWebViewConfiguration()
    //var store: WKWebsiteDataStore
    
    init() {
        //self.store = WKWebsiteDataStore(forIdentifier: DATA_STORE_ID!)
        //self.config = WKWebViewConfiguration(websiteDataStore: self.store)
        self.config.websiteDataStore = WKWebsiteDataStore.default()
        self.config.applicationNameForUserAgent = "ComedySportz Scoreboard"
    }
}
