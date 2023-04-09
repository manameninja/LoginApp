//
//  ViewController.swift
//  LoginApp
//
//  Created by Даниил Павленко on 09.04.2023.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonSignup: UIButton!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var labelSignup: UILabel!
    
    // MARK: - IBActions
    @IBAction func buttonLoginAction(_ sender: UIButton) {
    }
    @IBAction func buttonSignupAction(_ sender: UIButton) {
    }
    
    // MARK: - Life Cylce
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
    }
    
    // MARK: - Methods
    private func addShadow() {
        buttonLogin.layer.shadowColor = UIColor.darkGray.cgColor
        buttonLogin.layer.shadowOffset = CGSize(width: 2, height: 2)
        buttonLogin.layer.shadowOpacity = 0.8
        buttonLogin.layer.shadowRadius = 3
    }
}
