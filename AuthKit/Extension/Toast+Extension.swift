//
//  Toast+Extension.swift
//  Google Auth
//
//  Created by Ikhwan Setyo on 17/04/26.
//

import UIKit

extension UIView {
    
    func showToast(
        message: String,
        duration: TimeInterval = 2.0,
        bottomOffset: CGFloat = 80
    ) {
        // Create label
        let label = PaddingLabel()
        label.text = message
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        label.alpha = 0
        label.layer.cornerRadius = 16
        label.clipsToBounds = true
        
        // Add to view
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -24),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -bottomOffset)
        ])
        
        // Animate in
        UIView.animate(withDuration: 0.3) {
            label.alpha = 1
        }
        
        // Animate out after delay
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            UIView.animate(withDuration: 0.3, animations: {
                label.alpha = 0
            }, completion: { _ in
                label.removeFromSuperview()
            })
        }
    }
}
