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
    
    var color = [UIColor.clearColor(),UIColor.clearColor(),UIColor.clearColor(),UIColor.clearColor(),UIColor.clearColor(),UIColor.clearColor(),UIColor.clearColor(),UIColor.clearColor(),UIColor.clearColor(),UIColor.clearColor(),UIColor.clearColor(),UIColor.clearColor(),UIColor.clearColor()]
    
    var notytime = ["0","0","0","0","0","0","0","0","0","0","0","0","0"]
    
    
    var background = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! NotifyRingTableViewCell
        cell.timeLabel.text = time[indexPath.row]
        cell.backgroundCell.backgroundColor = color[indexPath.row]
        
        
        
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return time.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if color[indexPath.row] == UIColor.yellowColor(){
            color[indexPath.row] = UIColor.clearColor()
            notytime[indexPath.row] = "0"
        }else{
            notytime[indexPath.row] = time[indexPath.row]
            color[indexPath.row] = UIColor.yellowColor()
        }
        
        print(notytime)
        
        tableView.reloadData()
        
    }
   

}
