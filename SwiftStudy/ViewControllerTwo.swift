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

class ViewControllerTwo: UIViewController, UIScrollViewDelegate {
    var data:String?
    var imageView:UIImageView?
//    var delegate:ViewControllerTwoProtocol
//    var closure:((String)->Void)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarItem.title = "推荐"
        let item = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 1)
        self.tabBarItem = item
        self.view.backgroundColor = UIColor.green
//        self.title = "第1个视图控制器"
        
        let scrollView = UIScrollView(frame: self.view.frame)
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        let subView1 = UIView(frame: self.view.frame)
        subView1.backgroundColor = UIColor.red
        let subView2 = UIView(frame: CGRect(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        subView2.backgroundColor = UIColor.blue
        scrollView.addSubview(subView1)
        scrollView.addSubview(subView2)
//        scrollView.contentSize = CGSize(width: self.view.frame.size.width*2, height: self.view.frame.size.height)
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        
        imageView = UIImageView(image: UIImage(named: "IMG_6521"))
        imageView?.frame = self.view.frame
        scrollView.addSubview(imageView!)
        scrollView.contentSize = self.view.frame.size
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
        
        let buttonOne = UIButton(type: UIButton.ButtonType.custom)
        buttonOne.frame = CGRect(x: 20, y: 44+60, width: 100, height: 30)
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
    
//    init(data:String) {
//        self.data = data
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    @objc func buttonClick(_ sender: AnyObject) {
//        delegate.sentedData(data: "第2个界面传递的值")
//        self.closure("第2个界面通过闭包传递的值")
        self.dismiss(animated: true, completion: nil)
        print("用户点击了按钮")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView!
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
