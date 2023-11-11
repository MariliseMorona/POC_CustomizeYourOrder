//
//  CutlerySectionView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class CutlerySectionView: UIView {
    
    lazy var titleView = TitleSectionView()
    lazy var hashiView: QuantifyView = {
        let stack = QuantifyView()
        stack.stackView.addArrangedSubview(stack.addItem)
        return stack
    }()
    
    lazy var hashiLabel: UILabel = {
       let label = UILabel()
        label.text = "hashi"
        label.numberOfLines = 1
        label.font = UIFont.nunitoRegular14
        label.textColor = UIColor.gray
        return label
    }()
    
    lazy var forkView: QuantifyView = {
        let stack = QuantifyView()
        stack.stackView.addArrangedSubview(stack.addItem)
        return stack
    }()

    lazy var forkLabel: UILabel = {
       let label = UILabel()
        label.text = "garfo e faca descartável"
        label.numberOfLines = 1
        label.font = UIFont.nunitoRegular14
        label.textColor = UIColor.gray
        return label
    }()
    
    lazy var valueForkLabel: UILabel = {
       let label = UILabel()
        label.text = "+R$ 1,00"
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

extension CutlerySectionView: CodableView {
    func buildViews() {
        addSubview(titleView)
        addSubview(hashiView)
        addSubview(hashiLabel)
        addSubview(forkView)
        addSubview(forkLabel)
        addSubview(valueForkLabel)
    }
    
    func configConstraints() {
        titleView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        hashiView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.leading.equalToSuperview()
        }
        hashiLabel.snp.makeConstraints { make in
            make.centerY.equalTo(hashiView.snp.centerY)
            make.leading.equalTo(hashiView.snp.trailing).offset(8)
        }
        forkView.snp.makeConstraints { make in
            make.top.equalTo(hashiView.snp.bottom).offset(12)
            make.leading.equalToSuperview()
        }
        forkLabel.snp.makeConstraints { make in
            make.centerY.equalTo(forkView.snp.centerY)
            make.leading.equalTo(forkView.snp.trailing).offset(8)
        }
        valueForkLabel.snp.makeConstraints { make in
            make.centerY.equalTo(forkView.snp.centerY)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(12)
        }
    }
    
    func configViews() {
        let htmlFork = """
                   <span style="font-family: Nunito-Bold; font-size: 16pt;">
                        precisa de talher?
                   </span><br>
                   <span style="font-family: Nunito-Bold; font-size: 12pt; color: #6D6F73">
                        escolha até 1
                   </span>
               """
        titleView.title =  NSAttributedString(html: htmlFork)
    }
}
