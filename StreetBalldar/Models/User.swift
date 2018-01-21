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

class User {
    var key = ""
    var ref: DatabaseReference?
    var email = ""
    var displayName = ""
    var phoneNumber = ""
    var photoURL = ""
    var providerID = ""
    var refreshToken = ""
    var uid = ""
    
    
    
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
        email = snapshotValue["email"] as! String
        displayName = snapshotValue["displayName"] as! String
        phoneNumber = snapshotValue["phoneNumber"] as! String
        photoURL = snapshotValue["photoURL"] as! String
        providerID = snapshotValue["providerID"] as! String
        refreshToken = snapshotValue["refreshToken"] as! String
        uid = snapshotValue["uid"] as! String
        debugPrint(snapshotValue)
    }
    
    func toJSON() -> AnyObject {
        return [uid :
            [   "email": email,
                "displayName":displayName,
                "phoneNumber":phoneNumber,
                "photoURL":photoURL,
                "providerID":providerID,
                "refreshToken": refreshToken,
                "uid": uid]
        ] as AnyObject
    }
}
