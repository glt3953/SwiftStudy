//
//  ViewController.swift
//  10_UIActivityIndicatorViewTest
//
//  Created by 珲少 on 2021/2/4.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置当前界面的背景色
        self.view.backgroundColor = UIColor.red
        let activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        activity.center = self.view.center;
        //开始播放
        activity.startAnimating()
        //添加到当前视图
        self.view.addSubview(activity)
    }


}

