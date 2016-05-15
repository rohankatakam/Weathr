//
//  NotifyRingViewController.swift
//  Weathr
//
//  Created by MWen1 on 5/6/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit
import RealmSwift

class NotifyRingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let sections = ["Ring", "Morning", "Afternoon"]
    
    let detail = [["Daily Notifications", "Update Notifications"],["Time"], ["Time"]]
    
    var output = [["Get Notifications Daily", "Get Notification Update"], ["6:00am"], ["6:00pm"]]
    
    let buttonHidden = [[false,false],[true],[true]]
    
    var defaultz = UIColor.clearColor()
    
    var background = UIColor()
    
    var timz = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! NotifyRingTableViewCell
        
        cell.titleLabel.text = detail[indexPath.section][indexPath.row]
        cell.conditionLabel.text = output[indexPath.section][indexPath.row]
        cell.switchOnOff.hidden = buttonHidden[indexPath.section][indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detail[section].count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  sections[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        func alert(a:String, b:String){
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
                tableView.reloadData()
            }
            alert.addAction(cancelAction)
            
            //setting time
            func settingTime(x: String){
                let hour = alert.textFields![0] as UITextField
                let minute = alert.textFields![1] as UITextField
                var stringMinute: String = String(minute.text!)
                tableView.reloadData()
                
                if Int(hour.text!) < 12 && Int(minute.text!) < 60{
                    if Int(minute.text!) < 10{
                        stringMinute = "0\(stringMinute)"
                    }
                    output[indexPath.section][indexPath.row] = "\(hour.text!):\(stringMinute)\(x)"
                }else{
                    //nothing
                }
                
                
            }
            
            //Add AM
            let addAM = UIAlertAction(title: a, style: .Default) { (action) -> Void in
                settingTime(b)
                
                
            }
            alert.addAction(addAM)
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    
        if output[1][0] == output[indexPath.section][indexPath.row]{
            print("AM")
            alert("AM", b: "am")
        }else if output[2][0] == output[indexPath.section][indexPath.row]{
            print("PM")
            alert("PM", b: "pm")
        }
    
        tableView.reloadData()
    
    
    
    
    }
   

}
