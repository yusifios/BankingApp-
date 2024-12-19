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
    @Persisted var fincode: String?
    @Persisted var phone: String?
    @Persisted var email: String?
    @Persisted var lastname: String?
    
    var userData: (username: String?, password: String?) {
            return (username, password)
        }
//    convenience init(username: String?, password: String?, fincode: String?, phone: String?, email: String?, lastname: String?) {
//            self.init()
//            self.username = username
//            self.password = password
//            self.fincode = fincode
//            self.phone = phone
//            self.email = email
//            self.lastname = lastname
//        }
    
}
