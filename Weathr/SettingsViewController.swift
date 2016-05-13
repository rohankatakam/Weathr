//
//  SettingsViewController.swift
//  Weathr
//
//  Created by MWen1 on 5/5/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit
import RealmSwift

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var setting = ["Test Notification", "Current Time", "Current Location"]
    
    var notification = Notification()
    
    var userOptions = UserOptions()
    
    var currentInfo = CurrentInfo()
    
    
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
        func description(x:Int,y: String, z: String){
            if setting[x] == setting[indexPath.row]{
                cell.subTitleLabel.text = y
                cell.outputLabel.text = z
                
            }
        }
        
        var weather = Weather()
        description(0, y: "Send a test notification", z: "")
        description(1, y: "Current Time", z: currentInfo.time())
        //description(2, y: "Current Location", z: )
        
        return cell
        
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    
        
        if setting[0] == setting[indexPath.row]{
            notification.notify("Test Nofication")
            tableView.reloadData()
        }else{
            tableView.reloadData()
        }
    
        
    }

    

}
