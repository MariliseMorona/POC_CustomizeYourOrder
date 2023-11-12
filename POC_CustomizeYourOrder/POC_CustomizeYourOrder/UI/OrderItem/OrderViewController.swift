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
    
    private let minLimitItem = 0
    private let limitItemForTrash = 1
    
    private var privateCountItem: Int = 0
    var countItem: Int = 0 {
        didSet {
            privateCountItem = countItem
        }
    }
    
    private var privateCountFirstDrink: Int = 0
    var countFirstDrink: Int = 0 {
        didSet {
            privateCountFirstDrink = countFirstDrink
        }
    }
    
    private var privateCountSecondDrink: Int = 0
    var countSecondDrink: Int = 0 {
        didSet {
            privateCountSecondDrink = countSecondDrink
        }
    }
    
    private var privateCountThirdDrink: Int = 0
    var countThirdDrink: Int = 0 {
        didSet {
            privateCountThirdDrink = countThirdDrink
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
        
        fetchedSizeView()
        fetchedFooterView()
        fetchedQuantifyView()
        fetchedDrinkView()
        fetchedCutleryView()
        
    }
}

extension OrderViewController {
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
    
    @objc private func tappedAddItem(){
        if privateCountItem == minLimitItem {
            countItem += 1
            orderView.quantifyItem.count = privateCountItem
            orderView.quantifyItem.presentButton = false
        } else if privateCountItem >= limitItemForTrash {
            countItem += 1
            orderView.quantifyItem.count = privateCountItem
            orderView.quantifyItem.quantifyView.decreaseItem.setImage(UIImage(named: "decreaseBtn"), for: .normal)
        }
    }
    
    @objc private func tappedReduceItem(){
        if privateCountItem == limitItemForTrash {
            countItem -= 1
            orderView.quantifyItem.count = privateCountItem
            orderView.quantifyItem.presentButton = true
        } else if privateCountItem == limitItemForTrash+1 {
            countItem -= 1
            orderView.quantifyItem.count = privateCountItem
            orderView.quantifyItem.quantifyView.decreaseItem.setImage(UIImage(named: "iconTrash"), for: .normal)
        } else if privateCountItem > limitItemForTrash {
            countItem -= 1
            orderView.quantifyItem.count = privateCountItem
        }
    }
    
    @objc private func tappedAddDrink(sender: UIButton){
        print("printando sender.tag: \(sender.tag) add")
        switch sender.tag {
        case 0:
            if privateCountFirstDrink >= minLimitItem {
                countFirstDrink += 1
                orderView.drinkItem.quantifyFirstDrinkView.decreaseItem.setImage(UIImage(named: "decreaseBtn"), for: .normal)
                orderView.drinkItem.firstCount = privateCountFirstDrink
            }
        case 1:
            if privateCountSecondDrink >= minLimitItem {
                countSecondDrink += 1
                orderView.drinkItem.quantifySecondDrinkView.decreaseItem.setImage(UIImage(named: "decreaseBtn"), for: .normal)
                orderView.drinkItem.secondCount = privateCountSecondDrink
            }
        case 2:
            if privateCountThirdDrink >= minLimitItem {
                countThirdDrink += 1
                orderView.drinkItem.quantifyThirdDrinkView.decreaseItem.setImage(UIImage(named: "decreaseBtn"), for: .normal)
                orderView.drinkItem.thirdCount = privateCountThirdDrink
            }
        default:
            print("print deu ruim no add")
        }
        
    }
    @objc private func tappedReduceDrink(sender: UIButton){
        print("printando sender.tag: \(sender.tag) reduce")
        switch sender.tag {
        case 0:
            if privateCountFirstDrink == limitItemForTrash {
                countFirstDrink -= 1
                orderView.drinkItem.firstCount = privateCountFirstDrink
                orderView.drinkItem.quantifyFirstDrinkView.decreaseItem.setImage(UIImage(named: "inativedDecreaseBtn"), for: .normal)
            } else if privateCountFirstDrink > limitItemForTrash {
                countFirstDrink -= 1
                orderView.drinkItem.firstCount = privateCountFirstDrink
                orderView.drinkItem.quantifyFirstDrinkView.decreaseItem.setImage(UIImage(named: "decreaseBtn"), for: .normal)
            }
        case 1:
            if privateCountSecondDrink == limitItemForTrash {
                countSecondDrink -= 1
                orderView.drinkItem.secondCount = privateCountSecondDrink
                orderView.drinkItem.quantifySecondDrinkView.decreaseItem.setImage(UIImage(named: "inativedDecreaseBtn"), for: .normal)
            } else if privateCountSecondDrink > limitItemForTrash {
                countSecondDrink -= 1
                orderView.drinkItem.secondCount = privateCountSecondDrink
                orderView.drinkItem.quantifySecondDrinkView.decreaseItem.setImage(UIImage(named: "decreaseBtn"), for: .normal)
            }
        case 2:
            if privateCountThirdDrink == limitItemForTrash {
                countThirdDrink -= 1
                orderView.drinkItem.thirdCount = privateCountThirdDrink
                orderView.drinkItem.quantifyThirdDrinkView.decreaseItem.setImage(UIImage(named: "inativedDecreaseBtn"), for: .normal)
            } else if privateCountThirdDrink > limitItemForTrash {
                countThirdDrink -= 1
                orderView.drinkItem.thirdCount = privateCountThirdDrink
                orderView.drinkItem.quantifyThirdDrinkView.decreaseItem.setImage(UIImage(named: "decreaseBtn"), for: .normal)
            }
        default:
            print("print deu ruim o decrease")
        }
        
    }
    
