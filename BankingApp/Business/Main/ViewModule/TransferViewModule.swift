//
//  TransferViewModule.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 22.11.24.
//

import Foundation
import RealmSwift

final class TransferViewModule {
    enum viewState {
       case error(String)
       case succes(String)
    }
    let realm = try? Realm()
    
    var trCards: Results<Card>?
    var listener: ((viewState) -> Void)?
    
    
    func fetch(){
        trCards = realm?.objects(Card.self).sorted(byKeyPath: "time", ascending: false)
    }
    
    func transfer(fromCard: Card, toCard: Card, amount: Int) -> Bool {
       
        guard let aznInt = fromCard.azn,  aznInt >= amount else {
            listener?(.error("Kifayət qədər vəsait yoxdur"))
            return false
        }
        do {
            try realm?.write {
                fromCard.azn = aznInt - amount
                toCard.azn = (toCard.azn ?? 0) + amount
            }
            listener?(.succes("Uğurlu əməliyyat"))
            return true
        } catch {
            listener?(.error("not"))
            return false
        }
    }
    
    
}
