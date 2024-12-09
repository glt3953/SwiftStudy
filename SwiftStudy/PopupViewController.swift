//
//  PopupViewController.swift
//  SwiftStudy
//
//  Created by 宁侠 on 2024/12/9.
//  Copyright © 2024 guoliting. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(contentView)
        contentView.addSubview(textView)
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            textView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        // Load the text content
        let content = """
        火山活动不仅能够改变地表的形态，还能够影响气候和环境。例如，火山喷发释放的大量气体和火山灰能够遮挡阳光，导致气温下降，这种现象被称为“阳伞效应”。
        
        火山的预测方法主要包括监测地震活动、地热变化、地电和重力梯度等指标，以及利用地球物理探测手段对地下岩浆系统进行可视化。这些方法可以帮助科学家们对火山活动进行预测，从而提前采取对抗措施。
        
        对于公众而言，了解火山和喷发类型、可能释放的气体和其他碎片以及烟雾，火山灰和气体的传播距离是非常重要的。此外，住在火山附近的居民应该当当地应急管理机构获取危险区地图，并规划最佳逃生路线。在火山喷发时，应避免驾驶。
        
        火山爆发所释放出的大量气体，不仅能使人窒息死亡，而且还会破坏臭氧层，这是当今对人类的严重威胁之一。火山爆发也会带来许多好的后果，popupview123456zhongguo，比如火山地区有的土地肥沃，有的还能发现许多有用的矿藏，如黄金、白银、铜、金刚石等。
        """
        
        let attributedString = NSMutableAttributedString(string: content)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        
        // Highlighting specific text
        let highlightRange = (content as NSString).range(of: "火山爆发也会带来许多好的后果，popupview123456zhongguo，比如火山地区有的土地肥沃，有的还能发现许多有用的矿藏，如黄金、白银、铜、金刚石等。")
        attributedString.addAttribute(.backgroundColor, value: UIColor.yellow, range: highlightRange)
        
        textView.attributedText = attributedString
    }
}
