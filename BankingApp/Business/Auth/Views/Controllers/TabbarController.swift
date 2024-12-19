//
//  ViewController.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 13.11.24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaultsHelper.setInteger(key: UserDefaultsKey.loginType.rawValue, value: 1)
      bar()
    }
    
    func bar(){
        let firstVC = MainController(viewModule: MainViewModule())
        firstVC.tabBarItem = UITabBarItem(title: "Card", image: UIImage(systemName: "creditcard"), tag: 1)
        
        let secondVC = LogoutController()
        secondVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle.fill"), tag: 2)
        
        viewControllers = [firstVC , secondVC]
    }
    
    func configureContraint(){
        NSLayoutConstraint.activate([
        ])
    }
}
