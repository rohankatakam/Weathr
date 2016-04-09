//
//  Data.swift
//  Weathr
//
//  Created by MWen1 on 4/2/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class Data: NSObject {
    
    func saveData(){
        save()
        exit(0)
    }
    
    
    func load() {
        if let savedText = NSUserDefaults.standardUserDefaults().stringForKey("savedString"){
            //saving info like locatoin.
        }
   

    }
    func save(){
        //NSUserDefaults.standardUserDefaults().setObject(<#T##value: AnyObject?##AnyObject?#>, forKey: "savedString")
    }
    
}
