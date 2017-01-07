//
//  RGAContactCell.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import UIKit
import SDWebImage

class RGAContactCell: UITableViewCell {

    static let registerCell: String = "RGAContactCell"
    
    @IBOutlet weak var contactPhoto: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactEmail: UILabel!
    @IBOutlet weak var contactBorn: UILabel!
    @IBOutlet weak var contactBio: UILabel!
    
    func subscribe (_ contact: RGAContactModel) {
        
        DispatchQueue.main.async(execute: {
            
            self.contactName.text = contact.name
            self.contactEmail.text = contact.email
            self.contactBorn.text = contact.born
            self.contactBio.text = contact.bio
            self.contactPhoto.sd_setImage(with: URL(string: contact.photo),
                                          placeholderImage: UIImage(named: "image-placeholder"))
        })
    }
}
