//
//  WaterFallLayout.swift
//  SwiftStudy
//
//  Created by guoliting on 2020/10/15.
//  Copyright © 2020 guoliting. All rights reserved.
//

import UIKit

class WaterFallLayout: UICollectionViewFlowLayout {
    let itemCount: Int
    var attributeArray: Array<UICollectionViewLayoutAttributes>?
    
    required init?(coder aDecoder: NSCoder) {
        itemCount = 0
        super.init(coder: aDecoder)
    }
    
    init(itemCount:Int) {
        self.itemCount = itemCount
        super.init()
    }
    
    override func prepare() {
        super.prepare()
        self.scrollDirection = .vertical
        attributeArray = Array<UICollectionViewLayoutAttributes>()
        let WIDTH = (UIScreen.main.bounds.size.width-self.minimumInteritemSpacing)/2
        var queueHeight:(one:Int, two:Int) = (0, 0)
        for index in 0..<self.itemCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attris = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            let height:Int = Int(arc4random()%150+40)
            var queue = 0
            if queueHeight.one <= queueHeight.two {
                queueHeight.one += (height + Int(self.minimumInteritemSpacing))
                queue = 0
            } else {
                queueHeight.two += (height + Int(self.minimumInteritemSpacing))
                queue = 1
            }
            let tmpH = queue == 0 ? queueHeight.one-height : queueHeight.two-height
            attris.frame = CGRect(x: (self.minimumInteritemSpacing+WIDTH)*CGFloat(queue), y: CGFloat(tmpH), width: WIDTH, height: CGFloat(height))
            attributeArray?.append(attris)
        }
        
        if queueHeight.one <= queueHeight.two {
            self.itemSize = CGSize(width: WIDTH, height: CGFloat(queueHeight.two*2/self.itemCount) - self.minimumLineSpacing)
        } else {
            self.itemSize = CGSize(width: WIDTH, height: CGFloat(queueHeight.one*2/self.itemCount) - self.minimumLineSpacing)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributeArray
    }
}
