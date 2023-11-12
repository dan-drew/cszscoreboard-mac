//
//  BoothView.swift
//  ComedySportz Scoreboard
//
//  Created by user247872 on 11/11/23.
//

import SwiftUI
import WebKit

struct BoothView: NSViewRepresentable {

    func makeNSView(context: NSViewRepresentableContext<BoothView>) -> WKWebView {
        let webview = WKWebView()

        let request = URLRequest(url: URL(string: "https://cszscoreboard.ddrew.com")!, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)

        return webview
    }

    func updateNSView(_ webview: WKWebView, context: NSViewRepresentableContext<BoothView>) {
        //let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        //webview.load(request)
    }
}

