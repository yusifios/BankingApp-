//
//  Extension.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 05.11.24.
//

import Foundation
import UIKit

extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

extension UIButton {
    func setUnderlinedTitle(_ title: String, color: UIColor = .systemBlue) {
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: color
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        self.setAttributedTitle(attributedTitle, for: .normal)
    }
}
