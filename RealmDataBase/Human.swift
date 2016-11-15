//
//  Human.swift
//  RealmDataBase
//
//  Created by media-pt on 04.11.16.
//  Copyright © 2016 media-pt. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Human: Object {
    
    dynamic var name = String()
    dynamic var ege = Int()
    dynamic var race = String()
}

class City: Object {
    dynamic var city = ""
    dynamic var id = 0
    dynamic var inn = 0
    // other properties left out ...
}
