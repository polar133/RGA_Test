//
//  RGAContactModel.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import RealmSwift

class RGAContactModel: Object {
    
    dynamic var name: String = ""
    dynamic var email: String = ""
    dynamic var born: String = ""
    dynamic var bio: String = ""
    dynamic var photo: String = ""
    
    private let KeyEmail: String = "email"
    
    override class func primaryKey() -> String {
        return RGAContactModel().KeyEmail
    }
}
