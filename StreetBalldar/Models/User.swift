//
//  User.swift
//  StreetBalldar
//
//  Created by Kesh Pola on 1/21/18.
//  Copyright © 2018 Mirsoft.kg. All rights reserved.
//

import Foundation
import Firebase

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
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        ref = snapshot.ref
        let snapshotValue = snapshot.value as! [String: Any]
        debugPrint(snapshotValue)
    }
}
