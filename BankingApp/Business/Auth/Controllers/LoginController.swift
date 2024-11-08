//
//  LoginController.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 06.11.24.
//

import UIKit

class LoginController: BaseViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .appcolor
        
    }
    
    private lazy var imageH: UIImageView = {
        let image  = UIImageView()
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
    
    private lazy var ScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
        
      }()
    
    private lazy var ContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        let stack = UIStackView(arrangedSubviews: [password , phoneNum])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()

    override func configureView() {
        view.addSubview(imageH)
        view.addSubview(imageF)
        view.addSubview(ScrollView)
        ScrollView.addSubview(ContentView)
        ContentView.addSubview(stack)
    }

    override func configureConstraint() {
        NSLayoutConstraint.activate([
        imageH.topAnchor.constraint(equalTo: view.topAnchor),
        imageH.leftAnchor.constraint(equalTo: view.leftAnchor),
        imageH.rightAnchor.constraint(equalTo: view.rightAnchor),
        imageH.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        imageF.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        imageF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18),
        imageF.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
        imageF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            ScrollView.topAnchor.constraint(equalTo: imageF.bottomAnchor, constant: 24),
            ScrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 4),
            ScrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -4),
            ScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -500),    
        ])
         
                NSLayoutConstraint.activate([
                  ContentView.topAnchor.constraint(equalTo: ScrollView.topAnchor),
                  ContentView.leftAnchor.constraint(equalTo: ScrollView.leftAnchor),
                  ContentView.bottomAnchor.constraint(equalTo: ScrollView.bottomAnchor),
                  ContentView.rightAnchor.constraint(equalTo: ScrollView.rightAnchor),
                  ContentView.widthAnchor.constraint(equalTo: ScrollView.widthAnchor)
            
        ])
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: ContentView.bottomAnchor, constant: 0),
            stack.leftAnchor.constraint(equalTo: ContentView.leftAnchor, constant: 0),
            stack.rightAnchor.constraint(equalTo: ContentView.rightAnchor, constant: 0),
            stack.bottomAnchor.constraint(equalTo: ContentView.bottomAnchor, constant: 0),
            phoneNum.heightAnchor.constraint(equalToConstant: 40),
            password.heightAnchor.constraint(equalToConstant: 40),
           
        ])
    }
    
}
