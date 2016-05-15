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
    
    
    var notify = ["notification part 1", "notification part 2", "notification part 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
       
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        showLabel()
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let myCell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "subtitleCell")
        
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! NotificationsTableViewCell
        
        func customView(a: String, c: String, d: String, e: String, f: String){
            myCell.timeLabel.text = a
            myCell.conditionLabel.text = c
            myCell.tempLabel.text = d
            myCell.humidityLabel.text = "Humidity Level: " + e
            myCell.windLabel.text = "Wind Speed " + f
        }
        
        customView("6:00am", c: "Windy", d: "60F", e: "68", f: "80mph")
        
        return myCell
    }
    
   
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            notify.removeAtIndex(indexPath.row)
            myTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:  UITableViewRowAnimation.Automatic)
            showLabel()
            
        
        }
    }
    
    func showLabel(){
        
        if notify.count > 0{
            noNotifications.hidden = true
        }else{
            noNotifications.hidden = false
        }
        
    }

    @IBAction func clearButton(sender: AnyObject) {
        notify.removeAll()
        myTableView.reloadData()
        noNotifications.hidden = false
    }
    
    
}
