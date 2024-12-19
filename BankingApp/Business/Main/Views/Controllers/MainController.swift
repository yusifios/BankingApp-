//
//  ViewController.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 12.11.24.
//

import UIKit
//import RealmSwift
class MainController: UIViewController , TransferDelegate {
    func didCompleteTransferSuccessfully() {
        DispatchQueue.main.async {
            self.cardCollection.reloadData()
        }
    }

    var selectedIndex = 0
    private lazy var backimg: UIImageView = {
            let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.image = UIImage(named: "backimage")
            iv.contentMode = .scaleAspectFill
        iv.alpha = 0.1
        return iv
    }()
    private lazy var cardCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let card = UICollectionView(frame: .zero, collectionViewLayout: layout)
        card.isScrollEnabled = true
        card.isPagingEnabled = true
        card.backgroundColor = .clear

        card.translatesAutoresizingMaskIntoConstraints = false
        card.delegate = self
        card.dataSource = self
        card.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
        return card
    }()
   
    private lazy var addCard: UIImageView = {
            let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.image = UIImage(named: "plus")
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addButton))
            iv.addGestureRecognizer(tapGesture)

            return iv
        }()
    
    private lazy var transferIcon: UIImageView = {
            let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.image = UIImage(named: "transfer")
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tranferFunction))
            iv.addGestureRecognizer(tapGesture)

            return iv
        }()
    
    private lazy var deleteCard: UIImageView = {
            let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.image = UIImage(named: "delete")
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(deleteCr))
            iv.addGestureRecognizer(tapGesture)

            return iv
        }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [addCard, transferIcon , deleteCard])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let viewModule: MainViewModule
    init(viewModule: MainViewModule) {
        self.viewModule = viewModule
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
        configureConstraint()
        viewModule.fetch()
    }
    
     func configureView() {
         view.addSubview(backimg)
         view.addSubview(cardCollection)
         view.addSubview(stack)
    
    }
    
     func configureConstraint() {
         NSLayoutConstraint.activate([
            backimg.topAnchor.constraint(equalTo: view.topAnchor),
            backimg.leftAnchor.constraint(equalTo: view.leftAnchor),
            backimg.rightAnchor.constraint(equalTo: view.rightAnchor),
            backimg.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
         NSLayoutConstraint.activate([
            cardCollection.topAnchor.constraint(equalTo: view.topAnchor, constant: 56),
            cardCollection.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            cardCollection.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            cardCollection.heightAnchor.constraint(equalToConstant: 220)
         ])
         NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: cardCollection.bottomAnchor, constant: 50),
            stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            stack.heightAnchor.constraint(equalToConstant: 50),
            addCard.heightAnchor.constraint(equalToConstant: 40),
            transferIcon.heightAnchor.constraint(equalToConstant: 40),
            deleteCard.heightAnchor.constraint(equalToConstant: 40)
         ])
        }
    
    @objc private func addButton(){
         viewModule.creatCard()
        cardCollection.reloadData()
    }
    
    @objc private func tranferFunction(){
        let tr = TransferController(viewModule: TransferViewModule())
        tr.delegate = self
        navigationController?.show(tr, sender: nil)
    }
    
    @objc private func deleteCr(){
        viewModule.deleteLastCard(Number: selectedIndex)
        cardCollection.reloadData()
    }
}

extension MainController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return viewModule.cards?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        
        if let card = viewModule.cards?[indexPath.row] {
                   cell.configure(card: card)
               }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
