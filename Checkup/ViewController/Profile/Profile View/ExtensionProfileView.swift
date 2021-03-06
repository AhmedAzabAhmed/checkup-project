//
//  ExtensionProfileView.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit

extension ProfileTableViewController:IProfileView,IView{
    func renderRealmProfileView(userName: String) {
       
        self.userName.text=userName
    }
    
    func renderProfileView(user: User) {
        self.user=user
         reloadData()

    }

    func showIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        tableView.showActivityIndicator()
    }

    func hideIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    func errorMessage(msg: String) {

       Alert.showSimpleAlert(title: "sorry",message: msg, viewRef: self)
        
    }




    func updateCounter(){
        
        
        if ( userName.text != ""){
            
           counter += 1
            
        }
        
     
        
        if( birthDateTextField.text != ""){
                   
                   counter += 1
               }
        
        if( genderTextField.text != ""){
            
            counter += 1
        }
        
        if( insuranceTextField.text != ""){
            
            counter += 1
        }
        
        if(  addressTextField.text != ""){
                   
                   counter += 1
               }
        
        if(mobileTextField.text != ""){
            
            counter += 1
        }
        
        if(landPhoneTextField.text != ""){
            
            counter += 1
        }
        
    }


    func updateProgressBar(){
        
        if (counter<=2){
            
            profileStrengthProgressBar.progress=0.1
            profileStrengthProgressBar.tintColor=UIColor.red
        }
        
        
        if (counter>2 && counter<=5){
            
            profileStrengthProgressBar.progress=0.5
            profileStrengthProgressBar.tintColor=UIColor.systemYellow
        }
        
      
        
        if (counter>5 && counter<7){
            
            profileStrengthProgressBar.progress=0.9
            profileStrengthProgressBar.tintColor=UIColor.systemGreen
        }
        
        if (counter==7){
            
            profileStrengthProgressBar.progress = 1.0
            profileStrengthProgressBar.tintColor=UIColor.systemGreen
        }
        
    }
    
    
    






}
