//
//  ViewController.swift
//  RealmDataBase
//
//  Created by media-pt on 04.11.16.
//  Copyright © 2016 media-pt. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let realm = try! Realm()
        realm.beginWrite()
        realm.deleteAll()
        try! realm.commitWrite()*/
        
        //addJSON()
        //addHuman()
        //removeRealmObject()
        queryPeople()
    }
}

//MARK: - JSON Realm

extension ViewController {
    
    func addJSON() {
        // Insert from NSData containing JSON
        let data = "{\"city\": \"San Pedro\", \"id\": 123, \"inn\": 854}".data(using: .utf8)!
        let realm = try! Realm()
        
        try! realm.write {
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            realm.create(City.self, value: json, update: false)
        }
    }
}

//MARK: - Remove objects

extension ViewController {
    func removeRealmObject() {
        let realm = try! Realm()
        let city = realm.objects(City.self)
        realm.beginWrite()
        realm.delete(city)
        try! realm.commitWrite()
    }
}

//MARK: - ADD Human

extension ViewController {
    
    func addHuman() {
        let realm = try! Realm()
        let mike = Human()
        mike.name = "Dave"
        mike.ege = 25
        mike.race = "white"
        
        try! realm.write {
            realm.add(mike)
            print("Added \(mike.name) to Realm")
        }
    }
}

//MARK: - Query people

extension ViewController {
    
    func queryPeople() {
        let realm = try! Realm()
        let allHuman = realm.objects(Human.self)
        let allCity = realm.objects(City.self)
        print(allHuman, allCity)
    }
}
