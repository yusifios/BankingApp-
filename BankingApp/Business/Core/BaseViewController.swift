//
//  BaseViewController.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 05.11.24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureConstraint()
    }
    
    open func configureView(){
        view.backgroundColor = .white
    }
    open func configureConstraint(){}
    
}
