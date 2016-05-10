//
//  NotifyRingViewController.swift
//  Weathr
//
//  Created by MWen1 on 5/6/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class NotifyRingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var time = ["6am","7am","8am","9am","10am","11am", "12pm","1pm","2pm","3pm","4pm","5pm","6pm"]
    
    var defaultz = UIColor.clearColor()
    
    
    var background = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! NotifyRingTableViewCell
        cell.timeLabel.text = time[indexPath.row]
        
        
        
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return time.count
    }
    
   

}
