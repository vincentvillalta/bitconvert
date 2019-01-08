//
//  CurrencyCollectionViewCell.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

class CurrencyCollectionViewCell: UICollectionViewCell {

    
    func update(viewModel: Currency) -> Void {
        symbol.text = viewModel.symbol
        currencyName.text = viewModel.name
    }
    
    private lazy var wrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 6.0
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 10
        return view
    }()
    
    private lazy var symbol: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appFont(withWeight: .blackItalic, fontSize:150.0)
        label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 5)
        label.textColor = UIColor.black.withAlphaComponent(0.1)
        return label
    }()
    
    private lazy var currencyName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appFont(withWeight: .semiBold, fontSize: 30.0)
        label.textColor = UIColor.black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit() {
        addSubview(wrapperView)
        wrapperView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        wrapperView.addSubview(symbol)
        symbol.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        wrapperView.addSubview(currencyName)
        currencyName.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.top.bottom.equalToSuperview()
        }
    }
}


