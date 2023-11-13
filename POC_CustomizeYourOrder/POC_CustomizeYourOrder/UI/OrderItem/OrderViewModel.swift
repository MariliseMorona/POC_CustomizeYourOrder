//
//  OrderViewModel.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class OrderViewModel: OrderViewModelProtocol {
    
    weak var controller: OrderViewControllerProtocol?
    var model: OrderModel?
    
    init(model: OrderModel?, controller: OrderViewControllerProtocol) {
        self.model = model
        self.controller = controller
    }
    
    private let minLimitItem = 0
    private let limitItemForTrash = 1
    
    private var privateAddress: Address = Address()
    var address: String? = Strings.defaultAddress.text {
        didSet {
            privateAddress.newAddress = address ?? Strings.defaultAddress.text
            guard let controller = controller else {
                return 
            }
            calculateTotalValue()
            controller.updateAddress(address: privateAddress.newAddress)
        }
    }
    
    private var selectedRadioBtn: Bool = false
    var radioBtn: Bool? {
        didSet {
            selectedRadioBtn = radioBtn ?? false
            guard let controller = controller else {
                return
            }
            if privateCountItem != 0 {
                calculateTotalValue()
            }
            
            validateIfTheButtonShouldAppear()
        }
    }
    
    private var privateCountItem: Int = 0
    var countItem: Int? = 0 {
        didSet {
            privateCountItem = countItem ?? 0
            guard let controller = controller else {
                return
            }
            if selectedSize != .none {
                calculateTotalValue()
            }
            controller.updateCountItem()
            
        }
    }
    
    private var privateTotalCost: String = Strings.empty.text
    var totalCost: String? = Strings.empty.text {
        didSet {
            privateTotalCost = totalCost ?? Strings.empty.text
        }
    }
    
    private var presentDfAddBtn: Bool = false
    var dfAddBtn: Bool? {
        didSet {
            presentDfAddBtn = dfAddBtn ?? false
            guard let controller = controller else {
                return
            }
            controller.changeForPresentDfAddButton()
        }
    }
    
    private var privateCountSoda: Int = 0
    var countSoda: Int? = 0 {
        didSet {
            privateCountSoda = countSoda ?? 0
            guard let controller = controller else {
                return
            }
            calculateTotalValue()
            controller.updateCountItem()
        }
    }
    
    private var privateCountJuice: Int = 0
    var countJuice: Int? = 0 {
        didSet {
            privateCountJuice = countJuice ?? 0
            guard let controller = controller else {
                return
            }
            calculateTotalValue()
            controller.updateCountItem()
        }
    }
    
    private var privateCountWater: Int = 0
    var countWater: Int? = 0 {
        didSet {
            privateCountWater = countWater ?? 0
            guard let controller = controller else {
                return
            }
            calculateTotalValue()
            controller.updateCountItem()
        }
    }
    
    private var privateSelectedSection: [TypeProduct: Int] = [:]
    var selectedSection: [TypeProduct: Int]? = [:] {
        didSet {
            privateSelectedSection = selectedSection ?? [:]
        }
    }
    
    private var privateSelectedSize: SizeTag? = .none
    var selectedSize: SizeTag? = .none {
        didSet {
            privateSelectedSize = selectedSize ?? .none
            calculateTotalValue()
        }
    }
    
    private var privateSelectedCutlery: CutleryTag? = .hashi
    var selectedCutlery: CutleryTag? = .hashi {
        didSet {
            privateSelectedCutlery = selectedCutlery ?? .hashi
            calculateTotalValue()
        }
    }
    
    private var privateValueCutlery: Double = 0
    var valueCutlery: Double? = 0 {
        didSet {
            privateValueCutlery = valueCutlery ?? 0
        }
    }
    
    private var selectedCookieBtn: Bool = false
    var cookieBtn: Bool? = false {
        didSet {
            selectedCookieBtn = cookieBtn ?? false
            print("printando selectedCookieBtn: \(selectedCookieBtn)")
            calculateTotalValue()
        }
    }
    
    private var selectedRollBtn: Bool = false
    var rollBtn: Bool? = false {
        didSet {
            selectedRollBtn = rollBtn ?? false
            print("printando selectedRollBtn: \(selectedRollBtn)")
            calculateTotalValue()
        }
    }
    
    private var privateMessageObs: String = Strings.empty.text
    var messageObs: String? = Strings.empty.text {
        didSet {
            privateMessageObs = messageObs ?? Strings.empty.text
            guard let controller = controller else {
                return
            }
            calculateTotalValue()
            controller.updateObservation()
        }
    }
    
    private var privateTotalCostOrder: Double = 0
    var totalCostOrder: Double? = 0 {
        didSet {
            privateTotalCostOrder = totalCostOrder ?? 0
        }
    }
    
    //MARK: Methods
    func validateIfTheButtonShouldAppear() {
        guard let controller = controller else {
            return
        }
        if privateCountItem > 0 && radioBtn == true {
            controller.changeForPresentButton()
        }
    }
    
    func alertChangeAddress() {
        guard let controller = controller else {
            return
        }
        controller.changeAddress { result in
            switch result {
            case .success(let value):
                self.address = value
            case .failure(_):
                ErrorModel.notFound
            }
        }
    }
    
    func selectedSizeItem(tag: Int){
        selectedSection = [.plateSize: tag]
        tag == SizeTag.middle.value ? (selectedSize = .middle) : (selectedSize = .large)
        radioBtn = true
        validateIfTheButtonShouldAppear()
    }
    
    func addItem(tag: Int){
        selectedSection = [.item: tag]
        if privateCountItem == minLimitItem {
            countItem! += 1
            presentDfAddBtn = false
            guard let controller = controller else {
                return
            }
            controller.changeForTrashBtn()
        } else if privateCountItem >= limitItemForTrash {
            countItem! += 1
            guard let controller = controller else {
                return
            }
            controller.changeForDecreaseItemBtm(tag: tag)
        }
    }
    func reduceItem(tag: Int) {
        selectedSection = [.item: tag]
        if privateCountItem == limitItemForTrash {
            countItem! -= 1
            dfAddBtn = true
        } else if privateCountItem == limitItemForTrash+1 {
            countItem! -= 1
            guard let controller = controller else {
                return
            }
            controller.changeForTrashBtn()
        } else if privateCountItem > limitItemForTrash {
            countItem! -= 1
        }
    }
    
    func addTypeDrink(tag: Int){
        selectedSection = [.drinks: tag]
        guard let controller = controller else {
            return
        }
        switch tag {
        case 1:
            if privateCountSoda >= minLimitItem {
                countSoda! += 1
                controller.changeForDecreaseBtn()
            }
        case 2:
            if privateCountJuice >= minLimitItem {
                countJuice! += 1
                controller.changeForDecreaseBtn()
            }
        case 3:
            if privateCountWater >= minLimitItem {
                countWater! += 1
                controller.changeForDecreaseBtn()
            }
        default:
            ErrorModel.notFound
        }
    }
    
    func reduceTypeDrink(tag: Int) {
        selectedSection = [.drinks: tag]
        guard let controller = controller else {
            return
        }
        switch tag {
        case 1:
            if privateCountSoda == limitItemForTrash {
                countSoda! -= 1
                controller.changeForInativedBtn()
            } else if privateCountSoda > limitItemForTrash {
                countSoda! -= 1
                controller.changeForDecreaseBtn()
            }
        case 2:
            if privateCountJuice == limitItemForTrash {
                countJuice! -= 1
                controller.changeForInativedBtn()
            } else if privateCountJuice > limitItemForTrash {
                countJuice! -= 1
                controller.changeForDecreaseBtn()
            }
        case 3:
            if privateCountWater == limitItemForTrash {
                countWater! -= 1
                controller.changeForInativedBtn()
            } else if privateCountWater > limitItemForTrash {
                countWater! -= 1
                controller.changeForDecreaseBtn()
            }
        default:
            ErrorModel.notFound
        }
    }
    
    func addCutlery(tag: Int) {
        selectedSection = [.cutlery: tag]
        tag == CutleryTag.hashi.value ? (valueCutlery = CutleryTag.hashi.cost) : (valueCutlery = CutleryTag.fork.cost)
        tag == CutleryTag.hashi.value ? (selectedCutlery = .hashi) : (selectedCutlery = .fork)
    }
    
    func addMoreItens(tag: Int) {
        selectedSection = [.moreItens: tag]
        print("printando tag: \(tag)")
        guard let controller = controller else {
            return
        }
        tag == MoreItensTag.cookie.value ? (cookieBtn = !selectedCookieBtn) : (rollBtn = !selectedRollBtn)
        print("printando tag == MoreItensTag.cookie.value: \(tag == MoreItensTag.cookie.value)")
        selectedRollBtn == true ? controller.changeForChecked() : controller.changeForUnchecked()
        print("printando selectedRollBtn: \(selectedRollBtn)")
        selectedCookieBtn == true ? controller.changeForChecked() : controller.changeForUnchecked()
        print("printando selectedCookieBtn: \(selectedCookieBtn)")
    }
    
    func getObservation(message: String) {
        messageObs = message
    }
    
    private func calculateTotalValue() {
        var costPlate: Double = 0
        if let size = selectedSize {
            costPlate = Double(privateCountItem) * size.cost
        }
        
        var costSoda: Double = 0
        if privateCountSoda > 0  {
            costSoda = Double(privateCountSoda) * DrinkTag.soda.cost
        }
        var costJuice: Double = 0
        if privateCountJuice > 0  {
            costJuice = Double(privateCountJuice) * DrinkTag.juice.cost
        }
        var costWater: Double = 0
        if privateCountWater > 0  {
            costWater = Double(privateCountWater) * DrinkTag.water.cost
        }
        var costCutlery: Double = 0
        if privateSelectedCutlery == .fork {
            costCutlery = CutleryTag.fork.cost
        }
        var costMoreItens: Double = 0
        if selectedRollBtn {
            costMoreItens += MoreItensTag.rolls.cost
        }
        if selectedCookieBtn {
            costMoreItens += MoreItensTag.cookie.cost
        }
        totalCostOrder = costPlate + costSoda + costJuice + costWater + costCutlery + costMoreItens
        
        var newOrder = OrderModel(
            address: address,
            observation: messageObs,
            countItem: countItem,
            sizeItem: selectedSize,
            priceItem: selectedSize?.cost,
            costItem: costPlate,
            countSoda: countSoda,
            costSoda: costSoda,
            countJuice: countJuice,
            costJuice: costJuice,
            countWater: countWater,
            costWater: costWater,
            costCutlery: costCutlery,
            costCookie: selectedCookieBtn ? MoreItensTag.cookie.cost : 0,
            costRoll: selectedRollBtn ? MoreItensTag.rolls.cost : 0,
            costTotal: totalCostOrder)
        model = newOrder
        guard let controller = controller else {
            return
        }
        if let cost = model?.costTotal, cost != 0 {
            let textCost = cost.arredonda(casasDecimais: 2)
            let valueText = textCost.replacingOccurrences(of: ".", with: ",")
            totalCost = valueText
        }
        
        controller.updateTotalCost()
    }
    
    func getTotalCostOrder() {
        calculateTotalValue()
        guard let controller = controller else {
            return
        }
        controller.openOrderReceipt()
    }
}

