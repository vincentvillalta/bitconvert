//
//  ConversionViewController.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import ReSwiftRouter
import ReSwift

class ConversionViewController: UIViewController, Routable {

    private lazy var conversionView: ConversionView = {
        let view = ConversionView()
        view.delegate = self
        return view
    }()
    
    private let store: Store<AppState>
    private var state: HomeFlowState?
    
    //////////////////////////////////
    // MARK: - Overrides
    //////////////////////////////////
    override func loadView() {
        self.view = conversionView
    }
    
    init(store: Store<AppState> = Dependency.shared.store) {
        self.store = store
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ConversionViewController: StoreSubscriber {
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
        let viewModel = ConversionViewModel(state)
        conversionView.update(viewModel: viewModel)
    }
}

extension ConversionViewController: ConversionViewDelegate {
    func didTapBackButton(in view: ConversionView) {
        store.dispatch(SetRouteAction([currencySelectorRoute]))
        self.navigationController?.popViewController(animated: true)
    }
}
