//
//  RGAContactProviderProtocol.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import Foundation

typealias RGAContactProviderResultCallback = (_ result: Data?) -> ()

protocol RGAContactProviderProtocol {
    func rgaAllContactList (completion: @escaping RGAContactProviderResultCallback)
}
