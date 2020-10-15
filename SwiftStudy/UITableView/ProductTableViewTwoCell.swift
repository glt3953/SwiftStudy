//
//  ProductTableViewTwoCell.swift
//  SwiftStudy
//
//  Created by guoliting on 2020/10/14.
//  Copyright © 2020 guoliting. All rights reserved.
//

import UIKit

class ProductTableViewTwoCell: UITableViewCell {
    var price: UILabel!
    var proDetail: UILabel!
    var proTitle: UILabel!
    var iconView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        iconView = UIImageView(frame: CGRect(x: 5, y: 10, width: 30, height: 50))
        self.addSubview(imageView!)
        
        proTitle = UILabel(frame: CGRect(x: iconView.frame.origin.x+iconView.frame.size.width+5, y: iconView.frame.origin.y, width: 50, height: 10))
        self.addSubview(proTitle)
        
        proDetail = UILabel(frame: CGRect(x: proTitle.frame.origin.x, y: proTitle.frame.origin.y+proTitle.frame.size.height+5, width: proTitle.frame.size.width, height: iconView.frame.size.height - proTitle.frame.size.height-5))
        self.addSubview(proDetail)
        
        price = UILabel(frame: CGRect(x: 100, y: proDetail.frame.origin.y+proDetail.frame.size.height+5, width: 30, height: 10))
        self.addSubview(price)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
