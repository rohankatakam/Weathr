//
//  Instance.swift
//  Weathr
//
//  Created by rkatakam on 5/10/16.
//  Copyright © 2016 Rohan. All rights reserved.
//

import Foundation
import RealmSwift

class Instance: Object {
    dynamic var timestamp = ""
    dynamic var temperature = 0
    dynamic var windSpeed = 0
    dynamic var windDirection = 0
    dynamic var location = ""
    dynamic var condition = ""
    dynamic var icon = ""
}
