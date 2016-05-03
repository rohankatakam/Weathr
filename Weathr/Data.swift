//
//  Data.swift
//  Weathr
//
//  Created by MWen1 on 4/2/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import UIKit

class Data: NSObject {
    
    var timeNotified = ""
    
    func load(textField: UITextField){
        if let savedText = NSUserDefaults.standardUserDefaults().stringForKey("savedString"){
            textField.text = savedText
        }
    }
    
    
    func save(textField: UITextField){
        NSUserDefaults.standardUserDefaults().setObject(textField.text!, forKey: "savedString")
    }
    
    
    
    
}
