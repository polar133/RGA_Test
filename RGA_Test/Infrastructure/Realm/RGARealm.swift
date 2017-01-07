//
//  RGARealm.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import Foundation
import RealmSwift

typealias RGARealmSaveResult = (_ status: Bool) -> ()

class RGARealm {
    
    //MARK: Save all contacts returned
    static func save (_ allContacts: [RGAContactModel]?) {
        
        guard let list = allContacts else { return }
        
        DispatchQueue.main.async(execute: {
            let uiRealm = try! Realm()
            try! uiRealm.write { () -> Void in
                for item in list {
                    uiRealm.add(item, update: true)
                }
            }
        })
    }
    
    //MARK: Save only one new or update contact
    static func save (_ newContact: RGAContactModel?, completion: @escaping RGARealmSaveResult) {
        
        guard let item = newContact else { return }
        
        DispatchQueue.main.async(execute: {
            let uiRealm = try! Realm()
            try! uiRealm.write { () -> Void in
                uiRealm.add(item, update: true)
                completion(true)
            }
            completion(false)
        })
    }
    
    //MARK: Retrieve all contacts
    static func retrieve () -> [RGAContactModel] {
        
        var list = [RGAContactModel]()
        let uiRealm = try! Realm()
        let results: Results<RGAContactModel> = uiRealm.objects(RGAContactModel.self)
        
        for item in results { list.append(item) }
        
        return list
    }
    
    //MARK: Delete a contact
    static func delete (_ deleteContact: RGAContactModel?, completion: @escaping RGARealmSaveResult) {
        
        guard let item = deleteContact else { return }
        
        let uiRealm = try! Realm()
        try! uiRealm.write {
            uiRealm.delete(item)
            completion(true)
        }
        
        completion(false)
    }
}
