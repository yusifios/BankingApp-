//
//  FirstCell.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 28.11.24.
//

import UIKit

class FirstCell: UITableViewCell {
    
    static let identifier = "FirstCell"
    private lazy var cardView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 0.5
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: Card){
       
       cardView.text = "\(model.bic ?? "") - \(model.azn ?? 0) "
     
    }
    
    
    fileprivate func configureUI() {
        contentView.addSubview(cardView)
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo:topAnchor, constant: 4),
            cardView.leftAnchor.constraint(equalTo:leftAnchor, constant: 4),
            cardView.bottomAnchor.constraint(equalTo:bottomAnchor, constant: -4),
            cardView.rightAnchor.constraint(equalTo:rightAnchor, constant: -4),
        ])
    }
}
