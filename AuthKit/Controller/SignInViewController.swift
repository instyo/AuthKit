//
//  SignInViewController.swift
//  Google Auth
//
//  Created by Ikhwan Setyo on 16/04/26.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    private var keyboardManager: KeyboardManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.tag = 0
        passwordTextField.tag = 1
        
        // Set border radius of text field
        emailTextField.applyRoundedStyle()
        passwordTextField.applyRoundedStyle()
        
        // Push view above the keyboard when appears
        keyboardManager = KeyboardManager { [weak self] height in
            guard let self = self else { return }
            self.view.frame.origin.y = height > 0 ? -height : 0
        }
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextTextField = view.viewWithTag(nextTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
