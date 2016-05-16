//
//  NotificationViewController.swift
//  Weathr
//
//  Created by MWen1 on 5/3/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit
import RealmSwift

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var noNotifications: UILabel!
    
    var userOptions: [UserOptions] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
       
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        showLabel()
        return userOptions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let myCell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "subtitleCell")
        
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! NotificationsTableViewCell
        
        myCell.timeLabel.text = userOptions[indexPath.row].time
        myCell.conditionLabel.text = userOptions[indexPath.row].condition
        myCell.tempLabel.text = userOptions[indexPath.row].temp
        myCell.windLabel.text = "Wind Speed " + userOptions[indexPath.row].wind
        
        //customView(
        
        return myCell
    }
    
   
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            userOptions.removeAtIndex(indexPath.row)
            myTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:  UITableViewRowAnimation.Automatic)
            showLabel()
            
        
        }
    }
    
    func showLabel(){
        
        if userOptions.count > 0{
            noNotifications.hidden = true
        }else{
            noNotifications.hidden = false
        }
        
    }

    @IBAction func clearButton(sender: AnyObject) {
        userOptions.removeAll()
        myTableView.reloadData()
        noNotifications.hidden = false
    }
    
}
