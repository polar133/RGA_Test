//
//  RGAConstants.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import Foundation

enum RGAStoryboardName: String {
    case rgaContactDetailView
}

struct RGAConstants {
    
    private let actionOkName: String = "Ok"
    private let titleErrorName: String = "Error"
    private let messageErrorName: String = "Check all fields and try again !"
    private let rgaUrl: String = "https://s3-sa-east-1.amazonaws.com/rgasp-mobile-test/v1/content.json"
    
    static var actionOk: String {
        return RGAConstants().actionOkName
    }
    
    static var titleError: String {
        return RGAConstants().titleErrorName
    }
    
    static var messageError: String {
        return RGAConstants().messageErrorName
    }
    
    static func rgaMobileUrl () -> String {
        return RGAConstants().rgaUrl
    }
}

struct RGALocalData {
    
    private let KeyAccessFirstTime: String = "KeyAccessFirstTime"
    
    static func isAccessFirstTime () -> Bool {
        return UserDefaults.standard.bool(forKey: RGALocalData().KeyAccessFirstTime) 
    }
    
    static func isAccessFirstTime (_ flag: Bool) {
        UserDefaults.standard.set(flag, forKey: RGALocalData().KeyAccessFirstTime)
    }
}
