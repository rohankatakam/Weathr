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
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirectionImageView: UIImageView!
    
    let locationManager = CLLocationManager()
    let weather = Weather()
    var latitude = Double()
    var longitude = Double()
    var currentInfo = CurrentInfo()
    
    var notification = Notification()
    var data = Data()
    
    var seconds = 0
    var time = NSTimer()
    var timerIsOn = false
    

    
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
            weatherLabel.text = "\(weather.temperature(latitude, longitude: longitude))°"
            cityLabel.text = weather.city(latitude, longitude: longitude)
            currentInfo.locationz = weather.city(latitude, longitude: longitude)
            windSpeedLabel.text = "\(weather.windSpeed(latitude, longitude: longitude)) mph"
            self.windDirectionImageView.transform = CGAffineTransformMakeRotation((CGFloat(90 + weather.windDirection(latitude, longitude: longitude)) * CGFloat(M_PI)) / 180.0)
            notification.notify("It is currently \(String(weather.temperature(latitude, longitude: longitude))) in \(weather.city(latitude, longitude: longitude))")
            print(weather.icon(latitude, longitude: longitude))
            print(weather.windSpeed(latitude, longitude: longitude))
            print(weather.windDirection(latitude, longitude: longitude))
            setImage(weather.icon(latitude, longitude: longitude))
            
            
            var timer = NSTimer.scheduledTimerWithTimeInterval(900, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
        }
    }
    
    func update(){
        let instance = Instance()
        addInstance(instance, timestamp: currentInfo.time(), temperature: weather.temperature(latitude, longitude: longitude), windSpeed: weather.windSpeed(latitude, longitude: longitude), windDirection: weather.windDirection(latitude, longitude: longitude), location: weather.city(latitude, longitude: longitude), condition: weather.description(latitude, longitude: longitude),icon: weather.icon(latitude, longitude: longitude))
        detectChange()
    }
    
    func timer(){
        currentInfo.updateTimer()
    }
    
    func addInstance(instance: Instance, timestamp: String, temperature: Int, windSpeed: Int, windDirection: Int, location: String, condition: String, icon: String){
        instance.timestamp = timestamp
        instance.temperature = temperature
        instance.windSpeed = windSpeed
        instance.windDirection = windDirection
        instance.location = location
        instance.condition = condition
        instance.icon = icon
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(instance)
            print("\(instance.timestamp): [\(instance.temperature)][\(instance.windSpeed)mph][\(instance.windDirection)deg][\(instance.condition)][\(instance.location)][\(instance.icon)] - Added")
        }
    }
    
    func instanceArray() -> Results<(Instance)>{
        let realm = try! Realm()
        
        let allInstances = realm.objects(Instance)
        
        return allInstances
    }
    
    
    func detectChange(){
        if instanceArray()[instanceArray().count - 2].temperature != instanceArray()[instanceArray().count - 1].temperature {
            if (instanceArray()[instanceArray().count - 2].temperature > instanceArray()[instanceArray().count - 1].temperature) && ((instanceArray()[instanceArray().count - 2].temperature - instanceArray()[instanceArray().count - 1].temperature) >= 3) {
                notification.notify("❄️The temperature decreased by \(instanceArray()[instanceArray().count - 2].temperature - instanceArray()[instanceArray().count - 1].temperature))°")
            }
            
            if (instanceArray()[instanceArray().count - 2].temperature < instanceArray()[instanceArray().count - 1].temperature) && ((instanceArray()[instanceArray().count - 1].temperature - instanceArray()[instanceArray().count - 2].temperature) >= 3) {
                notification.notify("🌡The temperature increased by \((instanceArray()[instanceArray().count - 1].temperature - instanceArray()[instanceArray().count - 2].temperature))°")
            }
        }
        
        if instanceArray()[instanceArray().count - 2].windSpeed != instanceArray()[instanceArray().count - 1].windSpeed {
            if (instanceArray()[instanceArray().count - 2].windSpeed > instanceArray()[instanceArray().count - 1].windSpeed) && ((instanceArray()[instanceArray().count - 2].windSpeed - instanceArray()[instanceArray().count - 1].windSpeed) >= 3) {
                notification.notify("😌The wind speed decreased by \(instanceArray()[instanceArray().count - 2].windSpeed - instanceArray()[instanceArray().count - 1].windSpeed))°")
            }
            
            if (instanceArray()[instanceArray().count - 2].windSpeed < instanceArray()[instanceArray().count - 1].windSpeed) && ((instanceArray()[instanceArray().count - 1].windSpeed - instanceArray()[instanceArray().count - 2].windSpeed) >= 3) {
                notification.notify("🍃The wind speed increased by \((instanceArray()[instanceArray().count - 1].windSpeed - instanceArray()[instanceArray().count - 2].windSpeed))°")
            }
        }
        
        if instanceArray()[instanceArray().count - 2].condition != instanceArray()[instanceArray().count - 1].condition {
            notification.notify("The weather outside is now: \(instanceArray()[instanceArray().count - 1].condition)")
        }
    }
    
    func setImage(icon: String){
        let url = NSURL(string: "https://openweathermap.org/img/w/\(icon).png")
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        imageView.image = UIImage(data: data!)
    }
    

}

