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
        view.backgroundColor = UIColor.grayToBackground
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
        img.image = UIImage.food
        return img
    }()
    
    lazy var titleItem = TitleSectionView()
    lazy var quantifyItem = QuantifySectionView()
    lazy var separatorView = SectionDividerView()
    lazy var sizeItem = SizeSectionView()
    lazy var separatorSizeView = SectionDividerView()
    lazy var drinkItem = DrinkSectionView()
    lazy var separatorDrinkView = SectionDividerView()
    lazy var cutleryItem = CutlerySectionView()
    lazy var separatorTalherView = SectionDividerView()
    lazy var moreItem = MoreSectionView()
    lazy var separatorMoreView = SectionDividerView()
    lazy var observation = ObservationSectionView()
    lazy var footerView = FooterSectionView()
    
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
        containerView.addSubview(separatorView)
        containerView.addSubview(sizeItem)
        containerView.addSubview(separatorSizeView)
        containerView.addSubview(drinkItem)
        containerView.addSubview(separatorDrinkView)
        containerView.addSubview(cutleryItem)
        containerView.addSubview(separatorTalherView)
        containerView.addSubview(moreItem)
        containerView.addSubview(separatorMoreView)
        containerView.addSubview(observation)
        containerView.addSubview(footerView)
     
    }
    
    func configConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.snp.makeConstraints { make in
            make.top.bottom.width.equalTo(scrollView)
        }
        imageItem.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.leading.trailing.equalTo(containerView)
            make.height.equalTo(195)
        }
        titleItem.snp.makeConstraints { make in
            make.top.equalTo(imageItem.snp.bottom).offset(16)
            make.leading.trailing.equalTo(containerView).inset(16)
        }
        quantifyItem.snp.makeConstraints { make in
            make.top.equalTo(titleItem.snp.bottom).offset(16)
            make.leading.trailing.equalTo(containerView).inset(16)
        }
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(quantifyItem.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView)
        }
        sizeItem.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(containerView).inset(16)
        }
        separatorSizeView.snp.makeConstraints { make in
            make.top.equalTo(sizeItem.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView)
        }
        drinkItem.snp.makeConstraints { make in
            make.top.equalTo(separatorSizeView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(containerView).inset(16)
        }
        separatorDrinkView.snp.makeConstraints { make in
            make.top.equalTo(drinkItem.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView)
        }
        cutleryItem.snp.makeConstraints { make in
            make.top.equalTo(separatorDrinkView.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView).inset(16)
        }
        separatorTalherView.snp.makeConstraints { make in
            make.top.equalTo(cutleryItem.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView)
        }
        moreItem.snp.makeConstraints { make in
            make.top.equalTo(separatorTalherView.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView).inset(16)
        }
        separatorMoreView.snp.makeConstraints { make in
            make.top.equalTo(moreItem.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView)
        }
        observation.snp.makeConstraints { make in
            make.top.equalTo(separatorMoreView.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView)
        }
        footerView.snp.makeConstraints { make in
            make.top.equalTo(observation.snp.bottom)
            make.leading.trailing.bottom.equalTo(containerView)
        }
    }
}
