//
//  RGAContactProvider.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import Foundation

class RGAContactProvider: RGAContactProviderProtocol {
    
    func rgaAllContactList (completion: @escaping RGAContactProviderResultCallback) {
        
        let session = URLSession(configuration: .ephemeral)
        let task = session.dataTask(with: URL(string: RGAConstants.rgaMobileUrl())!) { (data, response, erro) in
            
            guard let dt = data else { completion(nil)
                return
            }
            completion(dt as Data?)
        }
        task.resume()
    }
}
