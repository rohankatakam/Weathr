//
//  weather.swift
//  Weathr
//
//  Created by MWen1 on 4/2/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class Weather: NSObject {
    func temperature(latitude: Double, longitude: Double) -> Int{
        
        let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=e4ca3ac79d18533cfdc17db5cced6263")
        let data = NSData(contentsOfURL: url!)
        
        do {
            var json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)

            if let weather = json["main"] as? Dictionary<String, Double> {
                let temp = weather["temp"]
                return Int(1.8 * (Double(temp!) - 273) + 32)
            }
            
        } catch {
            print("error serializing JSON: \(error)")
        }
        return 0
    }
    
    
    func icon(latitude: Double, longitude: Double) -> String {
        let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=e4ca3ac79d18533cfdc17db5cced6263")
        
        let data = NSData(contentsOfURL: url!)

        do {
            var json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            
            if let weather = json["weather"] as? [[String: AnyObject]] {
                for state in weather {
                    if let name = state["icon"] as? String {
                        return name
                    }
                }
            }
            
        } catch {
            print("error serializing JSON: \(error)")
        }
        return ""
    }
    
    func description(latitude: Double, longitude: Double) -> String {
        let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=e4ca3ac79d18533cfdc17db5cced6263")
        
        let data = NSData(contentsOfURL: url!)
        
        do {
            var json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            
            if let weather = json["weather"] as? [[String: AnyObject]] {
                for state in weather {
                    if let name = state["description"] as? String {
                        return name
                    }
                }
            }
            
        } catch {
            print("error serializing JSON: \(error)")
        }
        return ""
    }
    
    
    
    func city(latitude: Double, longitude: Double) -> String{
        var url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=e4ca3ac79d18533cfdc17db5cced6263")
        var data = NSData(contentsOfURL: url!)
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            if let weather = json["name"] as? String {
                return String(weather)
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
        return ""
    }
    
    func windSpeed(latitude: Double, longitude: Double) -> Int{
        
        let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=e4ca3ac79d18533cfdc17db5cced6263")
        let data = NSData(contentsOfURL: url!)
        
        do {
            var json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            
            if let weather = json["wind"] as? Dictionary<String, Double> {
                let temp = weather["speed"]
                return Int(temp!)
            }
            
        } catch {
            print("error serializing JSON: \(error)")
        }
        return 0
    }
    
    func windDirection(latitude: Double, longitude: Double) -> Int{
        
        let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=e4ca3ac79d18533cfdc17db5cced6263")
        let data = NSData(contentsOfURL: url!)
        
        do {
            var json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            
            if let weather = json["wind"] as? Dictionary<String, Double> {
                let temp = weather["deg"]
                return Int(temp!)
            }
            
        } catch {
            print("error serializing JSON: \(error)")
        }
        return 0
    }
}
