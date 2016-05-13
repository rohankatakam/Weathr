//
//  ViewController.swift
//  Weathr
//
//  Created by rkatakam on 4/1/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit
import CoreLocation
import RealmSwift

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    let locationManager = CLLocationManager()
    let weather = Weather()
    var latitude = Double()
    var longitude = Double()
    var currentInfo = CurrentInfo()
    
    var notification = Notification()
    var data = Data()
    
    var instance : Instance?{
        didSet {
            //Add stuff
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        currentInfo.startTimer()
        
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
        print(String(weather.temperature(latitude, longitude: longitude)))
        
        if((longitude != 0.0) && (latitude != 0.0)){
            locationManager.stopUpdatingLocation()
            weatherLabel.text = String(weather.temperature(latitude, longitude: longitude))
            cityLabel.text = weather.city(latitude, longitude: longitude)
            currentInfo.locationz = weather.city(latitude, longitude: longitude)
            notification.notify("It is currently \(String(weather.temperature(latitude, longitude: longitude))) in \(weather.city(latitude, longitude: longitude))")
            print(weather.description(latitude, longitude: longitude))
            setImage(weather.description(latitude, longitude: longitude))
        }
    }
    
    func timer(){
        currentInfo.updateTimer()
    }
    
    
    
    func setImage(condition: String){
        if(condition == "clear sky"){
            imageView.image = UIImage(named: "sunny")
        } else if(condition == "few clouds"){
            imageView.image = UIImage(named: "mostlyCloudy")
        } else if(condition == "scattered clouds"){
            imageView.image = UIImage(named: "cloudy")
        } else if(condition == "broken clouds"){
            imageView.image = UIImage(named: "cloudy")
        } else if(condition == "shower rain"){
            imageView.image = UIImage(named: "drizzle")
        } else if(condition == "rain"){
            imageView.image = UIImage(named: "slightDrizzle")
        } else if(condition == "thunderstorm"){
            imageView.image = UIImage(named: "thunderstorms")
        } else if(condition == "snow"){
            imageView.image = UIImage(named: "snow")
        } else if(condition == "mist"){
            imageView.image = UIImage(named: "haze")
        }
    }
    

}

