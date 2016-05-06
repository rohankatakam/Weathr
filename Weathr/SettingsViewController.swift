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
    
    var setting = ["Test Notification"]
    
    var notification = Notification()
    
    var userOptions = UserOptions()

    
    override func viewDidLoad() {
        super.viewDidLoad()

    tableView.delegate = self
    tableView.dataSource = self
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setting.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! SettingTableViewCell
        
         cell.titleLabel.text = setting[indexPath.row]
        
        //func for table View Cell
        func description(x:Int,y: String, z: String, a: Bool){
            if setting[x] == setting[indexPath.row]{
                cell.subTitleLabel.text = y
                cell.outputLabel.text = z
                cell.switchOutlet.hidden = a
                
            }
        }
        
        
        description(0, y: "Send a test notification", z: "", a: true)
        
        return cell
        
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    
        
    if setting[0] == setting[indexPath.row]{
            notification.notify("Test Nofication")
            tableView.reloadData()
        }
        
        
    }

    

}
