//
//  ViewController.swift
//  2_UILabelTest
//
//  Created by 珲少 on 2021/2/3.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建UILabel控件对象
        let label = UILabel(frame: CGRect(x: 20, y: 120, width: 200, height: 30))
        //设置文本
        label.text = "我是一个普通的便签控件"
        //将其添加到当前视图上
        self.view.addSubview(label)
        
        //创建自定义的UILabel控件对象
        let label2 = UILabel(frame: CGRect(x: 20, y: 160, width: 200, height: 30))
        //设置文本
        label2.text = "我是一个自定义的便签控件"
        //设置字体 这里设置字号为20 加粗的系统字体
        label2.font = UIFont.boldSystemFont(ofSize: 20)
        //设置字体颜色
        label2.textColor = UIColor.red
        //设置阴影颜色
        label2.shadowColor = UIColor.green
        //设置阴影的位置偏移
        label2.shadowOffset = CGSize(width: 2, height: 2)
        //设置文字对齐模式
        label2.textAlignment = NSTextAlignment.center
        //将其添加到当前视图上
        self.view.addSubview(label2)
        
        //创建长文本的UILabel控件对象
          let label3 = UILabel(frame: CGRect(x: 20, y: 210, width: 200, height: 150))
          //设置文本
          label3.text = "我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本"
          //设置显示行数
          label3.numberOfLines = 7;
          self.view.addSubview(label3)
        
        //创建UILabel控件对象
        let label4 = UILabel(frame: CGRect(x: 20, y: 390, width: 200, height: 30))
        //设置个性化文本
        let attri = NSMutableAttributedString(string: "我是个性化文本")
        attri.addAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20),NSAttributedString.Key.foregroundColor:UIColor.red], range: NSRange(location: 0, length: 2))
        attri.addAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor:UIColor.blue], range: NSRange(location: 3, length: 3))
        label4.attributedText = attri
        //将其添加到当前视图上
        self.view.addSubview(label4)
    }
}

