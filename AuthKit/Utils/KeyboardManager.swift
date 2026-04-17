//
//  KeyboardListenable.swift
//  Google Auth
//
//  Created by Ikhwan Setyo on 17/04/26.
//

import Foundation
import UIKit

final class KeyboardManager {
    
    private var onChange: ((CGFloat) -> Void)?
    
    init(onChange: @escaping (CGFloat) -> Void) {
        self.onChange = onChange
        addObservers()
    }
    
    deinit {
        removeObservers()
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleKeyboard),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleKeyboard),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleKeyboard),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )
    }
    
    private func removeObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func handleKeyboard(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let frameEnd = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        let keyboardHeight = UIScreen.main.bounds.height - frameEnd.origin.y
        onChange?(keyboardHeight)
    }
}
