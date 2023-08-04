//
//  ViewController.swift
//  21_UIWebViewTest
//
//  Created by 珲少 on 2021/2/7.
//

import UIKit
import WebKit

class ViewController: UIViewController,UIWebViewDelegate, WKScriptMessageHandler {
    
    var webView:UIWebView?
    var buttonGoBack:UIButton!
    var buttonGoForward:UIButton!
    var wkView:WKWebView?
    override func viewDidLoad() {
        super.viewDidLoad()
//        //创建WebView视图
//        webView = UIWebView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-30))
//        //创建网页url
//        let url = URL(string: "http://www.baidu.com")
//        //创建请求
//        let request = URLRequest(url: url!)
//        //加载网页
//        webView!.loadRequest(request)
//        webView?.delegate = self
//        self.view.addSubview(webView!)
//        //创建工具条
//        let toolView = UIView(frame: CGRect(x: 0, y: self.view.frame.size.height-30, width: self.view.frame.size.width, height: 30))
//        toolView.backgroundColor = UIColor.purple
//        self.view.addSubview(toolView)
//        //添加两个功能按钮
//        buttonGoBack = UIButton(frame: CGRect(x: 30, y: 0, width: 70, height: 30))
//        buttonGoBack.setTitle("后退", for: .normal)
//        buttonGoBack.setTitleColor(UIColor.lightGray, for: .disabled)
//        buttonGoBack.addTarget(self, action: #selector(goBack), for: UIControl.Event.touchUpInside)
//
//        buttonGoForward = UIButton(frame: CGRect(x: 130, y: 0, width: 70, height: 30))
//        buttonGoForward.addTarget(self, action: #selector(goForward), for: UIControl.Event.touchUpInside)
//        buttonGoForward.setTitle("前进", for: .normal)
//        buttonGoForward.setTitleColor(UIColor.lightGray, for: .disabled)
//        toolView.addSubview(buttonGoBack)
//        toolView.addSubview(buttonGoForward)
        
        //创建网页配置
        let configuration = WKWebViewConfiguration()
        let prefrence = WKPreferences()
        //设置网页界面的最小字号
        prefrence.minimumFontSize = 0
        //设置是否支持JavaScript脚本 默认为true
        prefrence.javaScriptEnabled = true
        //设置是否允许不经过用户交互由JacaScript代码自动打开窗口
        prefrence.javaScriptCanOpenWindowsAutomatically = true
        configuration.preferences = prefrence
        //对网页视图进行实例化
        wkView = WKWebView(frame: self.view.frame, configuration: configuration)
        self.view.addSubview(wkView!)
        let url = URL(string: "http://www.baidu.com")
        let request = URLRequest(url: url!)
        wkView!.load(request)
        
        //进行原生与JavaScript交互配置
        let userContentController = WKUserContentController()
        //设置代理并且注册要被javaScript代码调用的原生方法名称
        userContentController.add(self, name: "nativeFunc")
        //向网页中注入一段javaScript代码
        let javaScriptString = "function userFunc(){window.webkit.messageHandlers.nativeFunc.postMessage({\"班级\":\"珲少学堂\"})};userFunc()"
        let userScript = WKUserScript(source: javaScriptString, injectionTime: .atDocumentStart, forMainFrameOnly: false)
        //进行注入
        userContentController.addUserScript(userScript)
        configuration.userContentController = userContentController
    }
    
    @objc func goBack()  {
        webView!.goBack()
    }
        
    @objc func goForward()  {
        webView!.goForward()
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            print(message.body,message.name)
    }

}

