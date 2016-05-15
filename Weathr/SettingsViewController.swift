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
    
    var setting = ["Test Notification", "Current Time", "Units", "Share Weather Options"]
    
    var notification = Notification()
    
    var userOptions = UserOptions()
    
    var currentInfo = CurrentInfo()
    
    var unit = ""
    
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
        
        description(0, y: "Send a test notification", z: "")
        description(1, y: "Update Current Time Current Time", z: currentInfo.time())
        
        
        if unit == "" {
            
            unit = "F"
            
        }
        
        description(2, y: "Change between Fahrenheit to Celcius", z: unit)
        description(3, y: "Share the weather with someone special!", z: "")
       
        
        return cell
        
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    
        
        if setting[0] == setting[indexPath.row]{
            notification.notify("Test Nofication")
            tableView.reloadData()
        }else if setting[1] == setting[indexPath.row]{
            print(currentInfo.time())
            tableView.reloadData()
        }else if setting[2] == setting[indexPath.row]{
            if unit == "F" {
                unit = "C"
            }else if unit == "C"{
                unit = "F"
            }
        tableView.reloadData()
        }else if setting[3] == setting[indexPath.row]{
            func displayAlert(title: String, message: String) {
                let alertController = UIAlertController(title: "title", message: "message", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                presentViewController(alertController, animated: true, completion: nil)
                return
            }
            
            func displayShareSheet(shareContent:String) {
                let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
                presentViewController(activityViewController, animated: true, completion: {})
            }
            
            displayShareSheet("The Current Weather at  ______ is ________")
            tableView.reloadData()
        }else{
            tableView.reloadData()
        }
    
        
    }
    
    func queryInstance(){
        let realm = try! Realm()
        
        let allInstances = realm.objects(Instance)
        
        for instance in allInstances {
            print("\(instance.timestamp): [\(instance.temperature)][\(instance.condition)][\(instance.location)] - Added")
        }
    }
    

    

}
