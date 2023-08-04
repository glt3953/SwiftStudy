//
//  ViewController.swift
//  33_SnapKitTest
//
//  Created by 珲少 on 2021/2/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.backgroundColor = UIColor.red
        //添加约束前 必须将视图添加到其父视图上
        self.view.addSubview(view)
        //使用SnapKit添加约束
        view.snp.makeConstraints { (make) in
            make.left.top.equalTo(20)
            make.bottom.right.equalTo(-20)
        }
    }


}

