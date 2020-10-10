//
//  ViewControllerFour.swift
//  SwiftStudy
//
//  Created by guoliting on 2020/10/10.
//  Copyright © 2020 guoliting. All rights reserved.
//

import UIKit

class ViewControllerFour: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarItem.title = "个人中心"
        self.navigationController?.tabBarItem.title = "个人中心"
        if #available(iOS 10.0, *) {
            self.navigationController?.tabBarItem.badgeColor = UIColor.red
        } else {
            // Fallback on earlier versions
        }
        self.navigationController?.tabBarItem.badgeValue = "新消息"
        self.view.backgroundColor = UIColor.orange
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
