//
//  Review.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class Review : Codable{
    var id: Int64?
//    var comments: [Comment]?
    var description: String?
    var rateNumber: Double?
    var userId: String?
    var date: String?
    var nickname : String?
    var photoUrl : String?
    var branchId : String?
//    func toDictionary() -> Any {     return ["id": id, "rateNumber": rateNumber, "comments": comments.toDictionary()] as Any }
}
