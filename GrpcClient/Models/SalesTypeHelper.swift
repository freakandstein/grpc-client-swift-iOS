//
//  SalesTypeHelper.swift
//  GrpcClient
//
//  Created by Satrio on 07/11/19.
//  Copyright © 2019 Satrio Wicaksono. All rights reserved.
//

import Foundation
import RealmSwift

class SalesTypeHelper: NSObject {
    
    static let types = ["Dine In", "Take Away", "GoFood"]
    
    static func initSalesTypeDummy() {
        if getSalesTypes() != nil {
            deleteAll()
        }
        let salesType = SalesType()
        salesType.id = 1
        salesType.name = types.first ?? ""
        
        add(salesType: salesType)
    }
    
    static func getById(id: Int) -> SalesType? {
        let salesType = RealmManager.shared.realm?.object(ofType: SalesType.self, forPrimaryKey: id)
        return salesType
    }
    
    static func getSalesTypes() -> Results<SalesType>? {
        let salesTypes = RealmManager.shared.realm?.objects(SalesType.self)
        return salesTypes
    }
    
    static func add(salesType: SalesType) {
        guard let realm = RealmManager.shared.realm else {
            return
        }
        try! realm.write {
            realm.add(salesType)
        }
    }
    
    static func deleteBySalesType(salesType: SalesType) {
        guard let realm = RealmManager.shared.realm else {
            return
        }
        
        try! realm.write {
            realm.delete(salesType)
        }
    }
    
    static func deleteAll() {
        guard let realm = RealmManager.shared.realm else {
            return
        }
        try! realm.write {
            realm.deleteAll()
        }
    }
}
