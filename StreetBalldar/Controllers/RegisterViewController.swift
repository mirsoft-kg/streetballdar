//
//  RegisterViewController.swift
//  StreetBalldar
//
//  Created by Kesh Pola on 1/16/18.
//  Copyright © 2018 Mirsoft.kg. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Material
import ChameleonFramework

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailField: ErrorTextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var passwordCheckTestField: TextField!
    @IBOutlet weak var registerButton: UIButton!
    
    private let ref = Database.database().reference()
    private let segueIdentififerRegistrationStepTwo = "segueIdentifierRegistrationStepTwo"
    
    enum dbReferences: String {
        case users = "users"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.placeholderActiveColor = UIColor.flatGreen
        emailField.placeholderNormalColor = UIColor.flatGreen
        emailField.dividerActiveColor = UIColor.flatGreen
        
        passwordTextField.placeholderActiveColor = UIColor.flatGreen
        passwordTextField.placeholderNormalColor = UIColor.flatGreen
        passwordTextField.dividerActiveColor = UIColor.flatGreen
        
        passwordCheckTestField.placeholderActiveColor = UIColor.flatGreen
        passwordCheckTestField.placeholderNormalColor = UIColor.flatGreen
        passwordCheckTestField.dividerActiveColor = UIColor.flatGreen
        
        registerButton.backgroundColor = UIColor.flatGreen
        registerButton.layer.shadowColor = UIColor.black.cgColor
        registerButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        registerButton.layer.masksToBounds = false
        registerButton.layer.shadowRadius = 3.0
        registerButton.layer.shadowOpacity = 0.5
        registerButton.layer.cornerRadius = 20
        registerButton.clipsToBounds = true
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        if let login = emailField.text,
            let password = passwordTextField.text {
            createUser(email: login, password: password)
        }
    }
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (user, error) in
            guard let selfNotNil = self else { return }
            if error != nil {
                print(error?.localizedDescription)
            }
            else {
                guard let createdUser = user else { return }
                var user = User(uid: createdUser.uid, email: createdUser.email, providerID: createdUser.providerID, refreshToken: createdUser.refreshToken)
                
                let usersRef = selfNotNil.ref.child(dbReferences.users.rawValue).child(user.uid).ref
                usersRef.setValue(user.toJSON())
                user.ref = usersRef
                
                print(user.ref)
                
                selfNotNil.performSegue(
                    withIdentifier: selfNotNil.segueIdentififerRegistrationStepTwo,
                    sender: user)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentififerRegistrationStepTwo {
            let destVC = segue.destination as! RegisterStepTwoViewController
            destVC.user = sender as! User
            
        }
    }
    
    deinit {
        print("DEINIT CALLED IN REGISTER VIEW CONTROLLER")
    }
}
