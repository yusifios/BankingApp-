//
//  MainViewModule.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 19.11.24.
//

import Foundation
import RealmSwift

final class MainViewModule {
    let realm = try? Realm()
    
    let isVisa = Bool.random()
    var cards: Results<Card>?
    
    func fetch(){
        cards = realm?.objects(Card.self)
    }
    
    func writeRealm(model: Object) {
        do {
            try realm?.write {
                realm?.add(model)
            }
        } catch {
            print("Eror: \(error.localizedDescription)")
        }
    }
    
    func deleteRealm(model: Object){
        do {
            try realm?.write {
                realm?.delete(model)
            }
        } catch {
            print("Error deleting last card: \(error.localizedDescription)")
        }
    }
    
    func creatCard(){
        let card = Card()
        card.bic = String.generateRandomCardNumber(isVisa: Bool.random())
        card.time = String.generateCardExpiryDate()
        card.azn = String.generateRandomAzn()
        if Bool.random() {
            card.type = .visa
        } else{
            card.type = .master
        }
        
        writeRealm(model: card)
        fetch()
    }
    
    func deleteLastCard(Number: Int) {
        guard let cardss = cards, cardss.count > 1  else {return}
        let selectCard = cardss[Number]
        deleteRealm(model: selectCard)
        fetch()
    }
    
}
