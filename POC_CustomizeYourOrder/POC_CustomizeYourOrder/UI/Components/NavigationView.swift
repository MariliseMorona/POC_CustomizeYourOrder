//
//  NavigationView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class NavigationView: UIView {
    
    var address: String = "" {
        didSet {
            descriptionLabel.text = address
        }
    }
    
    lazy var imageLocation: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage.iconLocalization
        return img
    }()
    
    lazy var textLabel: UILabel = {
       let label = UILabel()
        label.text = "entregando em"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.nunitoBold14
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "\(address) >"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.nunitoBold16
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var btnNavigation: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
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

extension NavigationView: CodableView {
    func buildViews() {
        addSubview(imageLocation)
        addSubview(textLabel)
        addSubview(descriptionLabel)
        addSubview(btnNavigation)
    }
    
    func configConstraints() {
        imageLocation.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
        textLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(imageLocation.snp.trailing).offset(10)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom)
            make.leading.equalTo(imageLocation.snp.trailing).offset(10)
            make.trailing.bottom.equalToSuperview()
        }
        btnNavigation.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}
