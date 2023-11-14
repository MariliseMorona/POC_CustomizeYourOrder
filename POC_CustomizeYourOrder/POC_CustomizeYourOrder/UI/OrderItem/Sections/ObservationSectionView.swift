//
//  ObservationSectionView.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class ObservationSectionView: UIView {
    
    weak var delegate: ObservationSectionDelegate?
    
    var data: ObservationSectionModel? {
        didSet {
            if let data = data {
                data.placeholderP01.isEmpty ? fetchedObservation(data: data) : fetchedObservationDefault(data: data)
            }
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
        text.delegate = self
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

extension ObservationSectionView {
    func fetchedObservation(data: ObservationSectionModel) {
        let htmlObservation = """
                   <span style="font-family: Nunito-SemiBold; font-size: 14pt; color: #6D6F73">
                        \(data.message)
                   </span>
               """
        containerTextView.attributedText = NSAttributedString(html: htmlObservation)
    }
    
    func fetchedObservationDefault(data: ObservationSectionModel) {
        let htmlObservation = """
                   <span style="font-family: Nunito-SemiBold; font-size: 14pt; color: #6D6F73">
                        \(data.placeholderP01) &bull; \(data.placeholderP02)
                   <br>
                        \(data.placeholderP03)
                   </span>
               """
        containerTextView.attributedText = NSAttributedString(html: htmlObservation)
    }
}

extension ObservationSectionView: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let delegate = delegate else { return }
        delegate.textViewDidEndEditing(textView)
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let delegate = delegate else { return false }
        return delegate.textView(textView, shouldChangeTextIn: range, replacementText: text)
    }
}
