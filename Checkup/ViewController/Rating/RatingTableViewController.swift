//
//  RatingTableViewController.swift
//  Checkup
//
//  Created by Aya on 6/5/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import Cosmos
import Firebase
class RatingTableViewController: UITableViewController , IRatingView, UITextViewDelegate {

    var userReview : Review = Review()
    var ratingPresenter : IRatingPresenter!
    var branchId : String!
    
    
    @IBAction func submitAction(_ sender: Any) {
        userReview.description = commentOutlet.text
       
        userReview.userId =  Auth.auth().currentUser?.uid
        userReview.branchId = branchId
        ratingPresenter = RatingPresenter(view: self)
        ratingPresenter.passDataToModel(labReview: userReview)
        
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var ratingOutlet: CosmosView!
    @IBOutlet weak var commentOutlet: UITextView!
    @IBOutlet weak var ratingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingOutlet.didFinishTouchingCosmos = { rating in
                   self.userReview.rateNumber = rating
               }
        commentOutlet.delegate = self
        commentOutlet.layer.borderWidth = 0.5
        commentOutlet.layer.borderColor = UIColor.gray.cgColor
  //      let imageView = UIImageView(image: UIImage(named:  "newmicroscope (1)"))//
    //    imageView.alpha = 0.4
      //  self.tableView.backgroundView = imageView
        ratingView.layer.shadowPath =  UIBezierPath(rect:ratingView.bounds).cgPath
                          
                           ratingView.layer.shadowRadius = 10
                           ratingView.layer.shadowOffset = .zero
                           ratingView.layer.shadowOpacity = 0.1
                           ratingView.layer.cornerRadius = 10
        
        
        
        
           ratingView.backgroundColor = .clear
           let blurEffect = UIBlurEffect(style: .extraLight)
           let blurView = UIVisualEffectView(effect: blurEffect)
           blurView.translatesAutoresizingMaskIntoConstraints = false
           ratingView.insertSubview(blurView, at: 0)
           NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: ratingView.heightAnchor) , blurView.widthAnchor.constraint(equalTo:ratingView.widthAnchor)])
        
    }

    // MARK: - Table view data source
    

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white : 1 , alpha: 0.5)
    }

    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (commentOutlet.text=="Add a comment..."){
            
        commentOutlet.text=""
        commentOutlet.textColor=UIColor.black
        commentOutlet.font=UIFont(name: "verdana", size: 18.0)
            
        }
        
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text=="\n"{
            commentOutlet.resignFirstResponder()
               }
        return true
        }
    

    func textViewDidEndEditing(_ textView: UITextView) {
        if commentOutlet.text==""
        {
            commentOutlet.text="Add a comment..."
            commentOutlet.textColor=UIColor.lightGray
            commentOutlet.font=UIFont(name: "verdana", size: 15.0)
        }
    }
    
}
