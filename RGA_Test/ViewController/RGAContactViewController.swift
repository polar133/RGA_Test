//
//  ViewController.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import UIKit

class RGAContactViewController: UIViewController {
    
    //MARK: properties
    var contacts = [RGAContactModel]()
    private let addContactSegue: String = "addNewContactSegue"
    private let manager = RGAContactManager()
    private var mainView: RGAContactView {
        return self.view as! RGAContactView
    }
    
    //MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAllContacts()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: methods
    private func fetchAllContacts () {
        
        if (RGARealm.retrieve().count) > 0 && RGALocalData.isAccessFirstTime() {
            self.updateUI(RGARealm.retrieve())
            
        } else {
            manager.rgaAllContactList { (result) in
                guard let list = result else { return }
                self.updateUI(list)
                RGALocalData.isAccessFirstTime(true)
            }
        }
    }
    
    private func updateUI (_ rgaContacts: [RGAContactModel]) {
        DispatchQueue.main.async(execute: {
            self.contacts = rgaContacts
            self.mainView.animateReloadDataCells()
        })
    }
}

