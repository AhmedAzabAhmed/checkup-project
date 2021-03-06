//
//  NinthStaticTableViewCell.swift
//  Checkup
//
//  Created by Aya on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import MapKit
class NinthStaticTableViewCell: UITableViewCell {
    var latitude : CLLocationDegrees?
    var longitude : CLLocationDegrees?
    var name : String?
    
    @IBAction func showDirection(_ sender: UIButton) {
        sender.pulsate()
        
    
        
        
        let regionDistance : CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2DMake(latitude!, longitude!)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [MKLaunchOptionsMapCenterKey : NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey : NSValue(mkCoordinateSpan: regionSpan.span)]
        let placeMark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.name = name
        
        mapItem.openInMaps(launchOptions: options)
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
