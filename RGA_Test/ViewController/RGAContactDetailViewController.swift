//
//  RGAContactDetailViewController.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import UIKit

class RGAContactDetailViewController: UIViewController {

    //MARK: properties
    internal var contactDetail: RGAContactModel?
    private let segueIdentifier: String = "editContactSegue"
    private var mainView: RGAContactDetailView {
        return self.view as! RGAContactDetailView
    }
    
    //MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI ()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: methods
    private func updateUI () {
        
        guard let contact = contactDetail else { return }
        
        mainView.contactBorn.text = contact.born
        mainView.contactName.text = contact.name
        mainView.contactEmail.text = contact.email
        mainView.contactImage.sd_setImage(with: URL(string: contact.photo),
                                          placeholderImage: UIImage(named: "image-placeholder"))
        
        mainView.mainTableView.reloadData()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let editVC = segue.destination as! RGANewOrUpdateContactViewController
            editVC.contactDetail = contactDetail
        }
    }
}
