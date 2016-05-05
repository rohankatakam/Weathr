//
//  SettingsTableViewController.swift
//  Weathr
//
//  Created by MWen1 on 5/5/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()


    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 10
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mySettingCell", forIndexPath: indexPath) as! SettingsTableViewCell
        
        return cell
    }

}
