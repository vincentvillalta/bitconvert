//
//  OnboardingView.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

protocol OnboardingViewDelegate: class {
    func didUpdateName(with value: String?, in view: OnboardingView)
    func didTapNextButton(in view: OnboardingView)
}

class OnboardingView: View {

    //////////////////////////////////
    // MARK: - Public Properties
    //////////////////////////////////
    
    weak var delegate: OnboardingViewDelegate?
    
    //////////////////////////////////
    // MARK: - State
    //////////////////////////////////
    func update(viewModel: OnboardingViewModel) {
        self.continueButton.isEnabled = viewModel.canContinue
        self.nameTextField.text = viewModel.nameValue
    }
    
    //////////////////////////////////
    // MARK: - Private Properties
    //////////////////////////////////
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to BitConvert!\nlet's start by tipping your name"
        label.numberOfLines = 0
        label.font = UIFont.appFont(withWeight: .black, fontSize: 22.0)
        label.textColor = .white
        return label
    }()
    
    private lazy var nameTextField: BCTextField = {
        let textField = BCTextField(frame: .zero)
        textField.font = UIFont.appFont(withWeight: .regular, fontSize: 18.0)
        textField.textContentType = .name
        textField.autocapitalizationType = .words
        textField.addChangeTarget(self, action: #selector(textFieldDidChangeValue))
        return textField
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .disabled)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .highlighted)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.appFont(withWeight: .blackItalic, fontSize: 20.0)
        button.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        return button
    }()
    
    ///////////////////////////////
    // MARK: - Actions
    ///////////////////////////////
    @objc func textFieldDidChangeValue() {
        let text = nameTextField.text
        delegate?.didUpdateName(with: text, in: self)
    }
    
    @objc func submitButtonPressed() {
        delegate?.didTapNextButton(in: self)
    }
    //////////////////////////////////
    // MARK: - Overrides
    //////////////////////////////////
    override func commonInit() {
        super.commonInit()
        
        addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(18.0)
            make.top.equalToSuperview().inset(SafeAreaManager.safeAreaTopOffset + 20.0)
        }
        
        addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(18.0)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(20.0)
            make.height.equalTo(40.0)
        }
        
        addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameTextField.snp.bottom).offset(20.0)
        }
    }
}
