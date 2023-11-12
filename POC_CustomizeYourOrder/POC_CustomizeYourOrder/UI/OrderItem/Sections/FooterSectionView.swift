//
//  FooterSectionView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class FooterSectionView: UIView {
    
    private var privatePresentBtn: Bool = false
        
    var presentButton: Bool {
        get { return privatePresentBtn }
        set {
            privatePresentBtn = newValue
            for subview in subviews {
                subview.removeFromSuperview()
            }
            setupViews()
        }
    }
    
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
    }
    
    func configConstraints() {
        footerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.centerX.equalToSuperview()
        }
        privatePresentBtn == true ? presentBtn() : presentCopy()
    }
    
    func configViews() {
        backgroundColor = UIColor.grayToBackground
    }
}

extension FooterSectionView {
    func presentBtn() {
        addSubview(footerButton)
        footerButton.snp.makeConstraints { make in
            make.top.equalTo(footerLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
    }
    
    func presentCopy(){
        addSubview(footerCopyLabel)
        footerCopyLabel.snp.makeConstraints { make in
            make.top.equalTo(footerLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(24)
        }
    }
}
