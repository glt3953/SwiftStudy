//
//  ViewControllerFive.swift
//  SwiftStudy
//
//  Created by guoliting on 2020/10/10.
//  Copyright © 2020 guoliting. All rights reserved.
//

import UIKit

class ViewControllerFive: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarItem.title = "视图五"
        let item = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.bookmarks, tag: 1)
        self.tabBarItem = item
        self.view.backgroundColor = UIColor.gray
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
