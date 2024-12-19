//
//  ViewController.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 13.11.24.
//

import UIKit

class tabBarController: UITabBarController {

    
    private lazy var bar: UITabBarController = {
        let bar = UITabBarController()
       
        
        
        let firstVC = MainController()
        firstVC.view.backgroundColor = .white
        firstVC.title = "First"
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .green
        secondVC.title = "Second"
        
        bar.viewControllers = [firstVC , secondVC]
        return bar
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

   

}
