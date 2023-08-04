//
//  ViewController.swift
//  22_UIScrollViewText
//
//  Created by 珲少 on 2021/2/7.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //进行UIScrollView的实例化
        let scrollView = UIScrollView(frame: self.view.frame)
        //将滚动视图添加到当前界面
        self.view.addSubview(scrollView)
        //创建两个内容视图
        let subView1 = UIView(frame: self.view.frame)
        subView1.backgroundColor = UIColor.red
        let subView2 = UIView(frame: CGRect(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        subView2.backgroundColor = UIColor.blue
        //将内容视图添加进UIScrollView视图中
        scrollView.addSubview(subView1)
        scrollView.addSubview(subView2)
        //设置UIScrollView实例的
        scrollView.contentSize = CGSize(width: self.view.frame.size.width*2, height: self.view.frame.size.height)
    }


}

