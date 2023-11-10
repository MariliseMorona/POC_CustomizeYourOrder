//
//  CodableView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 10/11/23.
//

import UIKit

protocol CodableView {
    func configViews()
    func buildViews()
    func configConstraints()
}

extension CodableView {
    func setupViews() {
        configViews()
        buildViews()
        configConstraints()
    }

    func configViews() {}
}


class UICodableView: UIView, CodableView {
    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViews() {
        fatalError("configConstraints has not been implemented")
    }

    func configConstraints() {
        fatalError("configConstraints has not been implemented")
    }

    func configViews() { }
}
