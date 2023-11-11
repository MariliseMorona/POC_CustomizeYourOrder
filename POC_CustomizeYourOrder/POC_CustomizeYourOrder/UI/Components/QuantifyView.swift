//
//  QuantifyView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class QuantifyView: UIView {
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }()
    
    lazy var decreaseItem: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "decreaseBtn"), for: .normal)
        return btn
    }()
    
    lazy var qtdItem: UILabel = {
       let label = UILabel()
        label.text = "0"
        label.font = UIFont.nunitoBold16
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    lazy var addItem: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "addBtn"), for: .normal)
        return btn
    }()
    
    lazy var defaultAddBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .gray
        btn.setTitle("adicionar", for: .normal)
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = UIFont.nunitoBold14
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension QuantifyView: CodableView {
    func buildViews() {
        addSubview(stackView)
    }
    
    func configConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        decreaseItem.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        qtdItem.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        addItem.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        defaultAddBtn.snp.makeConstraints { make in
            make.width.equalTo(108)
            make.height.equalTo(40)
        }
    }
}
