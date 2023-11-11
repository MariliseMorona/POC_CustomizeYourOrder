//
//  OrderView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 10/11/23.
//

import UIKit
import SnapKit

class OrderView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var imageItem: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "food")
        return img
    }()
    
    //MARK: TITLE
    lazy var titleItem = TitleSectionView()
    
    //MARK: QUANTIFY
    lazy var quantifyItem = TitleSectionView()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [decreaseItem, qtdItem, addItem])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
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
        label.numberOfLines = 1
        return label
    }()
    
    lazy var addItem: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "addBtn"), for: .normal)
        return btn
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    //MARK: SIZE
    lazy var stackSizeView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [sizeItem, mandatory])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    lazy var sizeItem = TitleSectionView()
    
    lazy var mandatory: UILabel = {
       let label = UILabel()
        label.text = "obrigatório"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var middleRadioButton: UIButton = {
        let btn = UIButton()
         btn.backgroundColor = .blue
//         btn.setImage(UIImage(UIImage(named: "deselectedRadioBtn")?.withRenderingMode(.alwaysOriginal)), for: .normal)
//         btn.setImage(UIImage(UIImage(named: "selectedRadioBtn")?.withRenderingMode(.alwaysOriginal)), for: .selected)
         return btn
    }()
    
    lazy var imageMoney: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "iconMoney")
        return img
    }()
    
    lazy var middleLabel: UILabel = {
       let label = UILabel()
        label.text = "médio"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var valueMiddleLabel: UILabel = {
       let label = UILabel()
        label.text = "de R$ 22,90 por R$ 19,90"
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()
    
    lazy var largeRadioButton: UIButton = {
        let btn = UIButton()
         btn.backgroundColor = .green
//         btn.setImage(UIImage(UIImage(named: "deselectedRadioBtn")?.withRenderingMode(.alwaysOriginal)), for: .normal)
//         btn.setImage(UIImage(UIImage(named: "selectedRadioBtn")?.withRenderingMode(.alwaysOriginal)), for: .selected)
         return btn
    }()
    
    lazy var largeLabel: UILabel = {
       let label = UILabel()
        label.text = "grande"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var valueLargeLabel: UILabel = {
       let label = UILabel()
        label.text = "R$ 28,90"
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()
    
    lazy var separatorSizeView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    //MARK: DRINK
    lazy var drinkItem = TitleSectionView()
    
    lazy var drinkCocaStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [decreaseCocaItem, qtdCocaItem, addCocaItem])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var decreaseCocaItem: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "decreaseBtn"), for: .normal)
        return btn
    }()
    
    lazy var qtdCocaItem: UILabel = {
       let label = UILabel()
        label.text = "0"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var addCocaItem: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "addBtn"), for: .normal)
        return btn
    }()
    
    lazy var labelCocaItem: UILabel = {
       let label = UILabel()
        label.text = "coca-cola"
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    lazy var valueCocaItem: UILabel = {
       let label = UILabel()
        label.text = "+R$ 10,00"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var drinkPratsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [decreasePratsItem, qtdPratsItem, addPratsItem])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var decreasePratsItem: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "decreaseBtn"), for: .normal)
        return btn
    }()
    
    lazy var qtdPratsItem: UILabel = {
       let label = UILabel()
        label.text = "0"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var addPratsItem: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "addBtn"), for: .normal)
        return btn
    }()
    
    lazy var labelPratsItem: UILabel = {
       let label = UILabel()
        label.text = "suco prats laranja"
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    lazy var valuePratsItem: UILabel = {
       let label = UILabel()
        label.text = "+R$ 6,00"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var drinkWaterStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [decreaseWaterItem, qtdWaterItem, addWaterItem])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var decreaseWaterItem: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "decreaseBtn"), for: .normal)
        return btn
    }()
    
    lazy var qtdWaterItem: UILabel = {
       let label = UILabel()
        label.text = "0"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var addWaterItem: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "addBtn"), for: .normal)
        return btn
    }()
    
    lazy var labelWaterItem: UILabel = {
       let label = UILabel()
        label.text = "água sem gás"
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    lazy var valueWaterItem: UILabel = {
       let label = UILabel()
        label.text = "+R$ 3,00"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var separatorDrinkView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    //MARK: TALHER
    lazy var talherItem = TitleSectionView()

    lazy var hashiRadioButton: UIButton = {
        let btn = UIButton()
         btn.backgroundColor = .blue
//         btn.setImage(UIImage(UIImage(named: "deselectedRadioBtn")?.withRenderingMode(.alwaysOriginal)), for: .normal)
//         btn.setImage(UIImage(UIImage(named: "selectedRadioBtn")?.withRenderingMode(.alwaysOriginal)), for: .selected)
         return btn
    }()
    
    lazy var hashiLabel: UILabel = {
       let label = UILabel()
        label.text = "hashi"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var forkRadioButton: UIButton = {
        let btn = UIButton()
         btn.backgroundColor = .green
//         btn.setImage(UIImage(UIImage(named: "deselectedRadioBtn")?.withRenderingMode(.alwaysOriginal)), for: .normal)
//         btn.setImage(UIImage(UIImage(named: "selectedRadioBtn")?.withRenderingMode(.alwaysOriginal)), for: .selected)
         return btn
    }()
    
    lazy var forkLabel: UILabel = {
       let label = UILabel()
        label.text = "garfo e faca descartável"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var valueForkLabel: UILabel = {
       let label = UILabel()
        label.text = "+R$ 1,00"
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()
    
    lazy var separatorTalherView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    //MARK: More Items
    lazy var moreItem = TitleSectionView()
    
    lazy var cookieRadioButton: UIButton = {
        let btn = UIButton()
         btn.backgroundColor = .blue
//         btn.setImage(UIImage(UIImage(named: "deselectedRadioBtn")?.withRenderingMode(.alwaysOriginal)), for: .normal)
//         btn.setImage(UIImage(UIImage(named: "selectedRadioBtn")?.withRenderingMode(.alwaysOriginal)), for: .selected)
         return btn
    }()
    
    lazy var cookieLabel: UILabel = {
       let label = UILabel()
        label.text = "biscoito da sorte"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var valueCookieLabel: UILabel = {
       let label = UILabel()
        label.text = "+R$ 2,00"
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()
    
    lazy var rollRadioButton: UIButton = {
        let btn = UIButton()
         btn.backgroundColor = .green
//         btn.setImage(UIImage(UIImage(named: "deselectedRadioBtn")?.withRenderingMode(.alwaysOriginal)), for: .normal)
//         btn.setImage(UIImage(UIImage(named: "selectedRadioBtn")?.withRenderingMode(.alwaysOriginal)), for: .selected)
         return btn
    }()
    
    lazy var rollLabel: UILabel = {
       let label = UILabel()
        label.text = "rolinho primavera"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var valueRollLabel: UILabel = {
       let label = UILabel()
        label.text = "+R$ 8,00"
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()
    
    lazy var separatorMoreView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var containerTextView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var inputTextView: UITextField = {
        let text = UITextField()
        text.backgroundColor = .yellow
        text.placeholder = "alguma observação do item? opcional ex.: tirar algum ingrediente, ponto do prato"
        return text
    }()
    
    lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var footerLabel: UILabel = {
       let label = UILabel()
        label.text = "feito com <3 em maringá-PR"
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    lazy var footerButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .purple
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

extension OrderView: CodableView {
    func buildViews() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(imageItem)
        containerView.addSubview(titleItem)
        containerView.addSubview(quantifyItem)
        containerView.addSubview(stackView)
        containerView.addSubview(separatorView)
        containerView.addSubview(stackSizeView)
        containerView.addSubview(middleRadioButton)
        containerView.addSubview(imageMoney)
        containerView.addSubview(middleLabel)
        containerView.addSubview(valueMiddleLabel)
        containerView.addSubview(largeRadioButton)
        containerView.addSubview(largeLabel)
        containerView.addSubview(valueLargeLabel)
        containerView.addSubview(separatorSizeView)
        containerView.addSubview(drinkItem)
        containerView.addSubview(drinkCocaStackView)
        containerView.addSubview(labelCocaItem)
        containerView.addSubview(valueCocaItem)
        containerView.addSubview(drinkPratsStackView)
        containerView.addSubview(labelPratsItem)
        containerView.addSubview(valuePratsItem)
        containerView.addSubview(drinkWaterStackView)
        containerView.addSubview(labelWaterItem)
        containerView.addSubview(valueWaterItem)
        containerView.addSubview(separatorDrinkView)
        containerView.addSubview(talherItem)
        containerView.addSubview(hashiRadioButton)
        containerView.addSubview(hashiLabel)
        containerView.addSubview(forkRadioButton)
        containerView.addSubview(forkLabel)
        containerView.addSubview(valueForkLabel)
        containerView.addSubview(separatorTalherView)
        containerView.addSubview(moreItem)
        containerView.addSubview(cookieRadioButton)
        containerView.addSubview(cookieLabel)
        containerView.addSubview(valueCookieLabel)
        containerView.addSubview(rollRadioButton)
        containerView.addSubview(rollLabel)
        containerView.addSubview(valueRollLabel)
        containerView.addSubview(separatorMoreView)
        containerView.addSubview(containerTextView)
        containerTextView.addSubview(inputTextView)
        containerView.addSubview(footerView)
        footerView.addSubview(footerLabel)
        footerView.addSubview(footerButton)
    }
    
    func configConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.snp.makeConstraints { make in
            make.top.bottom.width.equalTo(scrollView)
        }
        imageItem.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).inset(26)
            make.leading.trailing.equalTo(containerView)
            make.height.equalTo(195)
        }
        titleItem.snp.makeConstraints { make in
            make.top.equalTo(imageItem.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView)
        }
        quantifyItem.snp.makeConstraints { make in
            make.top.equalTo(titleItem.snp.bottom).offset(8)
            make.leading.equalTo(containerView)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(quantifyItem.snp.bottom).offset(8)
            make.leading.equalTo(quantifyItem.snp.trailing)
            make.trailing.equalTo(containerView)
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
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(8)
            make.height.equalTo(2)
            make.leading.trailing.equalTo(containerView)
        }
        stackSizeView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom)
            make.leading.trailing.equalTo(containerView)
            make.height.equalTo(100)
        }
        middleRadioButton.snp.makeConstraints { make in
            make.top.equalTo(stackSizeView.snp.bottom)
            make.leading.equalTo(containerView)
            make.width.height.equalTo(30)
        }
        imageMoney.snp.makeConstraints { make in
            make.centerY.equalTo(middleRadioButton.snp.centerY)
            make.leading.equalTo(middleRadioButton.snp.trailing)
            make.width.height.equalTo(30)
        }
        middleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageMoney.snp.centerY)
            make.leading.equalTo(imageMoney.snp.trailing)
        }
        valueMiddleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageMoney.snp.centerY)
            make.leading.equalTo(middleLabel.snp.trailing)
            make.trailing.equalTo(containerView)
        }
        largeRadioButton.snp.makeConstraints { make in
            make.top.equalTo(middleLabel.snp.bottom)
            make.leading.equalTo(containerView)
            make.width.height.equalTo(30)
        }
        largeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(largeRadioButton.snp.centerY)
            make.leading.equalTo(largeRadioButton.snp.trailing)
        }
        valueLargeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(largeRadioButton.snp.centerY)
            make.leading.equalTo(largeLabel.snp.trailing)
            make.trailing.equalTo(containerView)
        }
        separatorSizeView.snp.makeConstraints { make in
            make.top.equalTo(valueLargeLabel.snp.bottom).offset(8)
            make.height.equalTo(2)
            make.leading.trailing.equalTo(containerView)
        }
        drinkItem.snp.makeConstraints { make in
            make.top.equalTo(separatorSizeView.snp.bottom)
            make.leading.trailing.equalTo(containerView)
        }
        drinkCocaStackView.snp.makeConstraints { make in
            make.top.equalTo(drinkItem.snp.bottom).offset(8)
            make.leading.equalTo(containerView)
        }
        decreaseCocaItem.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        qtdCocaItem.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        addCocaItem.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        labelCocaItem.snp.makeConstraints { make in
            make.centerY.equalTo(drinkCocaStackView.snp.centerY)
            make.leading.equalTo(drinkCocaStackView.snp.trailing)
        }
        valueCocaItem.snp.makeConstraints { make in
            make.centerY.equalTo(drinkCocaStackView.snp.centerY)
            make.leading.equalTo(labelCocaItem.snp.trailing)
            make.trailing.equalTo(containerView)
        }
        drinkPratsStackView.snp.makeConstraints { make in
            make.top.equalTo(drinkCocaStackView.snp.bottom).offset(8)
            make.leading.equalTo(containerView)
            make.height.equalTo(100)
        }
        decreasePratsItem.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        qtdPratsItem.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        addPratsItem.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        labelPratsItem.snp.makeConstraints { make in
            make.centerY.equalTo(drinkPratsStackView.snp.centerY)
            make.leading.equalTo(drinkPratsStackView.snp.trailing)
        }
        valuePratsItem.snp.makeConstraints { make in
            make.centerY.equalTo(drinkPratsStackView.snp.centerY)
            make.leading.equalTo(labelPratsItem.snp.trailing)
            make.trailing.equalTo(containerView)
        }
        drinkWaterStackView.snp.makeConstraints { make in
            make.top.equalTo(drinkPratsStackView.snp.bottom).offset(8)
            make.leading.equalTo(containerView)
            make.height.equalTo(100)
        }
        decreaseWaterItem.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        qtdWaterItem.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        addWaterItem.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        labelWaterItem.snp.makeConstraints { make in
            make.centerY.equalTo(drinkWaterStackView.snp.centerY)
            make.leading.equalTo(drinkWaterStackView.snp.trailing)
        }
        valueWaterItem.snp.makeConstraints { make in
            make.centerY.equalTo(drinkWaterStackView.snp.centerY)
            make.leading.equalTo(labelWaterItem.snp.trailing)
            make.trailing.equalTo(containerView)
        }
        separatorDrinkView.snp.makeConstraints { make in
            make.top.equalTo(valueWaterItem.snp.bottom).offset(8)
            make.height.equalTo(2)
            make.leading.trailing.equalTo(containerView)
        }
        talherItem.snp.makeConstraints { make in
            make.top.equalTo(separatorDrinkView.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView)
        }
        hashiRadioButton.snp.makeConstraints { make in
            make.top.equalTo(talherItem.snp.bottom)
            make.height.width.equalTo(30)
        }
        hashiLabel.snp.makeConstraints { make in
            make.centerY.equalTo(hashiRadioButton.snp.centerY)
            make.leading.equalTo(hashiRadioButton.snp.trailing)
        }
        forkRadioButton.snp.makeConstraints { make in
            make.leading.equalTo(containerView)
            make.top.equalTo(hashiRadioButton.snp.bottom)
            make.height.width.equalTo(30)
        }
        forkLabel.snp.makeConstraints { make in
            make.centerY.equalTo(forkRadioButton.snp.centerY)
            make.leading.equalTo(forkRadioButton.snp.trailing)
        }
        valueForkLabel.snp.makeConstraints { make in
            make.centerY.equalTo(forkRadioButton.snp.centerY)
            make.leading.equalTo(forkRadioButton.snp.trailing)
            make.trailing.equalTo(containerView)
        }
        separatorTalherView.snp.makeConstraints { make in
            make.top.equalTo(valueForkLabel.snp.bottom).offset(8)
            make.height.equalTo(2)
            make.leading.trailing.equalTo(containerView)
        }
        moreItem.snp.makeConstraints { make in
            make.top.equalTo(separatorTalherView.snp.bottom)
            make.leading.trailing.equalTo(containerView)
        }
        cookieRadioButton.snp.makeConstraints { make in
            make.leading.equalTo(containerView)
            make.top.equalTo(moreItem.snp.bottom)
            make.height.width.equalTo(30)
        }
        cookieLabel.snp.makeConstraints { make in
            make.centerY.equalTo(cookieRadioButton.snp.centerY)
            make.leading.equalTo(cookieRadioButton.snp.trailing)
        }
        valueCookieLabel.snp.makeConstraints { make in
            make.centerY.equalTo(cookieRadioButton.snp.centerY)
            make.leading.equalTo(cookieRadioButton.snp.trailing)
            make.trailing.equalTo(containerView)
        }
        rollRadioButton.snp.makeConstraints { make in
            make.leading.equalTo(containerView)
            make.top.equalTo(valueCookieLabel.snp.bottom)
            make.height.width.equalTo(30)
        }
        rollLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rollRadioButton.snp.centerY)
            make.leading.equalTo(rollRadioButton.snp.trailing)
        }
        valueRollLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rollRadioButton.snp.centerY)
            make.leading.equalTo(rollRadioButton.snp.trailing)
            make.trailing.equalTo(containerView)
        }
        separatorMoreView.snp.makeConstraints { make in
            make.top.equalTo(valueRollLabel.snp.bottom).offset(8)
            make.height.equalTo(2)
            make.leading.trailing.equalTo(containerView)
        }
        containerTextView.snp.makeConstraints { make in
            make.top.equalTo(separatorMoreView.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView)
        }
        inputTextView.snp.makeConstraints { make in
            make.edges.equalTo(containerTextView).inset(26)
        }
        footerView.snp.makeConstraints { make in
            make.top.equalTo(containerTextView.snp.bottom)
            make.leading.trailing.equalTo(containerView)
            make.height.equalTo(100)
        }
        footerLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(footerView)
        }
        footerButton.snp.makeConstraints { make in
            make.top.equalTo(footerLabel.snp.bottom)
            make.leading.trailing.bottom.equalTo(containerView).inset(26)
            make.height.equalTo(60)
            
        }
    }
    
    func configViews() {
        
        let htmlTitle = """
                   <span style="font-family: Nunito-Bold; font-size: 16pt;">Ceviche de salmão</span><br>
                   <span style="font-family: Nunito-Bold; font-size: 12pt;">a patir de</span>
                   <span style="font-family: Nunito-Bold; font-size: 12pt;">R$ 19,90</span><br>
                   <span style="font-family: Nunito-Bold; font-size: 12pt;">salmão temperado com limão, cebola e pimenta</span>
               """
        titleItem.title =  NSAttributedString(html: htmlTitle)
        
        let htmlSize = """
                   <span style="font-family: Nunito-Bold; font-size: 16pt;">qual o tamanho?</span><br>
                   <span style="font-family: Nunito-Bold; font-size: 12pt;">escolha 1</span>
               """
        sizeItem.title =  NSAttributedString(html: htmlSize)
        
        
        let htmlQuantify = """
                   <span style="font-family: Nunito-Bold; font-size: 16pt;">quantos?</span><br>
                   <span style="font-family: Nunito-Bold; font-size: 12pt;">total R$ 29,90</span>
               """
        quantifyItem.title =  NSAttributedString(html: htmlQuantify)
        
        let htmlDrink = """
                   <span style="font-family: Nunito-Bold; font-size: 16pt;">vai querer bebida?</span><br>
                   <span style="font-family: Nunito-Bold; font-size: 12pt;">escolha quantas quiser</span>
               """
        drinkItem.title =  NSAttributedString(html: htmlDrink)
        
        let htmlFork = """
                   <span style="font-family: Nunito-Bold; font-size: 16pt;">precida de talher? </span><br>
                   <span style="font-family: Nunito-Bold; font-size: 12pt;">escolha até 1</span>
               """
        talherItem.title =  NSAttributedString(html: htmlFork)
        
        let htmlMore = """
                   <span style="font-family: Nunito-Bold; font-size: 16pt;">mais alguma coisa? </span><br>
                   <span style="font-family: Nunito-Bold; font-size: 12pt;">escolha até 2</span>
               """
        moreItem.title =  NSAttributedString(html: htmlMore)
     
    }
}
