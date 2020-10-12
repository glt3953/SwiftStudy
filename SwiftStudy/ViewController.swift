//
//  ViewController.swift
//  SwiftStudy（Swift 教程 https://www.runoob.com/swift/swift-tutorial.html）
//  https://developer.apple.com/swift/
//
//  Created by guoliting on 2019/8/27.
//  Copyright © 2019 guoliting. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewControllerTwoProtocol {
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        let barItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneClick))
        self.navigationItem.leftBarButtonItem = barItem
        
        self.tabBarItem.title = "首页"
//        self.tabBarItem.image = UIImage(named: "bird1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        self.tabBarItem.selectedImage = UIImage(named: "bird2")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        self.view.backgroundColor = UIColor.red
        
        let buttonOne = UIButton(type: UIButton.ButtonType.custom)
        buttonOne.frame = CGRect(x: 20, y: 44+60, width: 100, height: 30)
        buttonOne.backgroundColor = UIColor.purple
        buttonOne.setTitle("跳转", for: UIControl.State.normal)
        buttonOne.setTitleColor(UIColor.white, for: UIControl.State.normal)
//        buttonOne.setBackgroundImage(UIImage(named: "bird1"), for: UIControl.State.normal)
        buttonOne.addTarget(self, action: #selector(buttonClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonOne)
        
        let buttonAlert = UIButton(type: UIButton.ButtonType.custom)
        buttonAlert.frame = CGRect(x: 20, y: 44+100, width: 100, height: 30)
        buttonAlert.backgroundColor = UIColor.purple
        buttonAlert.setTitle("警告框弹窗", for: UIControl.State.normal)
        buttonAlert.setTitleColor(UIColor.white, for: UIControl.State.normal)
//        buttonOne.setBackgroundImage(UIImage(named: "bird1"), for: UIControl.State.normal)
        buttonAlert.addTarget(self, action: #selector(buttonAlertClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonAlert)
        
        let buttonSheet = UIButton(type: UIButton.ButtonType.custom)
        buttonSheet.frame = CGRect(x: 20, y: 44+140, width: 100, height: 30)
        buttonSheet.backgroundColor = UIColor.purple
        buttonSheet.setTitle("抽屉弹窗", for: UIControl.State.normal)
        buttonSheet.setTitleColor(UIColor.white, for: UIControl.State.normal)
//        buttonOne.setBackgroundImage(UIImage(named: "bird1"), for: UIControl.State.normal)
        buttonSheet.addTarget(self, action: #selector(buttonSheetClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonSheet)
        
//        let label = UILabel(frame: CGRect(x: 20, y: 200, width: 280, height: 30))
//        self.view.addSubview(label)
    }
    
    @objc func buttonClick(_ sender: AnyObject) {
        let action = UIAlertAction(title: "按钮一", style: UIAlertAction.Style.default) { (action) in
            print("用户点击了按钮一")
        }
//        let viewController = ViewControllerTwo(data: "这是从第一个界面传递进来的数据")
        let viewController = ViewControllerTwo()
        viewController.data = "这是从第一个界面传递进来的数据"
//        viewController.delegate = self
//        viewController.closure = {(data:String) in
//            let label = UILabel(frame: CGRect(x: 20, y: 200, width: 280, height: 30))
//            label.text = data
//        }
//        self.present(viewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
        print("用户点击了按钮")
    }
    
    @objc func buttonAlertClick(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "我是警告框弹窗", message: "这里填写内容", preferredStyle: UIAlertController.Style.alert)
//        let alertAction1 = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
//        let alertAction2 = UIAlertAction(title: "删除", style: UIAlertAction.Style.destructive, handler: nil)
//        let alertAction3 = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        let alertAction1 = UIAlertAction(title: "登录", style: UIAlertAction.Style.default) {
            (action) in print(alertController.textFields?.first?.text ?? "未输入文字")
        }
        let alertAction2 = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
//        alertController.addAction(alertAction3)
        alertController.addTextField { (textField) in
            textField.placeholder = "请输入用户名"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "请输入密码"
            textField.isSecureTextEntry = true
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func buttonSheetClick(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "我是抽屉弹窗", message: "这里填写内容", preferredStyle: UIAlertController.Style.actionSheet)
        let alertAction1 = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) {
            (action) in print(alertController.textFields?.first?.text ?? "未输入文字")
        }
        let alertAction2 = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func doneClick(_ sender: AnyObject) {
        print("用户点击了Done按钮")
    }
    
    func sentedData(data: String) {
        let label = UILabel(frame: CGRect(x: 20, y: 200, width: 280, height: 30))
        label.text = data
        self.view.addSubview(label)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    deinit {
        print("deinit")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
