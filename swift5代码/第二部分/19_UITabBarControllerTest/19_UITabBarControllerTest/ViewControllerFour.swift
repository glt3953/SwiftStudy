//
//  ViewControllerFour.swift
//  19_UITabBarControllerTest
//
//  Created by 珲少 on 2021/2/7.
//

import UIKit

class ViewControllerFour: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.title = "个人中心"
        self.view.backgroundColor = UIColor.orange
        //设置提示文字
        self.tabBarItem.badgeValue = "新消息"
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
