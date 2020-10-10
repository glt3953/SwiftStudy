//
//  ViewControllerThree.swift
//  SwiftStudy
//
//  Created by guoliting on 2020/10/10.
//  Copyright © 2020 guoliting. All rights reserved.
//

import UIKit

class ViewControllerThree: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarItem.title = "直播"
        self.navigationController?.tabBarItem.title = "直播"
        self.view.backgroundColor = UIColor.blue
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
