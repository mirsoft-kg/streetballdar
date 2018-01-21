//
//  RegisterViewController.swift
//  StreetBalldar
//
//  Created by Kesh Pola on 1/16/18.
//  Copyright © 2018 Mirsoft.kg. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTestField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
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
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error?.localizedDescription)
            }
            else {
                Auth.auth().
                debugPrint(user?.email)
                debugPrint(user?.displayName)
                debugPrint(user?.phoneNumber)
                debugPrint(user?.photoURL)
                debugPrint(user?.providerID)
                debugPrint(user?.refreshToken)
                debugPrint(user?.uid)
            }
        }
    }
}
