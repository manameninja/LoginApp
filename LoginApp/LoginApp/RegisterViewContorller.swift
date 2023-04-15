//
//  RegisterViewContorller.swift
//  LoginApp
//
//  Created by Даниил Павленко on 11.04.2023.
//

import UIKit

final class RegisterViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextFieldRegister: UITextField!
    @IBOutlet weak var passwordTextFieldRegister: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Properties
    var registerEmail: String = "@."
    var registerPassword: String = "1234"
    
    // MARK: - Life Cylce
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonAction(_ sender: UIButton) {
        if let check = emailTextFieldRegister.text {
            registerEmail = check
            print(registerEmail)
        }
        if let check = passwordTextFieldRegister.text {
            registerPassword = check
            print(registerPassword)
        }
    }
}
