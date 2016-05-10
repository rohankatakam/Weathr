//
//  NotifyRingTableViewCell.swift
//  Weathr
//
//  Created by MWen1 on 5/6/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class NotifyRingTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var backgroundCell: UIView!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
