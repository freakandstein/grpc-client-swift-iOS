//
//  RealmManager.swift
//  GrpcClient
//
//  Created by Satrio on 07/11/19.
//  Copyright © 2019 Satrio Wicaksono. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class RealmManager: NSObject {
    static let shared = RealmManager()
    var realm: Realm!
    
    override init() {
        do {
            if realm == nil {
                realm = try Realm()
            }
        } catch (let error) {
            print(error)
        }
    }
}
