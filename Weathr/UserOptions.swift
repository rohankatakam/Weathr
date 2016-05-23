//
//  UserOptions.swift
//  Weathr
//
//  Created by MWen1 on 5/3/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class UserOptions: NSObject {
    
    var dailyNotification = "6:00am"
    var frequency = "1 hour"
    var dailyNotificationSubTitle = "Set a time to be notified daily"
    var freqencySubtitle = "Set how freqent you want to be notified"
    
    var switchState : Bool?
    
    
    //recents 
    var notify = [""]
    
    func customView(z: NotificationsTableViewCell, a: String, c: String, d: String, e: String, f: String){
        z.timeLabel.text = a
        z.conditionLabel.text = c
        z.tempLabel.text = d
        z.humidityLabel.text = "Humidity Level: " + e
        z.windLabel.text = "Wind Speed " + f
    }
    
    var time = ""
    var condition = ""
    var temp = ""
    var wind = ""
    
    convenience init(time: String, condition: String, temp: String, wind: String){
        self.init()
        self.time = time
        self.condition = condition
        self.temp = temp
        self.wind = wind
    }
    
}


