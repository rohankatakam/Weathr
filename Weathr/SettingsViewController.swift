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
    
    var setting = ["Daily Notifications", "Frequency", "Test Notification"]
   
    var notification = Notification()
    
    var userOptions = UserOptions()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableCell.delegate = self
        myTableCell.dataSource = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        myTableCell.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setting.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        //let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "myCell")
        
        let cellIdentifier = "myCell"
        
        var cell = myTableCell.dequeueReusableCellWithIdentifier("myCell")! as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: cellIdentifier)
            //func for table View Cell
            func description(x:Int,y: String){
                if setting[x] == setting[indexPath.row]{
                    cell!.detailTextLabel?.text = y
                }
            }
            
            
            description(0, y: userOptions.dailyNotificationSubTitle)
            description(1, y: userOptions.freqencySubtitle)
            description(2, y: "Send a test notification")

        }
        
        
        /////
        cell!.textLabel?.text = setting[indexPath.row]
        
        
        
       
        return cell!
    }
    
  
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
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
                self.myTableCell.reloadData()
            }
            alert.addAction(cancelAction)
            
            //setting time
            func settingTime(x: String){
                let hour = alert.textFields![0] as UITextField
                let minute = alert.textFields![1] as UITextField
                self.userOptions.dailyNotification = "\(hour.text!):\(minute.text!)\(x)"
                self.myTableCell.reloadData()
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
                self.myTableCell.reloadData()
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
                
                self.myTableCell.reloadData()
            })
            alert.addAction(addAction)
            

            self.presentViewController(alert, animated: true, completion: nil)
        }else if setting[2] == setting[indexPath.row]{
            
            notification.notify("Test Nofication")
            myTableCell.reloadData()
        }else{
            var alertView = UIAlertView()
            alertView.addButtonWithTitle("Ok")
            alertView.title = "This Isn't Working"
            alertView.message = setting[indexPath.row]
            alertView.show()
        }
        
        
    }
        
    
        
}
        
        
        
        


