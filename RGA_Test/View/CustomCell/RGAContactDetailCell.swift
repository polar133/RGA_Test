//
//  RGAContactDetailCell.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import UIKit

class RGAContactDetailCell: UITableViewCell {
    
    static let registerCell: String = "RGAContactDetailCell"
    
    @IBOutlet weak var contactBio: UILabel!
    
    func subscribe (_ bio: String) {
        contactBio.text = bio
    }
}
