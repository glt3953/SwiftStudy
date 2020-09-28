//
//  ViewController.swift
//  SwiftStudy（Swift 教程 https://www.runoob.com/swift/swift-tutorial.html）
//  https://developer.apple.com/swift/
//
//  Created by guoliting on 2019/8/27.
//  Copyright © 2019 guoliting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let buttonOne = UIButton(type: UIButton.ButtonType.custom)
        buttonOne.frame = CGRect(x: 20, y: 44+20, width: 100, height: 30)
        buttonOne.backgroundColor = UIColor.purple
        buttonOne.setTitle("跳转", for: UIControl.State.normal)
        buttonOne.setTitleColor(UIColor.white, for: UIControl.State.normal)
//        buttonOne.setBackgroundImage(UIImage(named: "bird1"), for: UIControl.State.normal)
        buttonOne.addTarget(self, action: #selector(buttonClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonOne)
    }
    
    @objc func buttonClick(_ sender: AnyObject) {
        let viewController = ViewControllerTwo()
        viewController.data = "这是从第一个界面传递进来的数据"
        self.present(viewController, animated: true, completion: nil)
        print("用户点击了按钮")
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
