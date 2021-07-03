//
//  ViewController.swift
//  WebViewExample
//
//  Created by Israel Torres Alvarado on 01/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var wkWebView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wkWebView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        guard let url = URL(string: "https://www.google.com.mx") else {
            return
        }
        
        wkWebView.load(URLRequest(url: url))
        wkWebView.navigationDelegate = self
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress" {
            
            print("estimatedProgress")
            self.progressView.progress = Float(wkWebView.estimatedProgress)
            
        }
        
    }
    
}
//MARK: WKNavigationDelegate
extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
        progressView.isHidden = true
        wkWebView.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        progressView.isHidden = false
        wkWebView.isHidden = true
    }
    
}

