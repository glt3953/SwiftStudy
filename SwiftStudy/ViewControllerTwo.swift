//
//  ViewControllerTwo.swift
//  SwiftStudy
//
//  Created by guoliting on 2020/9/27.
//  Copyright © 2020 guoliting. All rights reserved.
//

import UIKit

protocol ViewControllerTwoProtocol {
    func sentedData(data: String)
}

class ViewControllerTwo: UIViewController {
    var data:String?
//    var delegate:ViewControllerTwoProtocol
//    var closure:((String)->Void)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.red
        
        let buttonOne = UIButton(type: UIButton.ButtonType.custom)
        buttonOne.frame = CGRect(x: 20, y: 44+20, width: 100, height: 30)
        buttonOne.backgroundColor = UIColor.purple
        buttonOne.setTitle("返回", for: UIControl.State.normal)
        buttonOne.setTitleColor(UIColor.white, for: UIControl.State.normal)
//        buttonOne.setBackgroundImage(UIImage(named: "bird1"), for: UIControl.State.normal)
        buttonOne.addTarget(self, action: #selector(buttonClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonOne)
        
        let label = UILabel(frame: CGRect(x: 20, y: 200, width: 280, height: 30))
        label.text = data
        self.view.addSubview(label)
    }
    
    init(data:String) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonClick(_ sender: AnyObject) {
//        delegate.sentedData(data: "第2个界面传递的值")
//        self.closure("第2个界面通过闭包传递的值")
        self.dismiss(animated: true, completion: nil)
        print("用户点击了按钮")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
