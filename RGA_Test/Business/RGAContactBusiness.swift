//
//  RGAContactBusiness.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import Foundation

typealias RGAContactBusinessResultCallback = (_ RGAContactModel: [RGAContactModel]?) -> ()

class RGAContactBusiness {
    
    //MARK: properties
    private let provider = RGAContactProvider()
    private let KeyName: String = "name"
    private let KeyEmail: String = "email"
    private let KeyBorn: String = "born"
    private let KeyBio: String = "bio"
    private let KeyPhoto: String = "photo"
    
    //MARK: methods
    func rgaAllContactList (_ completion: @escaping RGAContactBusinessResultCallback) {
        provider.rgaAllContactList { (result) in
            
            guard let data = result else { return }
            guard let JSON = String(data: data, encoding: String.Encoding.utf8) else {
                return
            }
            
            let wrapper = RGAWrapper(json: JSON)
            
            let contacts:[RGAContactModel]? = wrapper.mapArrayOfObjects { mapper in
             
                let rgaContact = RGAContactModel()
                
                rgaContact.name = mapper[self.KeyName].map() ?? ""
                rgaContact.email = mapper[self.KeyEmail].map() ?? ""
                rgaContact.born = mapper[self.KeyBorn].map() ?? ""
                rgaContact.bio = mapper[self.KeyBio].map() ?? ""
                rgaContact.photo = mapper[self.KeyPhoto].map() ?? ""
                
                return rgaContact
            }
            
            RGARealm.save(contacts)
            
            completion(contacts)
        }
    }
}
