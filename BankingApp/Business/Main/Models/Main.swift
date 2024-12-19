//
//  Main.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 19.11.24.
//

import Foundation
import RealmSwift
enum Type: String , PersistableEnum{
    case visa = "Visa"
    case master = "Master"
}
class Card: Object {
    @Persisted var bic: String?
    @Persisted var time: String?
    @Persisted var azn: Int?
    @Persisted var type: Type?
    
  
}
