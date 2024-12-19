//
//  RegisterViewModule.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 09.11.24.
//

import Foundation
import RealmSwift 

final class RegisterViewModel {
    
    enum ViewState {
        case error(String)
        case fieldError(ValidationType)
        case fieldValid(ValidationType)
        case success(Register)
    }
    
    var listener: ((ViewState) -> Void)?
    
    private let realm = try? Realm()
    
    private var check: [ValidationType: Bool] = [
        .password: false,
        .email: false,
        .fin: false,
        .firstname: false,
        .phone: false,
        .lastname: false
    ]
    
    var isAllValid: Bool {
        return check.values.contains(false)
    }
    
    func saveCustomer(name: String, lastName: String, customerID: String, email: String, phoneNumber: String, password: String) {
        let list = Register()
        list.username = name
        list.lastname = lastName
        list.fincode = customerID
        list.email = email
        list.password = password
        list.phone = phoneNumber
        
        do {
            try realm?.write {
                realm?.add(list)
            }
            listener?(.success(list))
        } catch {
            listener?(.error(error.localizedDescription))
        }
    }
    
    enum ValidationType {
        case email , password , fin , firstname , lastname , phone
    }
    
    func valueValidationType (value: String , type: ValidationType) -> Bool {
        
        let isValid: Bool
        switch type {
        case .email:
            isValid = value.isValidEmail()
        case .password:
            isValid = value.isValidPass()
        case .fin:
            isValid = value.isValidFinCode()
        case .firstname:
            isValid = value.isValidName()
        case .lastname:
            isValid = value.isValidLastname()
        case .phone:
            isValid = value.isValidPhoneNumber()
        }
        
        check[type] = isValid
        
        if isValid {
            listener?(.fieldValid(type))
        } else {
            listener?(.fieldError(type))
        }
        
        return isValid
    }
}
