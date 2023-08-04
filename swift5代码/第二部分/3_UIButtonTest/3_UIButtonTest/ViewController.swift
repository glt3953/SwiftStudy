//
//  ViewController.swift
//  3_UIButtonTest
//
//  Created by 珲少 on 2021/2/3.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建UIButton实例
        let buttonOne = UIButton(type: UIButton.ButtonType.close)
        //设置按钮位置与尺寸
        buttonOne.frame = CGRect(x: 20, y: 40, width: 100, height: 30)
        //设置按钮背景色
        buttonOne.backgroundColor = UIColor.purple
        //设置按钮标题
        buttonOne.setTitle("标题", for: .normal)
        //设置标题文字颜色
        buttonOne.setTitleColor(UIColor.white, for: .normal)
        //添加到当前视图
        self.view.addSubview(buttonOne)
        
        buttonOne.addTarget(self, action: #selector(touchBegin), for: UIControl.Event.touchUpInside)
        
        //设置UIButton控件的内容图片
        buttonOne.setImage(UIImage(named: "image"), for: .normal)
        //设置UIButton控件的背景图片
        buttonOne.setBackgroundImage(UIImage(named: "image"), for: .normal)
        
        //设置标题文字的位置偏移
        buttonOne.titleEdgeInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 20)
        //设置内容图片的位置偏移
        buttonOne.imageEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 30, right: 0)
    }

    @objc func touchBegin()  {
        print("用户点击了按钮")
    }

}

