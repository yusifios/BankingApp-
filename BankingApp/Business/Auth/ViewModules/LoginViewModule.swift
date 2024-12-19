//
//  LoginViewModule.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 12.11.24.
//

import Foundation
import RealmSwift

final class LoginViewModule {
    private let realm = try! Realm()
    
    enum ViewState {
        case error(String)
        case success
    }
    
    var listener: ((ViewState) -> Void)?
    
    func checkuserNameandPassword(username: String, password: String) -> Bool {
        let users = realm.objects(Register.self)
        let isValid = users.contains { $0.username == username && $0.password == password }
        
        if isValid {
            listener?(.success)
        } else {
            listener?(.error("Invalid username or password"))
        }
        
        return isValid
    }
}
