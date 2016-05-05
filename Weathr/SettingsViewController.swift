//
//  SettingsViewController.swift
//  Weathr
//
//  Created by MWen1 on 5/5/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    tableView.delegate = self
    tableView.dataSource = self
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! SettingTableViewCell
        
        func customize(a: String, b: String, c: Bool, d:String){
            cell.titleLabel.text = a
            cell.subTitleLabel.text = b
            cell.switchOutlet.hidden = c
            cell.outputLabel.text = d
        }
        
        return cell
        
    }

    

}
