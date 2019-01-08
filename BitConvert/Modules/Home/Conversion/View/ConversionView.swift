//
//  ConversionView.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

protocol ConversionViewDelegate: class {
    func didTapBackButton(in view: ConversionView)
}

class ConversionView: View {
    
    var delegate: ConversionViewDelegate?

    private lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "backbutton"), for: .normal)
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var convertedTitle: UILabel = {
        let label = UILabel()
        label.text = "The current value of 1 BTC is"
        label.font = UIFont.appFont(withWeight: .black, fontSize: 18.0)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var convertedValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.appFont(withWeight: .blackItalic, fontSize: 42.0)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var convertedCurrency: UILabel = {
        let label = UILabel()
        label.font = UIFont.appFont(withWeight: .regular, fontSize: 22.0)
        label.textAlignment = .center
        label.textColor = .white
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    private lazy var convertedStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [convertedValue, convertedCurrency])
        stack.axis = .vertical
        stack.isHidden = true
        return stack
    }()
    
    private lazy var hugeSymbol: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appFont(withWeight: .blackItalic, fontSize: UIScreen.main.bounds.width * 1.5)
        label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 5)
        label.textColor = UIColor.black.withAlphaComponent(0.1)
        return label
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let act = UIActivityIndicatorView(style: .whiteLarge)
        act.hidesWhenStopped = true
        act.startAnimating()
        return act
    }()
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [convertedStack, spinner])
        stack.axis = .vertical
        return stack
    }()
    
    @objc func dismissButtonTapped() {
        delegate?.didTapBackButton(in: self)
    }
    
    //////////////////////////////////
    // MARK: - State
    //////////////////////////////////
    func update(viewModel: ConversionViewModel) {
        convertedStack.isHidden = !viewModel.hasFinishedLoading
        spinner.isHidden = viewModel.hasFinishedLoading
        convertedCurrency.text = viewModel.currency?.isoCurrency
        convertedValue.text = viewModel.convertedValue
        hugeSymbol.text = viewModel.currency?.symbol
    }
    
    //////////////////////////////////
    // MARK: - Overrides
    //////////////////////////////////
    
    override func commonInit() {
        super.commonInit()
        addSubview(hugeSymbol)
        hugeSymbol.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(18.0)
            make.top.equalToSuperview().inset(SafeAreaManager.safeAreaTopOffset + 20.0)
        }
        
        addSubview(convertedTitle)
        convertedTitle.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(36.0)
            make.centerX.equalToSuperview()
        }
        
        addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(convertedTitle.snp.bottom).offset(12.0)
            make.leading.trailing.equalToSuperview()
        }
    }

}
