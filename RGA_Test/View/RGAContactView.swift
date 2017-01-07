//
//  RGAContactView.swift
//  RGA_Test
//
//  Created by Felipe Henrique Santolim on 1/7/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import UIKit

class RGAContactView: UIView {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    func animateReloadDataCells () {
        
        mainTableView.reloadData()
        
        let visibleCells = mainTableView.visibleCells
        let tableHeight: CGFloat = mainTableView.bounds.size.height
        
        for item in visibleCells {
            let cell: UITableViewCell = item as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for item in visibleCells {
            
            let cell: UITableViewCell = item as UITableViewCell
            
            UIView.animate(
                withDuration: 1.0,
                delay: 0.05 * Double(index), usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .allowAnimatedContent, animations: {
                    
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
                    
            }, completion: nil)
            
            index += 1
        }
    }
}
