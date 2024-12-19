//
//  CardCell.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 19.11.24.
//

import UIKit

class CardCell: UICollectionViewCell {
    
     var cardimg: UIImageView = {
        let img = UIImageView()
         img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "cardimg")
        img.contentMode = .scaleAspectFill
         img.layer.zPosition = -1
         
        return img
    }()
    
     var cardNumbers: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 0.5
        label.text = "Kart nomresi qaqasim"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
         label.layer.cornerRadius = 10
         label.layer.borderColor = UIColor.gray.cgColor
         label.textColor = .white
        return label
    }()
    
     var cardType: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 0.5
        label.text = "V/M"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
         label.layer.cornerRadius = 10
         label.layer.borderColor = UIColor.gray.cgColor
         label.textColor = .white
         return label
    }()
    
     var cardTime: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 0.5
        label.text = "3il ela"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
         label.layer.cornerRadius = 10
         label.layer.borderColor = UIColor.gray.cgColor
         label.textColor = .white
         return label
    }()
    
    var cardAzn: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 0.5
        label.text = "10-30"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor.gray.cgColor
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        [cardAzn, cardTime, cardType, cardNumbers, cardimg ].forEach{contentView.addSubview($0)}
            // backgroundColor = .white
            configureConstraint()
        contentView.layer.borderColor = UIColor.clear.cgColor
        
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    
        func configureConstraint() {
            NSLayoutConstraint.activate([
                cardimg.topAnchor.constraint(equalTo: contentView.topAnchor),
                cardimg.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                cardimg.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                cardimg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                cardTime.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                cardTime.heightAnchor.constraint(equalToConstant: 40),
                cardTime.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
                cardTime.widthAnchor.constraint(equalToConstant: 50),
                cardAzn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                cardAzn.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
                cardAzn.widthAnchor.constraint(equalToConstant: 50),
                cardAzn.heightAnchor.constraint(equalToConstant: 30),
                cardNumbers.bottomAnchor.constraint(equalTo: cardAzn.topAnchor, constant: -10),
                cardNumbers.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
                cardNumbers.heightAnchor.constraint(equalToConstant: 30),
                cardNumbers.widthAnchor.constraint(equalToConstant: 200),
                cardType.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                cardType.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
                cardType.widthAnchor.constraint(equalToConstant: 50),
                cardType.heightAnchor.constraint(equalToConstant: 40)
            
            ])
        }
    
    func configure(card: Card) {
            cardNumbers.text = card.bic
            cardType.text = card.type?.rawValue
            cardTime.text = card.time
        cardAzn.text = "\(card.azn ?? 0)"
        }
    
}
