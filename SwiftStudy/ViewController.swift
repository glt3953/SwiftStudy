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
        
//        let label = UILabel(frame: CGRect(x: 20, y: 200, width: 280, height: 30))
//        self.view.addSubview(label)
    }
    
    @objc func buttonClick(_ sender: AnyObject) {
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
