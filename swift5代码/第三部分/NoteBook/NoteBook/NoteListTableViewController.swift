//
//  NoteListTableViewController.swift
//  NoteBook
//
//  Created by 珲少 on 2021/2/17.
//

import UIKit

class NoteListTableViewController: UITableViewController {
    //数据源数组
   var dataArray = Array<NoteModel>()
   //当前分组
   var name:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
        installNavigationItem()
//        从数据库中读取记事
//        dataArray =  DataManager.getNote(group: name!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        dataArray = DataManager.getNote(group: name!)
        self.tableView.reloadData()
    }
    
    func installNavigationItem() {
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        let deleteItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteGroup))
        self.navigationItem.rightBarButtonItems = [addItem,deleteItem]
    }

    @objc func addNote()  {
        let infoViewController = NoteInfoViewController()
        infoViewController.group = name!
        infoViewController.isNew = true
        self.navigationController?.pushViewController(infoViewController, animated: true)
    }
    @objc func deleteGroup()  {
        let alertController = UIAlertController(title: "警告", message: "您确定要删除此分组下所有记事么？", preferredStyle: .alert)
        let action = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let action2 = UIAlertAction(title: "删除", style: .destructive, handler: {(UIAlertAction) -> Void in
                DataManager.deleteGroup(name: self.name!)
                self.navigationController!.popViewController(animated: true)
            
        })
        alertController.addAction(action)
        alertController.addAction(action2)
        self.present(alertController, animated: true, completion: nil)
    }

    //设置分区数为1
   override func numberOfSections(in tableView: UITableView) -> Int {
       return 1
   }
   //设置行数为数据源中的数据个数
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dataArray.count
   }
   //进行数据载体cell的设置
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cellID = "noteListCellID"
       var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
       if cell == nil {
           cell = UITableViewCell(style: .value1, reuseIdentifier: cellID)
       }
       let model = dataArray[indexPath.row]
       cell?.textLabel?.text = model.title
       cell?.detailTextLabel?.text = model.time
       cell?.accessoryType = .disclosureIndicator
       return cell!
   }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //取消当前cell的选中状态
       tableView.deselectRow(at: indexPath, animated: true)
       let infoViewController = NoteInfoViewController()
       infoViewController.group = name!
       infoViewController.isNew = false
       infoViewController.noteModel = dataArray[indexPath.row]
       self.navigationController?.pushViewController(infoViewController, animated: true)
   }
}

