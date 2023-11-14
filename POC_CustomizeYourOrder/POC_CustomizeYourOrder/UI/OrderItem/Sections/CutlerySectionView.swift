//
//  CutlerySectionView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class CutlerySectionView: UIView {
    
    var data: CutlerySectionModel? {
        didSet {
            if let data = data {
                fetchedCutleryView(data: data)
            }
        }
    }
    
    lazy var titleView = TitleSectionView()
    lazy var hashiView: QuantifyView = {
        let stack = QuantifyView()
        stack.stackView.addArrangedSubview(stack.addItem)
        stack.addItem.setImage(UIImage.deselectedRadioBtn, for: .normal)
        return stack
    }()
    
    lazy var hashiLabel: UILabel = {
       let label = UILabel()
        label.text = Strings.hashi.text
        label.numberOfLines = 1
        label.font = UIFont.nunitoRegular14
        label.textColor = UIColor.gray
        return label
    }()
    
    lazy var forkView: QuantifyView = {
        let stack = QuantifyView()
        stack.stackView.addArrangedSubview(stack.addItem)
        stack.addItem.setImage(UIImage.deselectedRadioBtn, for: .normal)
        return stack
    }()

    lazy var forkLabel: UILabel = {
       let label = UILabel()
        label.text = Strings.cutlery.text
        label.numberOfLines = 1
        label.font = UIFont.nunitoRegular14
        label.textColor = UIColor.gray
        return label
    }()
    
    lazy var valueForkLabel: UILabel = {
       let label = UILabel()
        label.text = Strings.value1.text
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
}

extension CutlerySectionView {
    func fetchedCutleryView(data: CutlerySectionModel) {
        let htmlFork = """
                   <span style="font-family: Nunito-Bold; font-size: 16pt; color: #393A3C">
                        \(data.title)
                   </span><br>
                   <span style="font-family: Nunito-Bold; font-size: 12pt; color: #6D6F73">
                        \(data.subtitle)
                   </span>
               """
        titleView.textLabel.attributedText = NSAttributedString(html: htmlFork)
    }
}
