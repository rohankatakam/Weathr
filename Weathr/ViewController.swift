//
//  ViewController.swift
//  Weathr
//
//  Created by rkatakam on 4/1/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    let locationManager = CLLocationManager()
    let weather = Weather()
    var latitude = Double()
    var longitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //function notification verifcation
        notificationVerifcation()
        
        // Ask for Authorization from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        latitude = locValue.latitude
        longitude = locValue.longitude
        weatherLabel.text = String(weather.temperature(latitude, longitude: longitude))
        cityLabel.text = weather.city(latitude, longitude: longitude)
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
    
    //

}

