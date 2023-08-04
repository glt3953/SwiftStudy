//
//  ViewController.swift
//  14_UIDatePickerTest
//
//  Created by 珲少 on 2021/2/4.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建UIDatePicker实例
        let dataPicker = UIDatePicker(frame: CGRect(x: 20, y: 100, width: 280, height: 200))
        //设置时间选择器的模式
        dataPicker.datePickerMode = UIDatePicker.Mode.countDownTimer
        //将控件添加到当前视图
        self.view.addSubview(dataPicker)
    }


}

