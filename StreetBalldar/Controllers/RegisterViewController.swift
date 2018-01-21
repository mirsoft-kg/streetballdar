//
//  RegisterViewController.swift
//  StreetBalldar
//
//  Created by Kesh Pola on 1/16/18.
//  Copyright © 2018 Mirsoft.kg. All rights reserved.
//

import UIKit
import FirebaseAuth
import Material
import ChameleonFramework

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailField: ErrorTextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var passwordCheckTestField: TextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailField.placeholderActiveColor = UIColor.flatGreen
        self.emailField.placeholderNormalColor = UIColor.flatGreen
        self.emailField.dividerActiveColor = UIColor.flatGreen
        
        self.passwordTextField.placeholderActiveColor = UIColor.flatGreen
        self.passwordTextField.placeholderNormalColor = UIColor.flatGreen
        self.passwordTextField.dividerActiveColor = UIColor.flatGreen
        
        self.passwordCheckTestField.placeholderActiveColor = UIColor.flatGreen
        self.passwordCheckTestField.placeholderNormalColor = UIColor.flatGreen
        self.passwordCheckTestField.dividerActiveColor = UIColor.flatGreen
        
        self.registerButton.backgroundColor = UIColor.flatGreen
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
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            debugPrint(user)
        }
    }
}

//extension RegisterViewController {
//    fileprivate func prepareEmailField() {
//        emailField = ErrorTextField()
//        emailField.placeholder = "Email"
//        emailField.detail = "Error, incorrect email"
//        emailField.isClearIconButtonEnabled = true
//        emailField.delegate = self
////        emailField.isPlaceholderUppercasedWhenEditing = true
////        emailField.placeholderAnimation = .hidden
//
//        // Set the colors for the emailField, different from the defaults.
////                emailField.placeholderNormalColor = Color.green.base
//                emailField.placeholderActiveColor = Color.green.base
//                emailField.dividerNormalColor = Color.green.base
//                emailField.dividerActiveColor = Color.green.base
//        // Set the text inset
//                emailField.textInset = 20
//
//        view.layout(emailField).center(offsetY: -passwordTextField.bounds.height - 60).left(20).right(20)
//    }
//
//    fileprivate func preparePasswordField() {
//        passwordTextField = TextField()
//        passwordTextField.placeholder = "Password"
//        passwordTextField.detail = "At least 8 characters"
//        passwordTextField.clearButtonMode = .whileEditing
//        passwordTextField.isVisibilityIconButtonEnabled = true
//
//        passwordTextField.placeholderActiveColor = Color.green.base
//        passwordTextField.dividerActiveColor = Color.green.base
//        passwordTextField.dividerNormalColor = Color.green.base
//
//        // Setting the visibilityIconButton color.
//        passwordTextField.visibilityIconButton?.tintColor = Color.green.base.withAlphaComponent(passwordTextField.isSecureTextEntry ? 0.38 : 0.54)
//
//        view.layout(passwordTextField).center().left(20).right(20)
//    }
//
////    fileprivate func preparePasswordCheckField() {
////        passwordCheckTestField = TextField()
////        passwordCheckTestField.placeholder = "Password check"
////        passwordCheckTestField.detail = "At least 8 characters"
////        passwordCheckTestField.clearButtonMode = .whileEditing
////        passwordCheckTestField.isVisibilityIconButtonEnabled = true
////
////        passwordCheckTestField.placeholderActiveColor = Color.green.base
////        passwordCheckTestField.dividerActiveColor = Color.green.base
////        passwordCheckTestField.dividerNormalColor = Color.green.base
////
////        // Setting the visibilityIconButton color.
////        passwordCheckTestField.visibilityIconButton?.tintColor = Color.green.base.withAlphaComponent(passwordCheckTestField.isSecureTextEntry ? 0.38 : 0.54)
////
////        view.layout(passwordCheckTestField).center().left(20).right(20)
////    }
//}
//
//
//extension RegisterViewController: TextFieldDelegate {
//    public func textFieldDidEndEditing(_ textField: UITextField) {
//        (textField as? ErrorTextField)?.isErrorRevealed = false
//    }
//
//    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        (textField as? ErrorTextField)?.isErrorRevealed = false
//        return true
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        (textField as? ErrorTextField)?.isErrorRevealed = true
//        return true
//    }
//}

