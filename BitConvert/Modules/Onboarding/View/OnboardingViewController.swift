//
//  OnboardingViewController.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import ReSwiftRouter
import ReSwift

class OnboardingViewController: UIViewController {
    
    private lazy var onboardingView: OnboardingView = {
        let view = OnboardingView()
        view.delegate = self
        return view
    }()

    private let store: Store<AppState>
    private var state: OnboardingFlowState?
    
    //////////////////////////////////
    // MARK: - Overrides
    //////////////////////////////////
    override func loadView() {
        self.view = onboardingView
    }
    
    init(store: Store<AppState> = Dependency.shared.store) {
        self.store = store
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension OnboardingViewController: StoreSubscriber {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.subscribe(self) { state in
            return state.select({$0.onboardingFlowState}).skipRepeats()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    func newState(state: OnboardingFlowState) {
        self.state = state
        let model = OnboardingViewModel(state)
        onboardingView.update(viewModel: model)
    }
}

extension OnboardingViewController: OnboardingViewDelegate {
    func didUpdateName(with value: String?, in view: OnboardingView) {
        guard let value = value else { return }
        store.dispatch(OnboardingAction.SetNameValue(value))
    }
    
    func didTapNextButton(in view: OnboardingView) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(store.state.onboardingFlowState.name, forKey: "userName")
        store.dispatch(SetRouteAction([currencySelectorRoute]))
    }
    
    
}
