//
//  ViewControllerThree.swift
//  SwiftStudy
//
//  Created by guoliting on 2020/10/10.
//  Copyright © 2020 guoliting. All rights reserved.
//

import UIKit
import WebKit

class ViewControllerThree: UIViewController, UIWebViewDelegate, WKScriptMessageHandler {
    var webView: UIWebView?
    var buttonGoBack: UIButton!
    var buttonGoForward: UIButton!
    var wkView: WKWebView?
    var progressView: UIProgressView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarItem.title = "直播"
        self.navigationController?.tabBarItem.title = "直播"
        self.view.backgroundColor = UIColor.blue
        
        let configuration = WKWebViewConfiguration()
        let processPool = WKProcessPool()
        configuration.processPool = processPool
        let prefrence = WKPreferences()
        prefrence.minimumFontSize = 0
        prefrence.javaScriptEnabled = true
        prefrence.javaScriptCanOpenWindowsAutomatically = true
        configuration.preferences = prefrence
        let userContentController = WKUserContentController()
        userContentController.add(self, name: "nativeFunc")
        let javaScriptString = "function userFunc(){window.webkit.messageHandlers.nativeFunc.postMessage({\"班级\":\"宁侠学堂\"})};userFunc()"
        let userScript = WKUserScript(source: javaScriptString, injectionTime: .atDocumentStart, forMainFrameOnly: false)
        userContentController.addUserScript(userScript)
        configuration.userContentController = userContentController
        wkView = WKWebView(frame: self.view.frame, configuration: configuration)
        self.view.addSubview(wkView!)
        
//        let url = URL(string: "https://www.baidu.com")
//        let request = URLRequest(url: url!)
        wkView?.loadHTMLString("<iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=330 height=86 src=\"//music.163.com/outchain/player?type=2&id=1392990601&auto=1&height=66\"></iframe>", baseURL: URL(string: "https://music.163.com"))
//        wkView!.load(request)
        
        progressView = UIProgressView(frame: CGRect(x: 0, y: 90, width: self.view.frame.size.width, height: 10))
        progressView?.progressTintColor = UIColor.green
        progressView?.progress = 0
        self.view.addSubview(progressView!)
        wkView?.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
        
//        webView = UIWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-30))
//        let url = URL(string: "https://www.baidu.com")
//        let request = URLRequest(url: url!)
//        webView?.loadRequest(request)
//        webView?.delegate = self
//        self.view .addSubview(webView!)
//
//        let toolView = UIView(frame: CGRect(x: 0, y: self.view.frame.size.height-120, width: self.view.frame.width, height: 30))
//        toolView.backgroundColor = UIColor.purple
//        self.view.addSubview(toolView)
//
//        buttonGoBack = UIButton(frame: CGRect(x: 30, y: 0, width: 70, height: 30))
//        buttonGoBack.setTitle("后退", for: UIControl.State.normal)
//        buttonGoBack.setTitleColor(UIColor.lightGray, for: UIControl.State.disabled)
//        buttonGoBack.addTarget(self, action: #selector(goBack), for: UIControl.Event.touchUpInside)
//
//        buttonGoForward = UIButton(frame: CGRect(x: 130, y: 0, width: 70, height: 30))
//        buttonGoForward.setTitle("前进", for: UIControl.State.normal)
//        buttonGoForward.setTitleColor(UIColor.lightGray, for: UIControl.State.disabled)
//        buttonGoForward.addTarget(self, action: #selector(goForward), for: UIControl.Event.touchUpInside)
//
//        toolView.addSubview(buttonGoBack)
//        toolView.addSubview(buttonGoForward)
    }
    
    @objc func goBack() {
        webView?.goBack()
    }

    @objc func goForward() {
        webView?.goForward()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        buttonGoBack.isEnabled = webView.canGoBack
        buttonGoForward.isEnabled = webView.canGoForward
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body, message.name)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView?.progress = Float(wkView!.estimatedProgress)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
