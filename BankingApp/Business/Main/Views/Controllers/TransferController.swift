//
//  TransferController.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 21.11.24.
//

import UIKit
import RealmSwift

protocol TransferDelegate: AnyObject {
    func didCompleteTransferSuccessfully()
}

class TransferController: UIViewController {
    
    var selected1: Card?
    var selected2: Card?
    weak var delegate: TransferDelegate?
    
    private lazy var backimg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "backimage")
        iv.contentMode = .scaleAspectFill
        iv.alpha = 0.1
        return iv
    }()
    
    private lazy var labelfirst: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.text = "First card"
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 10
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTappedfirst))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    private lazy var labelsecond: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.text = "Second card"
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 10
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTappedsecond))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    private lazy var trans: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.layer.borderWidth = 0.5
        text.layer.cornerRadius = 5
        text.keyboardType = .numberPad
        return text
    }()
    
    private lazy var trButton: UIButton = {
        let button = Button(title: "Transfer", onAction: {[weak self] in self?.transfermoney()})
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [labelfirst , labelsecond , trans , trButton, backimg].forEach{view.addSubview($0)}
        viewModule.fetch()
        constraints()
        updateLabels()
        
    }
    
    private let viewModule: TransferViewModule
    
    init(viewModule: TransferViewModule) {
        self.viewModule = viewModule
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints(){
        NSLayoutConstraint.activate([
            backimg.topAnchor.constraint(equalTo: view.topAnchor),
            backimg.leftAnchor.constraint(equalTo: view.leftAnchor),
            backimg.rightAnchor.constraint(equalTo: view.rightAnchor),
            backimg.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            labelfirst.heightAnchor.constraint(equalToConstant: 40),
            labelfirst.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            labelfirst.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            labelfirst.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            
            labelsecond.heightAnchor.constraint(equalToConstant: 40),
            labelsecond.topAnchor.constraint(equalTo: labelfirst.bottomAnchor, constant: 24),
            labelsecond.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            labelsecond.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            
            trans.heightAnchor.constraint(equalToConstant: 40),
            trans.topAnchor.constraint(equalTo: labelsecond.bottomAnchor, constant: 24),
            trans.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            trans.widthAnchor.constraint(equalToConstant: 100),
            
            trButton.heightAnchor.constraint(equalToConstant: 40),                    trButton.topAnchor.constraint(equalTo: trans.bottomAnchor, constant: 24),
            trButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            trButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
        ])
    }
    
    @objc  func labelTappedfirst() {
        let first = FirstCardController(viewModule: FirstViewModule())
        if let sheet = first.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            
        }
        present(first, animated: true)
        first.callback = { [weak self] selectedCard in
            self?.selected1 = selectedCard
            self?.updateLabels()
        }        
    }
    
    @objc  func labelTappedsecond() {
        let first = FirstCardController(viewModule: FirstViewModule())
        if let sheet = first.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            
        }
        present(first, animated: true)
        first.callback = { [weak self] selectedCard in
            self?.selected2 = selectedCard
            self?.updateLabels()
        }
    }
    
    func updateLabels() {
        labelfirst.text = "\(selected1?.bic ?? "Karti 1 secin") - \(selected1?.azn ?? 0)"
        labelsecond.text = "\(selected2?.bic ?? "Karti 2 Secin") - \(selected2?.azn ?? 0)"
    }
    
    @objc private func transfermoney(){
        guard let fromCard = selected1, let toCard = selected2 else {
            return   showError("Hər iki karti seçin")
        }
        
        guard  labelfirst.text != labelsecond.text else {
            return showError("Eyni kart seçilib")
        }
        
        guard let amountText = trans.text, let amount = Int(amountText), amount > 0 else {
            return  showError("Min məbləğ 1")
            
        }

        viewModule.listener = { [weak self] state in
                guard let self = self else { return }
                switch state {
                case .succes(let message):
                    self.delegate?.didCompleteTransferSuccessfully()
                    let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                        self.navigationController?.popViewController(animated: true)
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                    
                case .error(let errorMessage):
                    self.showError(errorMessage)
                }
            }

        _ = viewModule.transfer(fromCard: fromCard, toCard: toCard, amount: amount)
            
    }
}
