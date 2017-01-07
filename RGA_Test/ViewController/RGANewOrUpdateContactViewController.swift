//
//  RGANewOrUpdateContactViewController.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import UIKit
import SDWebImage

class RGANewOrUpdateContactViewController: UIViewController {

    //MARK: properties
    @IBOutlet weak var saveButton: UIBarButtonItem!
    internal var contactDetail: RGAContactModel?
    private enum SourceType: Int { case Camera = 0, Album }
    private var mainView: RGANewOrUpdateContactView {
        return self.view as! RGANewOrUpdateContactView
    }
    
    //MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK: methods
    @IBAction func saveContact(_ sender: UIBarButtonItem) {
        
        let completionError: () -> () = {
            let alertController = UIAlertController(title: RGAConstants.titleError, message: RGAConstants.messageError, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: RGAConstants.actionOk, style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
        guard let name = mainView.contactName.text, !(mainView.contactName.text?.isEmpty)! else {
            completionError()
            return
        }
        
        guard let email = mainView.contactEmail.text, !(mainView.contactEmail.text?.isEmpty)! else {
            completionError()
            return
        }
        
        guard let born = mainView.contactBorn.text, !(mainView.contactBorn.text?.isEmpty)! else {
            completionError()
            return
        }
        
        guard let bio = mainView.contactBio.text, !(mainView.contactBio.text?.isEmpty)! else {
            completionError()
            return
        }
        
        let rgaContact = RGAContactModel()
        
        rgaContact.name = name
        rgaContact.email = email
        rgaContact.born = born
        rgaContact.bio = bio
        rgaContact.photo = contactDetail?.photo ?? ""
        
        RGARealm.save(rgaContact) { (status) in
            
            if status {
                self.navigationController!.popViewController(animated: true)
            
            } else { completionError() }
        }
    }
    
    private func updateUI () {
        
        guard let contact = contactDetail else { return }
        
        mainView.contactBorn.text = contact.born
        mainView.contactName.text = contact.name
        mainView.contactEmail.text = contact.email
        mainView.contactBio.text = contact.bio
        
        self.saveButton.isEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        mainView.contactBorn.resignFirstResponder()
        mainView.contactName.resignFirstResponder()
        mainView.contactEmail.resignFirstResponder()
        mainView.contactBio.resignFirstResponder()
    }
}
