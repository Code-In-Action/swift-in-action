//
//  Itemell.swift
//  Homepwner
//
//  Created by Go7hic on 2019/10/7.
//  Copyright © 2019 Go7hic. All rights reserved.
//
import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var serialNumberLabel:UILabel!
    @IBOutlet var valueLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
}
