//
//  SizeSectionView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class SizeSectionView: UIView {
    
    var data: SizeSectionModel? {
        didSet {
            if let data = data {
                fetchedSizeTitle(data: data)
            }
        }
    }
    
    var dataValue: SizeSectionModel? {
        didSet {
            if let data = data {
                fetchedSizeValue(dataValue: data)
            }
        }
    }
    
    lazy var titleView = TitleSectionView()
    
    lazy var mandatory: UILabel = {
       let label = UILabel()
        label.text = Strings.obrigatory.text
        label.numberOfLines = 1
        label.backgroundColor = UIColor.blackAiQ
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var middleRadioButton: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    lazy var imageMoney: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage.iconMoney
        return img
    }()
    
    lazy var middleLabel: UILabel = {
       let label = UILabel()
        label.text = Strings.middle.text
        label.font = UIFont.nunitoRegular14
        label.textColor = UIColor.gray
        label.numberOfLines = 1
        return label
    }()
    
    lazy var valueMiddleLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()
    
    lazy var promoValueMiddleLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .right
        label.text = Strings.value1990.text
        label.textColor = UIColor.green
        label.font = UIFont.nunitoBold14
        return label
    }()
    
    lazy var largeRadioButton: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    lazy var largeLabel: UILabel = {
       let label = UILabel()
        label.text = Strings.large.text
        label.font = UIFont.nunitoRegular14
        label.textColor = UIColor.gray
        label.numberOfLines = 1
        return label
    }()
    
    lazy var valueLargeLabel: UILabel = {
       let label = UILabel()
        label.text = Strings.value2890.text
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

extension SizeSectionView: CodableView {
    func buildViews() {
        addSubview(titleView)
        addSubview(mandatory)
        addSubview(middleRadioButton)
        addSubview(imageMoney)
        addSubview(middleLabel)
        addSubview(valueMiddleLabel)
        addSubview(promoValueMiddleLabel)
        addSubview(largeRadioButton)
        addSubview(largeLabel)
        addSubview(valueLargeLabel)
    }
    
    func configConstraints() {
        
        titleView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        mandatory.snp.makeConstraints { make in
            make.centerY.equalTo(titleView.snp.centerY)
            make.trailing.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(108)
        }
        middleRadioButton.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.width.height.equalTo(30)
        }
        imageMoney.snp.makeConstraints { make in
            make.centerY.equalTo(middleRadioButton.snp.centerY)
            make.leading.equalTo(middleRadioButton.snp.trailing).offset(4)
            make.width.height.equalTo(30)
        }
        middleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageMoney.snp.centerY)
            make.leading.equalTo(imageMoney.snp.trailing).offset(4)
        }
        valueMiddleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageMoney.snp.centerY)
            make.leading.equalTo(middleLabel.snp.trailing)
        }
        promoValueMiddleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(valueMiddleLabel.snp.centerY)
            make.leading.equalTo(valueMiddleLabel.snp.trailing).offset(5)
            make.trailing.equalToSuperview()
        }
        largeRadioButton.snp.makeConstraints { make in
            make.top.equalTo(middleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.width.height.equalTo(30)
        }
        largeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(largeRadioButton.snp.centerY)
            make.leading.equalTo(largeRadioButton.snp.trailing).offset(4)
        }
        valueLargeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(largeRadioButton.snp.centerY)
            make.leading.equalTo(largeLabel.snp.trailing)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
        }
    }
}

extension SizeSectionView {
    func fetchedSizeTitle(data: SizeSectionModel){
        let htmlSize = """
                    <span style="font-family: Nunito-Bold; font-size: 16pt;">
                        \(data.title)
                    </span><br>
                    <span style="font-family: Nunito-Bold; font-size: 12pt; color: #6D6F73">
                        \(data.subtitle)
                    </span>
               """
        titleView.textLabel.attributedText = NSAttributedString(html: htmlSize)
    }
    
    func fetchedSizeValue(dataValue: SizeSectionModel){
        let htmlValueMiddle = """
                    <span style="font-family: Nunito-Bold; font-size: 12pt; color: #6D6F73">
                                \(Strings.value2290.text)
                    </span><br>
               """
        valueMiddleLabel.attributedText = NSAttributedString(html: htmlValueMiddle)
    }
}
