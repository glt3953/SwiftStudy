//
//  TipButton.swift
//  ChineseChess
//
//  Created by 珲少 on 2021/2/17.
//

import UIKit

//该类用于标记当前选中棋子可以移动到的位置
class TipButton: UIButton {
    //提供一个自定义的构造方法
    init(center:CGPoint){
        super.init(frame: CGRect(x: center.x-10, y: center.y-10, width: 20, height: 20))
        installUI()
    }
    //加载UI
    func installUI()  {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.orange
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
