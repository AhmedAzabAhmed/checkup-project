//
//  ProfileContract.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol IProfileView :IBase{
    func renderProfileView (user:User)
    func renderRealmProfileView(userName:String)
}
protocol IProfilePresenter {
    func getUser(userId:String)
    func onSuccess(user:User)
    func onFail(message: String)
    func onSucessRealm(userName:String)
}
protocol IProfileModel {
    func getUser(userId:String)
}
