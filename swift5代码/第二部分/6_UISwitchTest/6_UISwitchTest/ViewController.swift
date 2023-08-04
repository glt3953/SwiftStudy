//
//  ViewController.swift
//  6_UISwitchTest
//
//  Created by 珲少 on 2021/2/3.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //实例化开关控件
        let swi = UISwitch()
        //设置控件的位置
        swi.center = CGPoint(x: 100, y: 100)
        //设置开启状态的颜色
        swi.onTintColor = UIColor.green
        //设置普通状态的颜色
        swi.tintColor = UIColor.red
        //设置开关滑块的颜色
        swi.thumbTintColor = UIColor.purple
        //设置开关初始状态
        swi.isOn = true
        //添加到当前视图上
        self.view.addSubview(swi)
        
        swi.addTarget(self, action: #selector(change), for: UIControl.Event.valueChanged)
    }
    
     @objc func change(swi:UISwitch)  {
           //可以从传递进来的UISwitch控件中获取开关的状态
           print("开关状态\(swi.isOn)")
       }


}

