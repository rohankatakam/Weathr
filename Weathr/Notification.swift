//
//  Notification.swift
//  Weathr
//
//  Created by MWen1 on 4/2/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class Notification: UIViewController {

    func notificationPopUp(){
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.alertBody = "Hey you! Yeah you! Swife to unlock!"
        notification.alertAction = "be awesome!"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustonField1": "w00t"]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }

    
}
