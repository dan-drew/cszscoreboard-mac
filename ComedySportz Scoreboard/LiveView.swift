//
//  LiveView.swift
//  ComedySportz Scoreboard
//
//  Created by user247872 on 11/12/23.
//

import SwiftUI
import WebKit

struct LiveView: NSViewRepresentable {

    func makeNSView(context: NSViewRepresentableContext<LiveView>) -> WKWebView {
        let webview = WKWebView(frame: CGRect.null, configuration: WebConfig().config)

        let request = URLRequest(url: URL(string: "https://cszscoreboard.ddrew.com/live")!, cachePolicy: .reloadRevalidatingCacheData)
        webview.load(request)

        return webview
    }

    func updateNSView(_ webview: WKWebView, context: NSViewRepresentableContext<LiveView>) {
        //let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        //webview.load(request)
    }
}


