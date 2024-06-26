//
//  ViewController.swift
//  LoginApp
//
//  Created by Даниил Павленко on 09.04.2023.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonSignup: UIButton!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var labelSignup: UILabel!
    @IBOutlet weak var envelopImageView: UIImageView!
    @IBOutlet weak var lockImageView: UIImageView!
    
    // MARK: - Properties
    private let defaultColor = UIColor(named: "MyColor") ?? UIColor.darkGray
    private let errorColor = UIColor.systemRed
    private let inactiveColor = UIColor.lightGray
    
    private var email: String = ""
    private var password: String = ""
    
    var mockEmail = "dan@gmail.com"
    var mockPassword = "Qw12345"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
        addShadow()
        offLoginButton()
    }
    
    // MARK: - IBActions
    @IBAction func buttonLoginAction(_ sender: UIButton) {
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
        
        if email == "" {
            makeErrorField(textField: textFieldEmail)
        }
        
        if password == "" {
            makeErrorField(textField: textFieldPassword)
        }
        
        if email == mockEmail && password == mockPassword {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            let alert = UIAlertController(title: "Ups..".localized, message: "Wrong e-mail or paassword".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
    @IBAction func buttonSignupAction(_ sender: UIButton) {
    }
    
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) {
    }
    
    // MARK: - Methods
    private func addShadow() {
        buttonLogin.layer.shadowColor = defaultColor.cgColor
        buttonLogin.layer.shadowOffset = CGSize(width: 2, height: 2)
        buttonLogin.layer.shadowOpacity = 0.8
        buttonLogin.layer.shadowRadius = 3
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        offLoginButton()
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else { return }
        switch textField {
        case textFieldEmail:
            let isValidEmail = checkEmail(email: text)
            
            if isValidEmail {
                // TODO: save email
                email = text
                makeDefaultField(textField: textField)
            } else {
                makeErrorField(textField: textField)
                email = ""
            }
        case textFieldPassword:
            let isValidPassword = checkPassword(password: text)
            
            if isValidPassword {
                // TODO: save password
                password = text
                makeDefaultField(textField: textField)
            } else {
                makeErrorField(textField: textField)
                password = ""
            }
        default:
            print("unknown textField")
        }
        
        if !email.isEmpty && !password.isEmpty {
            onLoginButton()
        }
    }
    
    private func checkEmail(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func checkPassword(password: String) -> Bool {
        let regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$/
        return password.contains(regex)
    }
    
    private func makeDefaultField(textField: UITextField) {
        switch textField {
        case textFieldEmail:
            envelopImageView.tintColor = defaultColor
            viewEmail.backgroundColor = defaultColor
        case textFieldPassword:
            lockImageView.tintColor = defaultColor
            viewPassword.backgroundColor = defaultColor
        default:
            print("unknown textField")
        }
    }
    
    private func makeErrorField(textField: UITextField) {
        switch textField {
        case textFieldEmail:
            envelopImageView.tintColor = errorColor
            viewEmail.backgroundColor = errorColor
        case textFieldPassword:
            lockImageView.tintColor = errorColor
            viewPassword.backgroundColor = errorColor
        default:
            print("unknown textField")
        }
    }
    
    private func offLoginButton() {
        buttonLogin.isUserInteractionEnabled = false
        buttonLogin.backgroundColor = inactiveColor
    }
    
    private func onLoginButton() {
        buttonLogin.isUserInteractionEnabled = true
        buttonLogin.backgroundColor = defaultColor
    }
}
