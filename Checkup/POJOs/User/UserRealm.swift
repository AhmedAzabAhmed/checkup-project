//
//  UserRealm.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/29/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import RealmSwift
class Person: Object {
    @objc dynamic var name = ""
     @objc dynamic var id = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }  
    
}