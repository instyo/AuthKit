//
//  TextField+Extension.swift
//  Google Auth
//
//  Created by Ikhwan Setyo on 16/04/26.
//

import UIKit

extension UITextField {
    func applyRoundedStyle(padding: CGFloat = 16) {
        // Ensure layout is ready
        layoutIfNeeded()
        borderStyle = .none
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
        
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        let rightPadding = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        
        leftView = leftPadding
        leftViewMode = .always
        
        rightView = rightPadding
        rightViewMode = .always
    }
}
