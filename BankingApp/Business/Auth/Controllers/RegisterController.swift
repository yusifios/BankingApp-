//
//  ViewController.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 05.11.24.
//

import UIKit
import RealmSwift

class RegisterController: BaseViewController {
    let realm = try! Realm()
    
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
        let image  = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "h2")
        image.contentMode = .scaleAspectFill
        image.alpha = 0.4
        return image
    }()
    
    private lazy var creat: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create Account"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var firstname: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        //text.placeholder = "  First Name"
       // text.font = UIFont.systemFont(ofSize: 14, weight: .semibold , )
        text.attributedPlaceholder = NSAttributedString(
            string: "First Name",
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
    private lazy var lastname: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        //text.placeholder = "  Last Name"
        //text.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        text.attributedPlaceholder = NSAttributedString(
            string: "Last Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        text.backgroundColor = .white.withAlphaComponent(0.2)
        text.textAlignment = .left
        text.textColor = .white
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.white.cgColor
        text.setLeftPadding(10)
        return text
    }()
    private lazy var fincode: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        //text.placeholder = "  Enter Name"
        //text.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        text.attributedPlaceholder = NSAttributedString(
            string: "Enter FinCode",
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
    
    private lazy var phone: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        //text.placeholder = "  Enter Phone"
        //text.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
    
    private lazy var email: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        //text.placeholder = "  Enter Mail"
        //text.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        text.attributedPlaceholder = NSAttributedString(
            string: "Enter Mail",
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
        //text.placeholder = "  Enter Password"
        //text.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
    
    private lazy var signup: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.addTarget(self, action: #selector(submitSign), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstname , lastname , fincode, phone, email, password])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 14
        return stack
    }()
    
    private lazy var labelLogin: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Already have an account?"
        label.textAlignment = .right
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var login: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(submitLogin), for: .touchUpInside)
        button.layer.cornerRadius = 10
       
        button.setUnderlinedTitle("Login" , color: .white)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appcolor
        print("Realm is located at:", realm.configuration.fileURL!)
    }

    
    override func configureView(){
        view.addSubview(imageH)
        view.addSubview(creat)
        view.addSubview(signup)
        view.addSubview(scrollView)
        view.addSubview(labelLogin)
        view.addSubview(login)
        scrollView.addSubview(contentView)
        contentView.addSubview(stack)
    }
    
    override func configureConstraint(){
        NSLayoutConstraint.activate([
            creat.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            creat.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            creat.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            creat.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1 ),
            imageH.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageH.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            imageH.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            imageH.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 )
            
            
        ]);
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: creat.bottomAnchor, constant: 24),
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ]);
       
            NSLayoutConstraint.activate([
              contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
              contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
              contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
              contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
              contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
          
            ]);
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            stack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            firstname.heightAnchor.constraint(equalToConstant: 40),
            lastname.heightAnchor.constraint(equalToConstant: 40),
            fincode.heightAnchor.constraint(equalToConstant: 40),
            phone.heightAnchor.constraint(equalToConstant: 40),
            email.heightAnchor.constraint(equalToConstant: 40),
            password.heightAnchor.constraint(equalToConstant: 40),
            
        ]);
        NSLayoutConstraint.activate([
            signup.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 30),
            signup.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            signup.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            signup.heightAnchor.constraint(equalToConstant: 40)
            
        ]);
        NSLayoutConstraint.activate([
            labelLogin.topAnchor.constraint(equalTo: signup.bottomAnchor, constant: 12),
            labelLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            labelLogin.heightAnchor.constraint(equalToConstant: 40)
            
        ]);
        NSLayoutConstraint.activate([
            login.topAnchor.constraint(equalTo: signup.bottomAnchor, constant: 12),
            login.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 90),
            login.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    @objc private func submitSign(){
        let user = Register()
        guard let name = firstname.text , let pass = password.text else {return}
        user.username = name
        user.password = pass
        
        try! realm.write({
            realm.add(user)
        })
        
        let lg = LoginController()
        navigationController?.pushViewController(lg, animated: true)
    }
    
    @objc
    private func submitLogin(){
        let lg = LoginController()
        navigationController?.pushViewController(lg, animated: true)
    }
    
}

