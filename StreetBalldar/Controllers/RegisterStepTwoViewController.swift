//
//  RegisterStepTwoViewController.swift
//  StreetBalldar
//
//  Created by Kesh Pola on 1/22/18.
//  Copyright © 2018 Mirsoft.kg. All rights reserved.
//

import UIKit
import Firebase
import Material

class RegisterStepTwoViewController: UIViewController {

    @IBOutlet weak var nameField: ErrorTextField!
    @IBOutlet weak var surnameField: ErrorTextField!
    @IBOutlet weak var phoneField: ErrorTextField!
    @IBOutlet weak var registerButton: UIButton!
    
    var user: User!
    
    private let ref = Database.database().reference()
//    private let segueIdentififerRegistrationStepTwo = "segueIdentifierRegistrationStepTwo"
    
    enum dbReferences: String {
        case users = "users"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.placeholderActiveColor = UIColor.flatGreen
        nameField.placeholderNormalColor = UIColor.flatGreen
        nameField.dividerActiveColor = UIColor.flatGreen
        
        surnameField.placeholderActiveColor = UIColor.flatGreen
        surnameField.placeholderNormalColor = UIColor.flatGreen
        surnameField.dividerActiveColor = UIColor.flatGreen
        
        phoneField.placeholderActiveColor = UIColor.flatGreen
        phoneField.placeholderNormalColor = UIColor.flatGreen
        phoneField.dividerActiveColor = UIColor.flatGreen
        
        registerButton.backgroundColor = UIColor.flatGreen
        registerButton.layer.shadowColor = UIColor.black.cgColor
        registerButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        registerButton.layer.masksToBounds = false
        registerButton.layer.shadowRadius = 3.0
        registerButton.layer.shadowOpacity = 0.5
        registerButton.layer.cornerRadius = 20
        registerButton.clipsToBounds = true
        
        let userRef = ref.child(dbReferences.users.rawValue).child(user.uid).ref
        print("userRef = \(userRef)")
        print("user.ref = \(user.ref)")
        userRef.observe(.value, with: { snapshot in
            if snapshot.exists() {
                print(snapshot.value)
//                self.user = User(snapshot: snapshot)
            } else {
                print("Couldn't load data")
            }
        })
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        guard let name = nameField.text else { return }
        user.setNameRefValue(name: name)
        guard let surname = surnameField.text else { return }
        user.setSurnameRefValue(surname: surname)
        guard let phoneNumber = phoneField.text else { return }
        user.setPhoneRefValue(phone: phoneNumber)
    }
    
    deinit {
        print("DEINIT CALLED IN Register View Controller Step 2")
    }
}
