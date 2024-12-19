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
    
    private var ValidationMapping: [UITextField: RegisterViewModel.ValidationType] = [:]
    var back: ((Register) -> Void)?
    
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
    
    lazy var firstname: UITextField = {
        let text = ReusableTextField(placeholder: "First name" , leftPadding: 10)
        text.delegate = self
        return text
    }()
    
    lazy var lastname: UITextField = {
        let text = ReusableTextField(placeholder: "Last name" , leftPadding: 10)
        text.delegate = self
        return text
    }()
    lazy var fincode: UITextField = {
        let text = ReusableTextField(placeholder: "Fincode" , leftPadding: 10)
        text.delegate = self
        return text
    }()
    
    lazy var phone: UITextField = {
        let text = ReusableTextField(placeholder: "994xx xxx xx xx" , leftPadding: 10)
        text.delegate = self
        text.keyboardType = .numberPad
        return text
    }()
    
    lazy var email: UITextField = {
        let text = ReusableTextField(placeholder: "Email" , leftPadding: 10)
        text.delegate = self
        return text
    }()
    
    lazy var password: UITextField = {
        let text = ReusableTextField(placeholder: "Password" , leftPadding: 10)
        text.delegate = self
        return text
    }()
    
    private lazy var signup: UIButton = {
        let button = Button(title: "Sign up", onAction: {[weak self] in self?.submitSign()})
        button.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    private let viewModule: RegisterViewModel
    init(viewModule: RegisterViewModel) {
        self.viewModule = viewModule
        super.init(nibName: nil, bundle: nil)
        // let realm = try! Realm()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appcolor
        print("Realm is located at:", realm.configuration.fileURL!)
        setupMapping()
        configureViewModel()
    }
    
    override func configureView(){
        super.configureView()
        [imageH , creat , signup , scrollView, labelLogin , login].forEach{view.addSubview($0)}
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
    
   private func configureViewModel() {
        viewModule.listener = { [weak self] state in
            switch state {
            case .success(let newUser):
                self?.back?(newUser)
                self?.navigationController?.popViewController(animated: true)
            case .error(let message):
                self?.showMessage(title: "Error", message: message)
            default:
                break
            }
        }
    }
    
    func setupMapping(){
        ValidationMapping = [
            email: .email,
            password: .password,
            fincode: .fin,
            lastname: .lastname,
            phone: .phone,
            firstname: .firstname
            
        ]
    }
    
    private func checkValidation() {
        
        let fields: [(UITextField, RegisterViewModel.ValidationType)] = [
            (firstname, .firstname),
            (lastname, .lastname),
            (fincode, .fin),
            (phone, .phone),
            (email, .email),
            (password, .password)
        ]
        
        var isValid = true
        for (textField, validationType) in fields {
            guard let text = textField.text, !text.isEmpty else {
                textField.layer.borderColor = UIColor.red.cgColor
                isValid = false
                continue
            }
            
            if viewModule.valueValidationType(value: text, type: validationType) {
                textField.layer.borderColor = UIColor.green.cgColor
            } else {
                textField.layer.borderColor = UIColor.red.cgColor
                isValid = false
            }
        }
        
        if !isValid {
            showMessage(title: "Error", message: "Please fix the errors in the highlighted fields.")
            return
        }
        
        guard let name = firstname.text,
              let lastn = lastname.text,
              let fin = fincode.text,
              let phonee = phone.text,
              let mail = email.text,
              let pass = password.text else { return }
        
        viewModule.saveCustomer(name: name, lastName: lastn, customerID: fin, email: mail, phoneNumber: phonee, password: pass)
    }
    
    @objc private func submitSign(){
        checkValidation()
    }
    
    @objc
    private func submitLogin(){
        _ = LoginController(viewModule: LoginViewModule())
        navigationController?.popViewController(animated: true)
    }
}

extension RegisterController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let ismapping = ValidationMapping[textField] else {return}
        
        let finish = viewModule.valueValidationType(value: textField.text ?? "", type: ismapping)
        
        textField.layer.borderColor = finish ? UIColor.green.cgColor : UIColor.red.cgColor
    }
}
