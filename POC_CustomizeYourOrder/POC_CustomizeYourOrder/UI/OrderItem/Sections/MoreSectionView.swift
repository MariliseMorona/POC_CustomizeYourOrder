//
//  MoreSectionView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class MoreSectionView: UIView {
    
    var title: NSAttributedString? {
        didSet {
            titleView.title = title
        }
    }
    
    lazy var titleView = TitleSectionView()
    lazy var cookieView: QuantifyView = {
        let stack = QuantifyView()
        stack.stackView.addArrangedSubview(stack.addItem)
        return stack
    }()
    
    lazy var cookieLabel: UILabel = {
       let label = UILabel()
        label.text = Strings.cookie.text
        label.numberOfLines = 1
        label.font = UIFont.nunitoRegular14
        label.textColor = UIColor.gray
        return label
    }()
    
    lazy var valueCookieLabel: UILabel = {
       let label = UILabel()
        label.text = Strings.value2.text
        label.numberOfLines = 1
        label.textAlignment = .right
        label.font = UIFont.nunitoBold14
        label.textColor = UIColor.purple
        return label
    }()
    
    lazy var rollView: QuantifyView = {
        let stack = QuantifyView()
        stack.stackView.addArrangedSubview(stack.addItem)
        return stack
    }()

    lazy var rollLabel: UILabel = {
       let label = UILabel()
        label.text = Strings.roll.text
        label.numberOfLines = 1
        label.font = UIFont.nunitoRegular14
        label.textColor = UIColor.gray
        return label
    }()
    
    lazy var valueRollLabel: UILabel = {
       let label = UILabel()
        label.text = Strings.value8.text
        label.numberOfLines = 1
        label.textAlignment = .right
        label.font = UIFont.nunitoBold14
        label.textColor = UIColor.purple
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MoreSectionView: CodableView {
    func buildViews() {
        addSubview(titleView)
        addSubview(cookieView)
        addSubview(cookieLabel)
        addSubview(valueCookieLabel)
        addSubview(rollView)
        addSubview(rollLabel)
        addSubview(valueRollLabel)
    }
    
    func configConstraints() {
        titleView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        cookieView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.leading.equalToSuperview()
        }
        cookieLabel.snp.makeConstraints { make in
            make.centerY.equalTo(cookieView.snp.centerY)
            make.leading.equalTo(cookieView.snp.trailing).offset(8)
        }
        valueCookieLabel.snp.makeConstraints { make in
            make.centerY.equalTo(cookieView.snp.centerY)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(12)
        }
        rollView.snp.makeConstraints { make in
            make.top.equalTo(cookieLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview()
        }
        rollLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rollView.snp.centerY)
            make.leading.equalTo(rollView.snp.trailing).offset(8)
        }
        valueRollLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rollView.snp.centerY)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(12)
        }
    }
}

