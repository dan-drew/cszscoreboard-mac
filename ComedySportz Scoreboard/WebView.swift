//
//  BoothView.swift
//  ComedySportz Scoreboard
//
//  Created by user247872 on 11/11/23.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    private let url: URL
    
    init(_ url: String) {
        self.url = URL(string: url)!
    }
    
    func makeNSView(context: NSViewRepresentableContext<WebView>) -> WKWebView {
        return makeNSView()
    }
    
    func makeNSView() -> WKWebView {
        let webview = WKWebView(frame: CGRect.null, configuration: WebConfig().config)

        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData)
        webview.load(request)

        return webview
    }

    func updateNSView(_ webview: WKWebView, context: NSViewRepresentableContext<WebView>) {
        //let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        //webview.load(request)
    }
}

