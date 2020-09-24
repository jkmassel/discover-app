import SwiftUI
import WebKit
import DiscoverCore

struct WebView: UIViewRepresentable {
    let article: Article

    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let webview = WKWebView()

        let request = URLRequest(url: self.article.source, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)

        return webview
    }

    func updateUIView(_ webview: WKWebView, context: UIViewRepresentableContext<WebView>) {
        let request = URLRequest(url: self.article.source, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
    }
}

