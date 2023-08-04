//
//  ViewControllerTwo.swift
//  17_UIViewControllerTest2
//
//  Created by 珲少 on 2021/2/5.
//

import UIKit

protocol ViewControllerTwoProtocol {
    func sentData(data:String)
}

class ViewControllerTwo: ViewController {
    var data:String?
    var delegate:ViewControllerTwoProtocol?
    var closure:((String)->Void)?
    init(data:String) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        //添加返回按钮
        self.view.backgroundColor = UIColor.red
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
        button.setTitle("返回", for: UIControl.State())
        button.addTarget(self, action: #selector(ret), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        
        //添加一个文本标签
        let label = UILabel(frame: CGRect(x: 20, y: 200, width: 280, height: 30))
        label.text = data
        self.view.addSubview(label)
    }
    
    @objc func ret() {
        self.closure!("第2个界面通过闭包传递的值")
        self.dismiss(animated: true, completion: nil)
    }
}