    @objc private func tappedCutleryRadioBtn(sender: UIButton){
        print("printando sender: \(sender.tag)")
        sender.tag == orderView.cutleryItem.hashiView.addItem.tag ? (orderView.cutleryItem.hashiView.addItem.setImage(UIImage(named: "selectedRadioBtn"), for: .normal)) : (orderView.cutleryItem.hashiView.addItem.setImage(UIImage(named: "deselectedRadioBtn"), for: .normal))
        sender.tag == orderView.cutleryItem.forkView.addItem.tag ? (orderView.cutleryItem.forkView.addItem.setImage(UIImage(named: "selectedRadioBtn"), for: .normal)) : (orderView.cutleryItem.forkView.addItem.setImage(UIImage(named: "deselectedRadioBtn"), for: .normal))
    }
}

extension OrderViewController {
    fileprivate func fetchedSizeView() {
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
    }
    
    fileprivate func fetchedFooterView() {
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
    
    fileprivate func fetchedQuantifyView() {
        orderView.quantifyItem.quantifyView.defaultAddBtn.addTarget(self, action: #selector(tappedAddItem), for: .touchUpInside)
        orderView.quantifyItem.quantifyView.addItem.addTarget(self, action: #selector(tappedAddItem), for: .touchUpInside)
        orderView.quantifyItem.quantifyView.decreaseItem.addTarget(self, action: #selector(tappedReduceItem), for: .touchUpInside)
    }
    
    fileprivate func fetchedDrinkView() {
        
        orderView.drinkItem.quantifyFirstDrinkView.decreaseItem.setImage(UIImage(named: "inativedDecreaseBtn"), for: .normal)
        orderView.drinkItem.quantifySecondDrinkView.decreaseItem.setImage(UIImage(named: "inativedDecreaseBtn"), for: .normal)
        orderView.drinkItem.quantifyThirdDrinkView.decreaseItem.setImage(UIImage(named: "inativedDecreaseBtn"), for: .normal)
        
        orderView.drinkItem.quantifyFirstDrinkView.addItem.addTarget(self, action: #selector(tappedAddDrink), for: .touchUpInside)
        orderView.drinkItem.quantifySecondDrinkView.addItem.addTarget(self, action: #selector(tappedAddDrink), for: .touchUpInside)
        orderView.drinkItem.quantifyThirdDrinkView.addItem.addTarget(self, action: #selector(tappedAddDrink), for: .touchUpInside)
        
        orderView.drinkItem.quantifyFirstDrinkView.decreaseItem.addTarget(self, action: #selector(tappedReduceDrink), for: .touchUpInside)
        orderView.drinkItem.quantifySecondDrinkView.decreaseItem.addTarget(self, action: #selector(tappedReduceDrink), for: .touchUpInside)
        orderView.drinkItem.quantifyThirdDrinkView.decreaseItem.addTarget(self, action: #selector(tappedReduceDrink), for: .touchUpInside)
    }
    
    fileprivate func fetchedCutleryView() {
        orderView.cutleryItem.hashiView.addItem.addTarget(self, action: #selector(tappedCutleryRadioBtn), for: .touchUpInside)
        orderView.cutleryItem.forkView.addItem.addTarget(self, action: #selector(tappedCutleryRadioBtn), for: .touchUpInside)
    }
}
