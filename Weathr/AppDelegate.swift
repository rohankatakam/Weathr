//
//  AppDelegate.swift
//  Weathr
//
//  Created by rkatakam on 4/1/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit
import CoreLocation
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    var latitude = 42.159332
    var longitude = -88.138847
    let locationManager = CLLocationManager()
    let weather = Weather()
    
    var currentInfo = CurrentInfo()
    
    var notification = Notification()
    var data = Data()
    
    var seconds = 0
    var time = NSTimer()
    var timerIsOn = false
    
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        print("workingLaunch")

        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        print("workingResign")

        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        /*let viewController = ViewController()
        viewController.latitude = latitude
        viewController.longitude = longitude
        
        while(UIApplication.sharedApplication().applicationState != .Active){
            viewController.update()
            sleep(2)
            print("workingBack")
        }*/
    }
    
    

    func applicationWillEnterForeground(application: UIApplication) {
        print("workingFore")

        /*let viewController = ViewController()
        viewController.latitude = latitude
        viewController.longitude = longitude
        
        while(UIApplication.sharedApplication().applicationState != .Active){
            viewController.update()
            sleep(2)
        }*/
    }

    func applicationDidBecomeActive(application: UIApplication) {
        print("workingActive")
        /*let viewController = ViewController()
        viewController.latitude = latitude
        viewController.longitude = longitude
        
            viewController.update()*/
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
    }


}

