//
//  User.swift
//  StreetBalldar
//
//  Created by Kesh Pola on 1/21/18.
//  Copyright © 2018 Mirsoft.kg. All rights reserved.
//

import Foundation
import Firebase
import SwiftyJSON

struct User {
    var key = ""
    var ref: DatabaseReference?
    var email = ""
    var displayName = ""
    var phoneNumber = ""
    var photoURL = ""
    var providerID = ""
    var refreshToken = ""
    var uid = ""
    
    enum propKeys: String {
        case email = "email"
        case displayName = "displayName"
        case surname = "surname"
        case phoneNumber = "phoneNumber"
        case photoURL = "photoURL"
        case providerID = "providerID"
        case refreshToken = "refreshToken"
        case uid = "uid"
    }
    
    init() {}
    
    init(uid: String, email: String?, providerID: String, refreshToken: String?) {
        self.uid = uid
        self.email = email ?? ""
        self.providerID = providerID
        self.refreshToken = refreshToken ?? ""
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        ref = snapshot.ref
        let snapshotValue = snapshot.value as! [String: Any]
        debugPrint(snapshotValue)
        email = snapshotValue[propKeys.email.rawValue] as! String
        displayName = snapshotValue[propKeys.displayName.rawValue] as! String
        displayName = snapshotValue[propKeys.surname.rawValue] as? String ?? ""
        phoneNumber = snapshotValue[propKeys.phoneNumber.rawValue] as! String
        photoURL = snapshotValue[propKeys.photoURL.rawValue] as! String
        providerID = snapshotValue[propKeys.providerID.rawValue] as! String
        refreshToken = snapshotValue[propKeys.refreshToken.rawValue] as! String
        uid = snapshotValue[propKeys.uid.rawValue] as! String
    }
    
    func toJSON() -> AnyObject {
        return [propKeys.email.rawValue: email,
                propKeys.displayName.rawValue: displayName,
                propKeys.phoneNumber.rawValue: phoneNumber,
                propKeys.photoURL.rawValue: photoURL,
                propKeys.providerID.rawValue: providerID,
                propKeys.refreshToken.rawValue: refreshToken,
                propKeys.uid.rawValue: uid] as AnyObject
    }
    
    func setNameRefValue(name: String) {
        ref?.child(propKeys.displayName.rawValue).setValue(name)
    }
    
    func setSurnameRefValue(surname: String) {
        ref?.child(propKeys.surname.rawValue).setValue(surname)
    }
    
    func setPhoneRefValue(phone: String) {
        ref?.child(propKeys.phoneNumber.rawValue).setValue(phone)
    }
}
