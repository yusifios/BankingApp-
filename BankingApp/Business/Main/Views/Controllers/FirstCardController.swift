//
//  FirstCardController.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 28.11.24.
//

import UIKit

class FirstCardController: UIViewController {
   
    var list: [Card] = []
    var callback: ((Card) -> Void)?
    
        private lazy var table: UITableView = {
            let t = UITableView()
            t.translatesAutoresizingMaskIntoConstraints = false
            t.delegate = self
            t.dataSource = self
            t.register(FirstCell.self, forCellReuseIdentifier: FirstCell.identifier)
            t.separatorStyle = .none
            return t
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(table)
        configureConstraint()
        fetchData()
    }
    
    func configureConstraint() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            table.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            table.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    func fetchData() {
        let cardList: [Card] = Array(viewModule.fetch())
            list = cardList
            table.reloadData()
        }
    
    private let viewModule: FirstViewModule
    init(viewModule: FirstViewModule) {
        self.viewModule = viewModule
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FirstCardController: UITableViewDelegate,
                              UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        list.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstCell
        let item = list[indexPath.row]
        cell.configureCell(model: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCard = list[indexPath.row]
        callback?(selectedCard) 
        dismiss(animated: true)
    }
}

