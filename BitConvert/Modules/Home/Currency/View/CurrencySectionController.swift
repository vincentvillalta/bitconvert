//
//  CurrencySectionController.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import IGListKit

protocol CurrencySectionControllerDelegate: class {
    func didSelectCurrency(with viewModel: Currency)
}

class CurrencySectionController: ListSectionController {

    weak var delegate: CurrencySectionControllerDelegate?
    var currency: Currency?
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func didUpdate(to object: Any) {
        self.currency = (object as? CurrencyViewModel)?.currency
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let containerSize = collectionContext?.containerSize else { return .zero }
        return CGSize(width: containerSize.width, height: 108.0)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let currency = currency, let context = collectionContext else {
            fatalError()
        }
        let cell = context.dequeueReusableCell(type: CurrencyCollectionViewCell.self, for: self, at: index)
        cell.update(viewModel: currency)
        return cell
    }

    override func didSelectItem(at index: Int) {
        guard let currency = currency else { return }
        delegate?.didSelectCurrency(with: currency)
    }
}
