//
//  QuantifySectionView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class QuantifySectionView: UIView {
    
//    var title: NSAttributedString? {
//        didSet {
//            textLabel.attributedText = title
//        }
//    }
    
    lazy var titleView = TitleSectionView()
    lazy var quantifyView: QuantifyView = {
        let stack = QuantifyView()
        stack.stackView.addArrangedSubview(stack.addItem)
        stack.stackView.addArrangedSubview(stack.qtdItem)
        stack.stackView.addArrangedSubview(stack.decreaseItem)
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension QuantifySectionView: CodableView {
    func buildViews() {
        addSubview(titleView)
        addSubview(quantifyView)
    }
    
    func configConstraints() {
        titleView.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
        }
        quantifyView.snp.makeConstraints { make in
            make.centerY.equalTo(titleView.snp.centerY)
            make.trailing.equalToSuperview()
        }
    }
    func configViews() {
        let htmlQuantify = """
                    <span style="font-family: Nunito-Bold; font-size: 16pt;">
                        quantos?
                    </span><br>
                    <span style="font-family: Nunito-SemiBold; font-size: 14pt; color: #6D6F73">
                        total
                    </span>
                    <span style="font-family: Nunito-Bold; font-size: 14pt;">
                       R$ 29,90
                    </span>
               """
        titleView.title =  NSAttributedString(html: htmlQuantify)
    }
    
}
