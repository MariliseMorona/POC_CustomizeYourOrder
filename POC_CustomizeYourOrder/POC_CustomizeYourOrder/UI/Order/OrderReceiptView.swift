//
//  OrderReceiptView.swift.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 13/11/23.
//

import UIKit

struct OrderReceiptModel {
    var address: String?
    var observation: String?
    var itens: [OrderReceiptItensModel]?
    
}
struct OrderReceiptItensModel {
    var item: String?
    var quantity: String?
    var priceUnit: String?
    var costTotalItem: String?
}

class OrderReceiptView: UIView {
    
    var data: OrderReceiptModel? {
        didSet {
            if let model = data {
                updateItensOrder(data: model.itens ?? [OrderReceiptItensModel]())
                updateOrder(data: data ?? OrderReceiptModel())
            }
        }
    }
    
    var descOrder: NSAttributedString? {
        didSet {
            descriptionOrder.attributedText = descOrder
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        return view
    }()
    
    lazy var imageItem: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage.aiqBranding
        return img
    }()
    
    lazy var title: UILabel = {
       let label = UILabel()
        label.text = "oi fominha, confira seu pedido antes de confirmar."
        label.font = UIFont.nunitoBold16
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.grafit
        return label
    }()
    
    lazy var addressOrder: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    lazy var separatorAddressView = SectionDividerView()
    lazy var descriptionOrder: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    lazy var separatorDescriptionView = SectionDividerView()
    lazy var observationOrder: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    lazy var confirmOrder: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.nunitoRegular12
        label.text = "se tiver tu ok com seu pedido, confirma ai."
        return label
    }()
    
    lazy var footerButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.purple
        btn.layer.cornerRadius = 8
        btn.setTitle(Strings.confirmOrder.text, for: .normal)
        btn.tintColor = .white
        btn.titleLabel?.font = UIFont.nunitoBold16
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
extension OrderReceiptView: CodableView {
    func buildViews() {
        addSubview(containerView)
        containerView.addSubview(headerView)
        headerView.addSubview(imageItem)
        containerView.addSubview(title)
        containerView.addSubview(addressOrder)
        containerView.addSubview(separatorAddressView)
        containerView.addSubview(descriptionOrder)
        containerView.addSubview(separatorDescriptionView)
        containerView.addSubview(observationOrder)
        containerView.addSubview(confirmOrder)
        containerView.addSubview(footerButton)
    }
    
    func configConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(containerView)
            make.height.equalTo(65)
        }
        imageItem.snp.makeConstraints { make in
            make.center.equalTo(headerView)
            make.height.width.equalTo(30)
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(26)
            make.leading.trailing.equalTo(containerView).inset(16)
        }
        addressOrder.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(26)
            make.leading.trailing.equalTo(containerView).inset(16)
        }
        separatorAddressView.snp.makeConstraints { make in
            make.top.equalTo(addressOrder.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView)
        }
        descriptionOrder.snp.makeConstraints { make in
            make.top.equalTo(separatorAddressView.snp.bottom).offset(26)
            make.leading.trailing.equalTo(containerView).inset(16)
            make.centerY.equalToSuperview()
        }
        separatorDescriptionView.snp.makeConstraints { make in
            make.top.equalTo(descriptionOrder.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView)
        }
        observationOrder.snp.makeConstraints { make in
            make.top.equalTo(separatorDescriptionView.snp.bottom).offset(26)
            make.leading.trailing.equalTo(containerView).inset(16)
        }
        confirmOrder.snp.makeConstraints { make in
            make.top.equalTo(observationOrder.snp.bottom).offset(26)
            make.leading.trailing.equalTo(containerView).inset(16)
        }
        footerButton.snp.makeConstraints { make in
            make.top.equalTo(confirmOrder.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
    
    }
}

extension OrderReceiptView {
    func updateItensOrder(data: [OrderReceiptItensModel]) {
        var list = ""
        for product in data {
            if let prod = product.item, let quant = product.quantity, let price = product.priceUnit, let cost = product.costTotalItem  {
                            list += """
                            <left style="font-family: Nunito-Bold; font-size: 12pt; color: #393A3C">
                                \(prod)
                            </left>
                            <right style="font-family: Nunito-SemiBold; font-size: 9pt; color: #6D6F73">
                                \(quant)x
                            </right>
                           <right style="font-family: Nunito-SemiBold; font-size: 9pt; color: #6D6F73">
                               R$ \(price.replacingOccurrences(of: ".", with: ","))
                           </right>
                            <right style="font-family: Nunito-Bold; font-size: 10pt; color: #393A3C">
                               ........ R$ \(cost.replacingOccurrences(of: ".", with: ","))
                            </right><br>
                       """
            }
            
            descOrder = NSAttributedString(html: list)
        }
    }
    
    func updateOrder(data: OrderReceiptModel) {
        if let address = data.address {
            var text = """
                <left style="font-family: Nunito-SemiBold; font-size: 9pt; color: #6D6F73">
                    endereço de entrega:
                </left>
                <right style="font-family: Nunito-Bold; font-size: 12pt; color: #393A3C">
                    \(address.replacingOccurrences(of: ">", with: ""))
                </right>
           """
            addressOrder.attributedText = NSAttributedString(html: text)
        }
        
        if let obs = data.observation, obs != Strings.empty.text {
            var text = """
                <left style="font-family: Nunito-SemiBold; font-size: 9pt; color: #6D6F73">
                    observações do pedido:
                </left>
                <right style="font-family: Nunito-Bold; font-size: 10pt; color: #393A3C">
                    \(obs)
                </right>
           """
            observationOrder.attributedText = NSAttributedString(html: text)
        } else {
            observationOrder.isHidden = true
        }
        
    }
}
