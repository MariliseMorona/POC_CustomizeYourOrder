//
//  TitleSectionView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit
import SnapKit

class TitleSectionView: UIView {
    
    var title: NSAttributedString? {
        didSet {
            textLabel.attributedText = title
        }
    }
    
    lazy var textLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.nunitoBold12
        label.numberOfLines = 0
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

extension TitleSectionView: CodableView {
    func buildViews() {
        addSubview(textLabel)
    }
    
    func configConstraints() {
        textLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
