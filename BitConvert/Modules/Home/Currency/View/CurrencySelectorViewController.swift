//
//  CurrencySelectorViewController.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import ReSwift
import ReSwiftRouter
class CurrencySelectorViewController: UIViewController {

    private lazy var currencyView: CurrencySelectorView = {
        let view = CurrencySelectorView()
        view.delegate = self
        return view
    }()
    
    private let store: Store<AppState>
    private var state: HomeFlowState?
    
    //////////////////////////////////
    // MARK: - Overrides
    //////////////////////////////////
    override func loadView() {
        self.view = currencyView
    }
    
    init(store: Store<AppState> = Dependency.shared.store) {
        self.store = store
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CurrencySelectorViewController: StoreSubscriber {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.subscribe(self) { state in
            return state.select({$0.homeFlowState}).skipRepeats()
        }
        
        store.dispatch(HomeActions.convertValue)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    func newState(state: HomeFlowState) {
        self.state = state
    }
}


extension CurrencySelectorViewController: CurrencySelectorViewDelegate {
    func didSelectCurrentcy() {
        store.dispatch(SetRouteAction([currencySelectorRoute, convertRoute]))
    }
}
