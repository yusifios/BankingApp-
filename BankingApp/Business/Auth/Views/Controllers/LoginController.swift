////
////  LoginController.swift
////  BankingApp
////
////  Created by Yusıf Aqakerımov on 06.11.24.
////
//

import UIKit

class LoginController: BaseViewController {
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageH: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "h1")
        image.contentMode = .scaleAspectFill
        image.alpha = 0.4
        return image
    }()
    
    private lazy var imageF: UIImageView = {
        let image  = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "frank")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var phoneNum: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.attributedPlaceholder = NSAttributedString(
            string: "Enter Phone",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        text.backgroundColor = .white.withAlphaComponent(0.2)
        text.textColor = .white
        text.textAlignment = .left
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.white.cgColor
        text.setLeftPadding(10)
        return text
    }()
    
    private lazy var password: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.attributedPlaceholder = NSAttributedString(
            string: "Enter Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        text.backgroundColor = .white.withAlphaComponent(0.2)
        text.textColor = .white
        text.textAlignment = .left
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.white.cgColor
        text.setLeftPadding(10)
        return text
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [phoneNum, password])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 14
        return stack
    }()
    
    private lazy var signin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    private lazy var labelregister: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senin Linkedinin yoxdu, sen nece devlopersen?"
        label.textAlignment = .right
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var register: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(sumbitregister), for: .touchUpInside)
        button.layer.cornerRadius = 10
        
        button.setUnderlinedTitle("Register" , color: .white)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appcolor
    }
    
    override func configureView() {
        view.addSubview(imageH)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stack)
        view.addSubview(imageF)
        view.addSubview(signin)
        view.addSubview(register)
        view.addSubview(labelregister)
        
    }
    
    override func configureConstraint() {
        NSLayoutConstraint.activate([
            imageH.topAnchor.constraint(equalTo: view.topAnchor),
            imageH.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageH.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageH.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            imageF.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            imageF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageF.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            imageF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: imageF.bottomAnchor, constant: 40),
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stack.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            phoneNum.heightAnchor.constraint(equalToConstant: 40),
            password.heightAnchor.constraint(equalToConstant: 40),
        ])
        NSLayoutConstraint.activate([
            signin.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 2),
            signin.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            signin.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            signin.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        NSLayoutConstraint.activate([
            labelregister.topAnchor.constraint(equalTo: signin.bottomAnchor, constant: 12),
            labelregister.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            labelregister.heightAnchor.constraint(equalToConstant: 40)
            
        ]);
        NSLayoutConstraint.activate([
            register.topAnchor.constraint(equalTo: signin.bottomAnchor, constant: 12),
            register.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 160),
            register.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    @objc
    private func signIn(){
        
    }
    @objc
    private func sumbitregister(){
        let rg = RegisterController()
        navigationController?.pushViewController(rg, animated: true)
    }
}
