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
    
    let detail = [["Daily Notifications", "Update Notifications"],["Time", "Locations"], ["Time", "Locations"]]
    
    var defaultz = UIColor.clearColor()
    
    var background = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! NotifyRingTableViewCell
        
        cell.timeLabel.text = detail[indexPath.section][indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //detail\[sections\].count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  "hello" //sections\[section\]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
   
    
   

}
