//
//  RGAContactViewController+TableView.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import UIKit

extension RGAContactViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RGAContactCell.registerCell, for: indexPath) as! RGAContactCell
        cell.subscribe(contacts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            DispatchQueue.main.async {
                
                RGARealm.delete(self.contacts[indexPath.row], completion: { (status) in
                    if status {
                        self.contacts.remove(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .automatic)
                    }
                })
            }
        }
    }
}

extension RGAContactViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: RGAStoryboardName.rgaContactDetailView.rawValue) as! RGAContactDetailViewController
        detailVC.contactDetail = contacts[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
