//
//  SettingsViewController.swift
//  Weathr
//
//  Created by MWen1 on 5/3/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableCell: UITableView!
    
    var setting = ["setting part 1", "setting part 2", "setting part 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableCell.delegate = self
        myTableCell.dataSource = self
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setting.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var myCell = myTableCell.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! UITableViewCell
        myCell.textLabel?.text = setting[indexPath.row]
        return myCell
    }

    
}
