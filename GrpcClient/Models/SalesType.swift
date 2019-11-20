//
//  SalesType.swift
//  GrpcClient
//
//  Created by Satrio on 07/11/19.
//  Copyright © 2019 Satrio Wicaksono. All rights reserved.
//

import Foundation
import RealmSwift

class SalesType: Object {
    @objc dynamic var id : Int = 0
    @objc dynamic var name : String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
