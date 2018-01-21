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

class RegisterViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTestField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    private let ref = Database.database().reference()
    
    enum dbReferences: String {
        case users = "users"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        if let login = loginTextField.text,
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
                let user = User(uid: createdUser.uid, email: createdUser.email, providerID: createdUser.providerID, refreshToken: createdUser.refreshToken)
                
                let usersRef = selfNotNil.ref.child(dbReferences.users.rawValue)
                usersRef.setValue(user.toJSON())
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
