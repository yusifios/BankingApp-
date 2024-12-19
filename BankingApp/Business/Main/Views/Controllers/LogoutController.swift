//
//  LogoutController.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 15.11.24.
//

import UIKit

class LogoutController: UIViewController {
    
    private lazy var trButton: UIButton = {
        let button = Button(title: "Log out", onAction: {[weak self] in self?.logout()})
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(trButton)
        constraints()
    }
    
    @objc private func logout(){
       if let lg = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
           lg.switchToLogin()
        }
    }
    
    func constraints(){
        NSLayoutConstraint.activate([
    trButton.heightAnchor.constraint(equalToConstant: 40),                    trButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
    trButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
    trButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
])
}
}
