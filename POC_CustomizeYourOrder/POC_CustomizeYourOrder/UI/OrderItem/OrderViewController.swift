//
//  OrderViewController.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 10/11/23.
//

import UIKit

class OrderViewController: UIViewController {

    private var orderView = OrderView()
    private var navigationView = NavigationView()
    
    private var selectedRadioBtn: Bool = false
    var radioBtn: Bool = false {
        didSet {
            selectedRadioBtn = radioBtn
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = orderView
        view.backgroundColor = UIColor.grayToBackground

        self.navigationItem.titleView = navigationView
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "aiqBranding"),
            style: .plain,
            target: self,
            action: #selector(tappedBranding))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "iconUser"),
            style: .plain,
            target: self,
            action: #selector(tappedUser))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        orderView.sizeItem.middleRadioButton.addTarget(self, action: #selector(tappedRadioBtn), for: .touchUpInside)
        orderView.sizeItem.largeRadioButton.addTarget(self, action: #selector(tappedRadioBtn), for: .touchUpInside)
        
        let htmlSize = """
                    <span style="font-family: Nunito-Bold; font-size: 16pt;">
                        qual o tamanho?
                    </span><br>
                    <span style="font-family: Nunito-Bold; font-size: 12pt; color: #6D6F73">
                        escolha 1
                    </span>
               """
        orderView.sizeItem.title =  NSAttributedString(html: htmlSize)
        
        let htmlValueMiddle = """
                    <span style="font-family: Nunito-Bold; font-size: 12pt;">
                                de R$ 22,90 por
                    </span><br>
                    <span style="font-family: Nunito-Bold; font-size: 14pt; color: #O2A117";>
                                R$ 19,90
                    </span>
               """
        orderView.sizeItem.middleValue = NSAttributedString(html: htmlValueMiddle)
        
        let htmlAiq = """
                    <p style="text-align: center;">
                        <span style="font-family: Nunito-Bold; font-size: 12pt; color: #580F78">
                            feito com &hearts; em Maringá-PR
                        </span>
                    </p>
                """
        print("printando htmlAiq:\(htmlAiq)")
        orderView.footerView.footerLabel.attributedText =  NSAttributedString(html: htmlAiq)
        
        let htmlCopy = """
                   <p style="font-family: Nunito-Bold; font-size: 12pt; text-align: center; color: #580F78;">
                            aiqfome.com © 2007-2023 aiqfome LTDA.<br>
                            CNPJ: 09.186.786/0001-58<br></p>
               """
        orderView.footerView.footerCopyLabel.attributedText =  NSAttributedString(html: htmlCopy)
    }
    
    @objc private func tappedBranding(){
        print("Você será redirecinado a Home")
    }
    
    @objc private func tappedUser(){
        print("Você será redirecinado ao seu Profile")
    }
    
    @objc func tappedRadioBtn(sender: UIButton) {
        print("printando sender: \(sender.tag)")
        sender.tag == orderView.sizeItem.middleRadioButton.tag ? (orderView.sizeItem.middleRadioButton.setImage(UIImage(named: "selectedRadioBtn"), for: .normal)) : (orderView.sizeItem.middleRadioButton.setImage(UIImage(named: "deselectedRadioBtn"), for: .normal))
        sender.tag == orderView.sizeItem.largeRadioButton.tag ? (orderView.sizeItem.largeRadioButton.setImage(UIImage(named: "selectedRadioBtn"), for: .normal)) : (orderView.sizeItem.largeRadioButton.setImage(UIImage(named: "deselectedRadioBtn"), for: .normal))
        radioBtn = true
        print("printando selectedRadioBtn: \(selectedRadioBtn)")
        orderView.footerView.presentButton = radioBtn
    }
}
