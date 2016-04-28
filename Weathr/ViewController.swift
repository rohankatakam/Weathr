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
    
    var notification = Notification()
    var data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //function notification verifcation
        notification.notificationVerifcation()
        
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
        let lat = locValue.latitude
        let long = locValue.longitude
        latitude = lat
        longitude = long
        
        if((longitude != 0.0) && (latitude != 0.0)){
            locationManager.stopUpdatingLocation()
            weatherLabel.text = String(weather.temperature(latitude, longitude: longitude))
            cityLabel.text = weather.city(latitude, longitude: longitude)
            notification.notify("It is currently \(String(weather.temperature(latitude, longitude: longitude))) in \(weather.city(latitude, longitude: longitude))")
        }
    }
    
    
    
    
    
    
    

}

