//
//  SettingsTableViewCell.swift
//  Weathr
//
//  Created by MWen1 on 5/4/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleText: UILabel!
   
    @IBOutlet weak var subTitle: UILabel!
    
    @IBOutlet weak var `switch`: UILabel!
    
    @IBOutlet weak var outputText: UILabel!
    
    var delegate: cellModelChanged!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
