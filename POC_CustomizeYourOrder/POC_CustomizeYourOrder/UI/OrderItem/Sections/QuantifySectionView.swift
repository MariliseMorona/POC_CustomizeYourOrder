//
//  QuantifySectionView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class QuantifySectionView: UIView {
    
    var data: QuantifySectionModel? {
        didSet {
            if let data = data {
                data.value == Strings.empty.text ? fetchedQuantityEmpty(data: data):
                fetchedQuantify(data: data)
            }
        }
    }
    
    private var privatePresentBtn: Bool = true
    var presentButton: Bool {
        get { return privatePresentBtn }
        set {
            privatePresentBtn = newValue
            quantifyView.stackView.subviews.forEach { $0.removeFromSuperview() }
            setupViews()
        }
    }

    private var privateCount: Int = -1
    var count: Int = 0 {
        didSet {
            privateCount = count
            quantifyView.qtdItem.text = String(privateCount)
        }
    }
    
    lazy var titleView = TitleSectionView()
    lazy var quantifyView: QuantifyView = {
        let stack = QuantifyView()
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
        if privatePresentBtn == true {
            quantifyView.stackView.addArrangedSubview(quantifyView.defaultAddBtn)
        } else {
            quantifyView.stackView.addArrangedSubview(quantifyView.decreaseItem)
            quantifyView.stackView.addArrangedSubview(quantifyView.qtdItem)
            quantifyView.stackView.addArrangedSubview(quantifyView.addItem)
        }
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
}

extension QuantifySectionView {
    func fetchedQuantify(data: QuantifySectionModel) {
        let htmlQuantify = """
                    <span style="font-family: Nunito-Bold; font-size: 16pt; color: #393A3C">
                        \(data.title)
                    </span><br>
                    <span style="font-family: Nunito-SemiBold; font-size: 14pt; color: #6D6F73">
                        \(data.subtitle)
                    </span>
                    <span style="font-family: Nunito-Bold; font-size: 14pt; color: #393A3C">
                       \(data.value)
                    </span>
               """
        titleView.textLabel.attributedText = NSAttributedString(html: htmlQuantify)
    }
    func fetchedQuantityEmpty(data: QuantifySectionModel) {
        let htmlQuantify = """
                    <span style="font-family: Nunito-Bold; font-size: 16pt; color: #393A3C">
                        \(Strings.howMuch.text)
                    </span><br>
               """
        titleView.textLabel.attributedText = NSAttributedString(html: htmlQuantify)
    }
}

