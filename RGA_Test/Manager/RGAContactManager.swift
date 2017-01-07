//
//  RGAContactManager.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

class RGAContactManager {
    
    private let business = RGAContactBusiness()
    
    func rgaAllContactList (_ completion: @escaping RGAContactBusinessResultCallback) {
        business.rgaAllContactList(completion)
    }
}
