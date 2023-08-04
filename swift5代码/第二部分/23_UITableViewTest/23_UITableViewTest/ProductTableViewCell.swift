//
//  ProductTableViewCell.swift
//  23_UITableViewTest
//
//  Created by 珲少 on 2021/2/7.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var proDetail: UILabel!
    @IBOutlet weak var proTitle: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
