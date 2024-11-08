//
//  Register.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 05.11.24.
//

import RealmSwift
class Register: Object {
    @Persisted var username: String?
    @Persisted var password: String?
    
}
