//
//  ViewController.swift
//  17_UIViewControllerTest2
//
//  Created by 珲少 on 2021/2/5.
//

import UIKit

class ViewController: UIViewController,ViewControllerTwoProtocol {

    var label:UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        label = UILabel(frame: CGRect(x: 20, y: 100, width: 280, height: 30))
        self.view.addSubview(label!)
    }

    @IBAction func touch(_ sender: Any) {
        //跳转到第2个ViewController界面
        let viewController = ViewControllerTwo(data: "这是从第一个界面传递进来的数据")
        viewController.delegate=self
        //对闭包进行赋值
        viewController.closure = {(data:String) in
            self.label?.text = data
        }
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sentData(data: String) {
        //进行label的赋值
        self.label?.text = data
    }
    
}

