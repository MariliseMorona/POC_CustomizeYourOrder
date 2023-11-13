//
//  ObservationSectionView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class ObservationSectionView: UIView {
    
    var title: NSAttributedString? {
        didSet {
            
//            for subview in subviews {
//                subview.removeFromSuperview()
//            }
            containerTextView.attributedText = title
//            setupViews()
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var containerTextView: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()
    
    lazy var inputTextView: UITextView = {
        let text = UITextView()
        text.backgroundColor = .clear
        text.textColor = .clear
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ObservationSectionView: CodableView {
    func buildViews() {
        addSubview(containerView)
        containerView.addSubview(containerTextView)
        containerView.addSubview(inputTextView)
    }
    
    func configConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        containerTextView.snp.makeConstraints { make in
            make.top.bottom.equalTo(containerView).inset(10)
            make.leading.trailing.equalTo(containerView).inset(12)
        }
        inputTextView.snp.makeConstraints { make in
            make.top.bottom.equalTo(containerView).inset(10)
            make.leading.trailing.equalTo(containerView).inset(12)
        }
    }
}
