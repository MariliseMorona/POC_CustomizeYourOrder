//
//  SectionDividerView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class SectionDividerView: UIView {
    
    lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.grayToBackground
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SectionDividerView: CodableView {
    func buildViews() {
        addSubview(dividerView)
    }
    
    func configConstraints() {
        dividerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(4)
        }
    }
}
