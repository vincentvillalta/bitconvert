//
//  CurrencySelectorView.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import IGListKit
import ReSwift
import ReSwiftRouter
protocol CurrencySelectorViewDelegate: class {
    func didSelectCurrentcy()
}

class CurrencySelectorView: View {

    //////////////////////////////////
    // MARK: - Public Properties
    //////////////////////////////////
    
    weak var delegate: CurrencySelectorViewDelegate?
    
    //////////////////////////////////
    // MARK: - Private Properties
    //////////////////////////////////
    private let currencies = [
        Currency(name: "US Dolar", symbol: "$", isoCurrency: "USD"),
        Currency(name: "Euro", symbol: "€", isoCurrency: "EUR"),
        Currency(name: "Japan Yen", symbol: "¥", isoCurrency: "JPY"),
        Currency(name: "Australian Dolar", symbol: "$", isoCurrency: "AUD"),
        Currency(name: "Canadian Dolar", symbol: "$", isoCurrency: "CAD"),
        Currency(name: "Mexican Peso", symbol: "$", isoCurrency: "MXN"),
        Currency(name: "UK Pound", symbol: "£", isoCurrency: "GBP"),
        Currency(name: "Swiss Franc", symbol: "SFr", isoCurrency: "CHF")
    ]
    
    private lazy var currenctySelectorViewTitle: UILabel = {
        let label = UILabel()
        label.text = "Hello \(String(describing: UserDefaults.standard.string(forKey: "userName")!))\nSelect your currency"
        label.font = UIFont.appFont(withWeight: .blackItalic, fontSize: 22.0)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var currenciesList: ListCollectionView = {
        let listView = ListCollectionView(frame: .zero, listCollectionViewLayout: ListCollectionViewLayout(stickyHeaders: false, topContentInset: 18.0, stretchToEdge: false))
        listView.backgroundColor = .clear
        if #available(iOS 11.0, *) {
            listView.contentInsetAdjustmentBehavior = .never
        }
        listView.contentInset.bottom = SafeAreaManager.safeAreaBottomOffset
        return listView
    }()
    
    private lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: nil)
        adapter.collectionView = self.currenciesList
        adapter.dataSource = self
        return adapter
    }()
    
    override func commonInit() {
        super.commonInit()
        
        addSubview(currenctySelectorViewTitle)
        currenctySelectorViewTitle.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(18.0)
            make.top.equalToSuperview().inset(SafeAreaManager.safeAreaTopOffset + 20.0)
        }
        
        addSubview(currenciesList)
        currenciesList.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(currenctySelectorViewTitle.snp.bottom).offset(20.0)
        }
        
        self.adapter.performUpdates(animated: true, completion: nil)
    }

}

extension CurrencySelectorView: ListAdapterDataSource {
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is CurrencyViewModel {
            let controller = CurrencySectionController()
            controller.delegate = self
            return controller
        } else {
            return ListSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects: [ListDiffable] = []
        let items: [ListDiffable] = currencies.map { CurrencyViewModel($0) }
        objects.append(contentsOf: items)
        return objects
    }
}

extension CurrencySelectorView: CurrencySectionControllerDelegate {
    func didSelectCurrency(with viewModel: Currency) {
        Dependency.shared.store.state.homeFlowState.selectedCurrency = viewModel
        delegate?.didSelectCurrentcy()
    }
}
