//
//  SettingsTableViewController.swift
//  Weathr
//
//  Created by MWen1 on 5/5/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    var setting = ["Daily Notifications", "Frequency", "Test Notification"]
    
    var notification = Notification()
    
    var userOptions = UserOptions()

////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()



    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return setting.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mySettingCell", forIndexPath: indexPath) as! SettingsTableViewCell
        
        cell.titleLabel.text = setting[indexPath.row]
        
        //func for table View Cell
        func description(x:Int,y: String, z: String, a: Bool){
            if setting[x] == setting[indexPath.row]{
                cell.subTitleLabel.text = y
                cell.outputLabel.text = z
                cell.switchOutlet.hidden = a
                
            }
            
            
            
        }
        
        
        description(0, y: userOptions.dailyNotificationSubTitle, z: userOptions.dailyNotification,a:false)
        description(1, y: userOptions.freqencySubtitle, z: userOptions.frequency, a:false)
        description(2, y: "Send a test notification", z: "", a: true)
        
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        var hour = ""
        var minute = ""
        
        if setting[0] == setting[indexPath.row]{
            
            let alert = UIAlertController(title: "Time", message: "Input Time You Want to Be Notifited", preferredStyle: .Alert)
            //textfield
            alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
                textField.placeholder = "Hour"
                textField.keyboardType = UIKeyboardType.NumberPad
                
                
            }
            alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
                textField.placeholder = "Minute"
                textField.keyboardType = UIKeyboardType.NumberPad
                
            }
            //cancel Button
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
                alert.textFields![0].resignFirstResponder()
                self.tableView.reloadData()
            }
            alert.addAction(cancelAction)
            
            //setting time
            func settingTime(x: String){
                let hour = alert.textFields![0] as UITextField
                let minute = alert.textFields![1] as UITextField
                self.userOptions.dailyNotification = "\(hour.text!):\(minute.text!)\(x)"
                self.tableView.reloadData()
            }
            
            //Add AM
            let addAM = UIAlertAction(title: "AM", style: .Default) { (action) -> Void in
                settingTime("am")
                
                
            }
            alert.addAction(addAM)
            
            //Add PM
            let addPM = UIAlertAction(title: "PM", style: .Default, handler: { (action) in
                settingTime("pm")
            })
            
            
            alert.addAction(addPM)
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        }else if setting[1] == setting[indexPath.row]{
            let alert = UIAlertController(title: "Frequency", message: "How Frequently Do You Want to Be Notified?", preferredStyle: .Alert)
            //textfield
            alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
                textField.placeholder = "Hour"
                textField.keyboardType = UIKeyboardType.NumberPad
            }
            //cancel Button
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
                alert.textFields![0].resignFirstResponder()
                self.tableView.reloadData()
            }
            alert.addAction(cancelAction)
            //addAction
            let addAction = UIAlertAction(title: "Save", style: .Default, handler: { (action) in
                let hour = alert.textFields![0] as UITextField
                if Int(hour.text!) > 1{
                    self.userOptions.frequency = "\(hour.text!) hours"
                }else{
                    self.userOptions.frequency = "1 hour"
                }
                
                self.tableView.reloadData()
            })
            alert.addAction(addAction)
            
            
            self.presentViewController(alert, animated: true, completion: nil)
        }else if setting[2] == setting[indexPath.row]{
            
            notification.notify("Test Nofication")
            tableView.reloadData()
        }else{
            var alertView = UIAlertView()
            alertView.addButtonWithTitle("Ok")
            alertView.title = "This Isn't Working"
            alertView.message = setting[indexPath.row]
            alertView.show()
        }
        
        
    }


}
