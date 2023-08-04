//
//  ViewControllerTwo.swift
//  19_UITabBarControllerTest
//
//  Created by 珲少 on 2021/2/7.
//

import UIKit

class ViewControllerTwo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //使用系统风格的标签
       let item = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 1)
       self.tabBarItem = item
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
