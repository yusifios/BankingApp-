//
//  FirstViewModule.swift
//  BankingApp
//
//  Created by Yusıf Aqakerımov on 03.12.24.
//

import Foundation
import RealmSwift

final class FirstViewModule {
    let realm = try? Realm()
    var trCards: Results<Card>?
    
    func fetch()->[Card]{
        guard let realm = realm else { return [] }
        let trCards = realm.objects(Card.self).sorted(byKeyPath: "time", ascending: false)
        return Array(trCards)
    }
    
    
}
