//
//  SettingCellTableViewCell.swift
//  Weathr
//
//  Created by MWen1 on 5/3/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class SettingCellTableViewCell: UITableViewCell {

    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBOutlet weak var settingsSwitch: UISwitch!
    
    
    @IBAction func handledSwitchChange(sender: UISwitch) {
        print("switched")
    
    }
}