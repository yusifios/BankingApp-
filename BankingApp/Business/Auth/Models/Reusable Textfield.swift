//
//  Reusable Textfield.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 21.11.24.
//

import Foundation
import UIKit

class ReusableTextField: UITextField {

    private var placeholderText: String
   
    private var leftPadding: CGFloat
    
    init(placeholder: String,  leftPadding: CGFloat = 10) {
        self.placeholderText = placeholder
       
        self.leftPadding = leftPadding
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    func setupUI() {
        attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white.withAlphaComponent(0.2)
        textColor = .white
        textAlignment = .left
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        setLeftPadding(leftPadding)
    }
    
        private func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.height))
        leftView = paddingView
        leftViewMode = .always
    }
}
