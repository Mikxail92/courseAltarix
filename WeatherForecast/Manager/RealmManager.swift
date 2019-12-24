//
//  RealmManager.swift
//  WeatherForecast
//
//  Created by Zateev on 19.12.2019.
//  Copyright © 2019 Zateev. All rights reserved.
//

import RealmSwift

class RealmManager {
    
    static let manager = RealmManager()
    
    let realm: Realm = try! Realm()
    
    func beginWrite() {
        realm.beginWrite()
    }
    
    func commit() {
        do {
            try realm.commitWrite()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func add<T: Object>(object: T) {
        do {
            try realm.write {
                realm.add(object, update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func remove<T: Object>(object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getObject<T: Object>(ofType: T.Type, forPrimaryKey key: Any) -> T? {
        return realm.object(ofType: ofType, forPrimaryKey: key)
    }
    
    func deleteAll() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
