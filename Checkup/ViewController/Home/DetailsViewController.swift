//
//  DetailsViewController.swift
//  Checkup
//
//  Created by Aya on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
//DELETED
class DetailsViewController: UIViewController {
    let imageViewMaxHeight : CGFloat = 250
    let imageViewMinHeight : CGFloat = 44 + UIApplication.shared.statusBarFrame.height
    
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var headingHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        //myScrollView.bounces = false
        
    }
    
    
}

extension DetailsViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y : CGFloat = scrollView.contentOffset.y
        let newHeaderHeight : CGFloat = headingHeight.constant-y
        
        if newHeaderHeight > imageViewMaxHeight{
            headingHeight.constant = imageViewMaxHeight
        }else if newHeaderHeight < imageViewMinHeight{
            headingHeight.constant = imageViewMinHeight
        }else{
            headingHeight.constant = newHeaderHeight
            scrollView.contentOffset.y = 0
        }
    }
}
