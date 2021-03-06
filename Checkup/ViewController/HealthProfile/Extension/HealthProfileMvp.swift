//
//  HealthProfileMvp.swift
//  Checkup
//
//  Created by yasmin mohsen on 6/6/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

extension HealthProfileTableViewController:IHealthProfileView{
    
    
    func renderHealthProfileView(healthProfile: HealthProfile) {
        self.healthProfie=healthProfile
        reloadData()
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func errorMessage(msg: String) {
        
    }
    
    
    
    func renderUpdatedHealthProfileView() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func reloadData(){
            
            
            if (healthProfie.isSuffreDiabetes != nil){
                
                if healthProfie.isSuffreDiabetes==true{
                    
                    yesSufferDiabetesBtn.isSelected=true
                    yesSufferDiabetesBtn.backgroundColor = .systemTeal
                }
                    
                else {
                    noSufferDiabetesBtn.isSelected=true
                    noSufferDiabetesBtn.backgroundColor = .systemTeal
                }
            }
                
            else{
                for button in diabiabetesArray{
                    button.isSelected = false
                    button.backgroundColor = .clear
                }
            }
            
            
            
            
            if (healthProfie.isSuffrePressure != nil){
                if healthProfie.isSuffrePressure==true{
                    
                    yesSufferPressureBtn.isSelected=true
                    yesSufferPressureBtn.backgroundColor = .systemTeal
                }
                    
                else{
                    noSufferPressuresBtn .isSelected=true
                    noSufferPressuresBtn.backgroundColor = .systemTeal
                }
            }
                
            else{
                for button in pressurArray{
                    button.isSelected = false
                    button.backgroundColor = .clear
                }
            }
            
            
            
            
            
            
            if (healthProfie.isSTakeantiBiotic != nil ){
                
                if healthProfie.isSTakeantiBiotic==true{
                    
                    yesTakeAntiBtn.isSelected=true
                    yesTakeAntiBtn.backgroundColor = .systemTeal
                }
                    
                else{
                    noTakeAntiBtn.isSelected=true
                    noTakeAntiBtn.backgroundColor = .systemTeal
                }
                
            }
                
                
            else{
                
                for button in antiBioticArray{
                    button.isSelected = false
                    button.backgroundColor = .clear
                }
            }
            
            
            if (healthProfie.isTakehaemophilia != nil){
                
                if healthProfie.isTakehaemophilia == true{
                    
                    yesTakeHaemophiliaBtn.isSelected=true
                    yesTakeHaemophiliaBtn.backgroundColor = .systemTeal
                }
                    
                else{
                    noTakeHaemophiliaBtn.isSelected=true
                    noTakeHaemophiliaBtn.backgroundColor = .systemTeal
                }
                
            }
                
            else{
                for button in haemophiliaArray{
                    button.isSelected = false
                    button.backgroundColor = .clear
                }
            }
            
            
            
            if let disArrray=healthProfie.dieaseNamesArray{
                
                self.dieaseNamesArray=disArrray
                collectionView.reloadData()
                
                
                
            }
            
   
        
    }
    
    
}





