//
//  SignUpViewController.swift
//  Google Auth
//
//  Created by Ikhwan Setyo on 16/04/26.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    private var keyboardManager: KeyboardManager?
    
    @objc func myButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func onTapSignUp(_ sender: UIButton) {
        print("Button tapped")
        if passwordTextField.text != confirmPasswordTextField.text {
            print("HEllo")
            view.showToast(message: "Password didn't match!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        emailTextField.delegate = self
        fullNameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        fullNameTextField.tag = 0
        emailTextField.tag = 1
        passwordTextField.tag = 2
        confirmPasswordTextField.tag = 3
        
        // Apply rounded textfield
        emailTextField.applyRoundedStyle()
        fullNameTextField.applyRoundedStyle()
        passwordTextField.applyRoundedStyle()
        confirmPasswordTextField.applyRoundedStyle()
        
        // Push view above the keyboard when appears
        keyboardManager = KeyboardManager { [weak self] height in
            guard let self = self else { return }
            self.view.frame.origin.y = height > 0 ? -height : 0
        }
        
    }
}

extension SignUpViewController: UITextFieldDelegate {
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
