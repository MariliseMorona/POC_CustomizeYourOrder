//
//  DrinkSectionView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class DrinkSectionView: UIView {
    
    private var privateFirstCount: Int = -1
    var firstCount: Int = 0 {
        didSet {
            privateFirstCount = firstCount
            quantifyFirstDrinkView.qtdItem.text = String(privateFirstCount)
        }
    }
    
    private var privateSecondCount: Int = -1
    var secondCount: Int = 0 {
        didSet {
            privateSecondCount = secondCount
            quantifySecondDrinkView.qtdItem.text = String(privateSecondCount)
        }
    }
    
    private var privateThirdCount: Int = -1
    var thirdCount: Int = 0 {
        didSet {
            privateThirdCount = thirdCount
            quantifyThirdDrinkView.qtdItem.text = String(privateThirdCount)
        }
    }
    
//    var title: NSAttributedString? {
//        didSet {
//            textLabel.attributedText = title
//        }
//    }
    
    lazy var titleView = TitleSectionView()
    lazy var quantifyFirstDrinkView: QuantifyView = {
        let stack = QuantifyView()
        stack.stackView.addArrangedSubview(stack.decreaseItem)
        stack.decreaseItem.tag = 0
        stack.stackView.addArrangedSubview(stack.qtdItem)
        stack.stackView.addArrangedSubview(stack.addItem)
        stack.addItem.tag = 0
        return stack
    }()
    lazy var quantifySecondDrinkView: QuantifyView = {
        let stack = QuantifyView()
        stack.stackView.addArrangedSubview(stack.decreaseItem)
        stack.decreaseItem.tag = 1
        stack.stackView.addArrangedSubview(stack.qtdItem)
        stack.stackView.addArrangedSubview(stack.addItem)
        stack.addItem.tag = 1
        return stack
    }()
    lazy var quantifyThirdDrinkView: QuantifyView = {
        let stack = QuantifyView()
        stack.stackView.addArrangedSubview(stack.decreaseItem)
        stack.decreaseItem.tag = 2
        stack.stackView.addArrangedSubview(stack.qtdItem)
        stack.stackView.addArrangedSubview(stack.addItem)
        stack.addItem.tag = 2
        return stack
    }()
    
    lazy var labelCocaItem: UILabel = {
       let label = UILabel()
        label.text = "coca-cola"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.nunitoRegular14
        label.textColor = UIColor.gray
        return label
    }()
    lazy var valueCocaItem: UILabel = {
       let label = UILabel()
        label.text = "+R$ 10,00"
        label.numberOfLines = 1
        label.font = UIFont.nunitoBold14
        label.textColor = UIColor.purple
        return label
    }()
    
    lazy var labelPratsItem: UILabel = {
       let label = UILabel()
        label.text = "suco prats laranja"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.nunitoRegular14
        label.textColor = UIColor.gray
        return label
    }()
    lazy var valuePratsItem: UILabel = {
       let label = UILabel()
        label.text = "+R$ 6,00"
        label.numberOfLines = 1
        label.font = UIFont.nunitoBold14
        label.textColor = UIColor.purple
        return label
    }()
    lazy var labelWaterItem: UILabel = {
       let label = UILabel()
        label.text = "água sem gás"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.nunitoRegular14
        label.textColor = UIColor.gray
        return label
    }()
    
    lazy var valueWaterItem: UILabel = {
       let label = UILabel()
        label.text = "+R$ 3,00"
        label.numberOfLines = 1
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

extension DrinkSectionView: CodableView {
    func buildViews() {
        addSubview(titleView)
        addSubview(quantifyFirstDrinkView)
        addSubview(labelCocaItem)
        addSubview(valueCocaItem)
        addSubview(quantifySecondDrinkView)
        addSubview(labelPratsItem)
        addSubview(valuePratsItem)
        addSubview(quantifyThirdDrinkView)
        addSubview(labelWaterItem)
        addSubview(valueWaterItem)

    }
    
    func configConstraints() {
        titleView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        quantifyFirstDrinkView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.leading.equalToSuperview()
        }
        labelCocaItem.snp.makeConstraints { make in
            make.centerY.equalTo(quantifyFirstDrinkView.snp.centerY)
            make.leading.equalTo(quantifyFirstDrinkView.snp.trailing).offset(8)
        }
        valueCocaItem.snp.makeConstraints { make in
            make.centerY.equalTo(labelCocaItem.snp.centerY)
            make.trailing.equalToSuperview()
        }
        quantifySecondDrinkView.snp.makeConstraints { make in
            make.top.equalTo(quantifyFirstDrinkView.snp.bottom).offset(12)
            make.leading.equalToSuperview()
        }
        labelPratsItem.snp.makeConstraints { make in
            make.centerY.equalTo(quantifySecondDrinkView.snp.centerY)
            make.leading.equalTo(quantifySecondDrinkView.snp.trailing).offset(8)
        }
        valuePratsItem.snp.makeConstraints { make in
            make.centerY.equalTo(labelPratsItem.snp.centerY)
            make.trailing.equalToSuperview()
        }
        quantifyThirdDrinkView.snp.makeConstraints { make in
            make.top.equalTo(quantifySecondDrinkView.snp.bottom).offset(12)
            make.leading.equalToSuperview()
        }
        labelWaterItem.snp.makeConstraints { make in
            make.centerY.equalTo(quantifyThirdDrinkView.snp.centerY)
            make.leading.equalTo(quantifyThirdDrinkView.snp.trailing).offset(8)
        }
        valueWaterItem.snp.makeConstraints { make in
            make.centerY.equalTo(labelWaterItem.snp.centerY)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(12)
        }
    }
    func configViews() {
        let htmlDrink = """
                   <span style="font-family: Nunito-Bold; font-size: 16pt;">
                        vai querer bebida?
                   </span><br>
                   <span style="font-family: Nunito-Bold; font-size: 12pt; color: #6D6F73">
                        escolha quantas quiser
                   </span>
               """
        titleView.title =  NSAttributedString(html: htmlDrink)
    }
    
}


