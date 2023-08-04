//
//  ViewController.swift
//  19_UITabBarControllerTest
//
//  Created by 珲少 on 2021/2/7.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ///设置标签标题
        self.tabBarItem.title = "首页"
        self.view.backgroundColor = UIColor.red
        
        //设置标签标题
        self.tabBarItem.title = "首页"
        //设置标签图标
        self.tabBarItem.image = UIImage(named: "imageNormal")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        //设置选中状态下的
        self.tabBarItem.selectedImage = UIImage(named: "imageSelect")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        self.view.backgroundColor = UIColor.red
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
