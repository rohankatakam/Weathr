//
//  SettingsViewController.swift
//  Weathr
//
//  Created by MWen1 on 4/29/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //@IBOutlet weak var tableView: UITableViewCell!
    
    var cities = ["Chicago", "Denver", "Seattle"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            cities.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
   
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let city = cities[sourceIndexPath.row]
        cities.removeAtIndex(sourceIndexPath.row)
        cities.insert(city , atIndex: destinationIndexPath.row )
    }
    
    
}
