//
//  CurrentInfo.swift
//  Weathr
//
//  Created by MWen1 on 4/28/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit
import RealmSwift

class CurrentInfo: NSObject {
    
    dynamic var counter: Int = 0
    dynamic var hour: Int = 0
    dynamic var minute: Int = 0
    dynamic var amOrPM: String = ""
    
    func time() -> String {
        
        hour = NSCalendar.currentCalendar().component(.Hour, fromDate: NSDate())
        testHours()
        minute = NSCalendar.currentCalendar().component(.Minute, fromDate: NSDate())
        
        var stringTime = ""
        
        if minute > 60{
            minute = minute-60
            hour = hour+1
            testHours()
        }
        
        
        
        if counter == 1{
            amOrPM = "pm"
        }
        if counter == 0{
            amOrPM = "am"
        }
        
        if minute < 10{
             stringTime = "\(hour):0\(minute) \(amOrPM)"
        }else if minute > 10{
            stringTime =  "\(hour):\(minute) \(amOrPM)"
        }
        
        return stringTime


    }

    
    
    
    func testHours(){
        if hour > 12{
            hour = hour-12
            counter = 1
        }else{
            counter = 0
        }

    }
   
    
    
   ////////////////////////////////
    var seconds = 0
    var timer = NSTimer()
    var timerIsOn = false
    
    
    func startTimer(){
        if timerIsOn == false{
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ("updateTimer"), userInfo: nil, repeats: true)
            timerIsOn = true
        }
    }
    
    func stopTimer(){
        timer.invalidate()
        seconds = 0
        timerIsOn = false
    }
    
    func updateTimer(){
        seconds = seconds+1
        if seconds >= 15{
            print(time())
            stopTimer()
            startTimer()
        }
    }

    
    
    
    
}


    

    
    
    



