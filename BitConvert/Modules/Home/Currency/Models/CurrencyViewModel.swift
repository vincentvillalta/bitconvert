//
//  CurrencyViewModel.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import IGListKit

class CurrencyViewModel: ListDiffable {

    var identifier: String
    var currency: Currency
    
    init(_ currency: Currency) {
        self.identifier = currency.isoCurrency
        self.currency = currency
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let other = object as? CurrencyViewModel else { return false }
        return currency == other.currency
    }
}
