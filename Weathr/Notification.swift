//
//  Notification.swift
//  Weathr
//
//  Created by MWen1 on 4/2/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class Notification: UIViewController {

    func notify(text: String){
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.alertBody = text
        notification.alertAction = "be awesome!"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustonField1": "w00t"]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    //Verify to see if the user want notifications to show up
    func notificationVerifcation(){
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
        
        func scheduleLocal(sender: AnyObject) {
            let settings = UIApplication.sharedApplication().currentUserNotificationSettings()
            
            if settings!.types == .None{
                let ac = UIAlertController(title: "Can't Schedule", message: "Either we don't have permission to scheduel notification, or we haven't asked yet", preferredStyle: .Alert)
                ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                presentViewController(ac, animated: true, completion: nil)
                return
            }
        }
        
        
        
    }

    
}
