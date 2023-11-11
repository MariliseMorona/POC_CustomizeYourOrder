//
//  FooterSectionView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class FooterSectionView: UIView {
    
    lazy var footerLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.purple
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var footerCopyLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.purple
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var footerButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.purple
        btn.layer.cornerRadius = 8
        btn.setTitle("ver ticket", for: .normal)
        btn.tintColor = .white
        btn.titleLabel?.font = UIFont.nunitoBold16
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

extension FooterSectionView: CodableView {
    func buildViews() {
        addSubview(footerLabel)
        addSubview(footerButton)
    }
    
    func configConstraints() {
        footerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.centerX.equalToSuperview()
        }
        footerButton.snp.makeConstraints { make in
            make.top.equalTo(footerLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
//        footerCopyLabel.snp.makeConstraints { make in
//            make.top.equalTo(footerLabel.snp.bottom).offset(8)
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.bottom.equalToSuperview().inset(24)
//        }
    }
    
    func configViews() {
        backgroundColor = UIColor.grayToBackground
        let htmlAiq = """
                    <p style="text-align: center;">
                        <span style="font-family: Nunito-Bold; font-size: 12pt; color: #580F78">
                            feito com &hearts; em Maringá-PR
                        </span>
                    </p>
                """
        print("printando htmlAiq:\(htmlAiq)")
        footerLabel.attributedText =  NSAttributedString(html: htmlAiq)
        
        let htmlCopy = """
                   <p style="font-family: Nunito-Bold; font-size: 12pt; text-align: center; color: #580F78;">
                            aiqfome.com © 2007-2023 aiqfome LTDA.<br>
                            CNPJ: 09.186.786/0001-58<br></p>
               """
        footerCopyLabel.attributedText =  NSAttributedString(html: htmlCopy)
    }
}
