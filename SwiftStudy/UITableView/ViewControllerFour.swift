//
//  ViewControllerFour.swift
//  SwiftStudy
//
//  Created by guoliting on 2020/10/10.
//  Copyright © 2020 guoliting. All rights reserved.
//

import UIKit

class ViewControllerFour: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    var dataArray:Array<Product>?
    var dataArray:Array<String>?
    var titleArray:[String]?

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
        
        let pro1 = Product()
        pro1.imageName = "bird1"
        pro1.name = "第一只鸟"
        pro1.subTitle = "嘤其鸣矣，求其友声"
        pro1.price = "59元"
        let pro2 = Product()
        pro2.imageName = "bird2"
        pro2.name = "第二只鸟"
        pro2.subTitle = "空谷足音，跫然色喜"
        pro2.price = "99元"
//        dataArray = [pro1, pro2]
        dataArray = Array<String>()
        for _ in 0...3 {
            dataArray?.append("联系人")
        }
        titleArray = ["#", "A", "B", "C", "D", "E", "F", "G", "H", "更多"]
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
//        tableView.register(UINib.init(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCellId")
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "TableViewCellId")
//        tableView.isEditing = true
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath)
        cell.textLabel?.text = dataArray![indexPath.row]
        
//        let cell:ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath) as! ProductTableViewCell
////        let cell:ProductTableViewTwoCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath) as! ProductTableViewTwoCell
//        let model = dataArray![indexPath.row]
//        cell.iconView.image = UIImage(named: model.imageName!)
//        cell.proTitle.text = model.name
//        cell.proDetail.text = model.subTitle
//        cell.price.text = model.price
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titleArray!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "我是分区头部"
        return titleArray![section]
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "我是分区尾部"
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 120))
//        view.backgroundColor = UIColor.red
//
//        return view
//    }
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
//        view.backgroundColor = UIColor.green
//
//        return view
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 120
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 50
//    }
//
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if indexPath.row == 0 {
//            return .insert
//        } else {
//            return .delete
//        }
//    }
//
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        if indexPath.row == 0 {
//            return "插入"
//        } else {
//            return "删除"
//        }
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            print("点击了删除按钮")
//            dataArray?.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
//        } else {
//            print("点击了插入按钮")
//            let pro = Product()
//            pro.imageName = "bird3"
//            pro.name = "第三只鸟"
//            pro.subTitle = "何以解忧，唯有杜康"
//            pro.price = "129元"
//            dataArray?.insert(pro, at: indexPath.row)
//            tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.fade)
//        }
//    }
//
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let tmp = dataArray![sourceIndexPath.row]
//        let tmp2 = dataArray![destinationIndexPath.row]
//        dataArray![sourceIndexPath.row] = tmp2
//        dataArray![destinationIndexPath.row] = tmp
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
