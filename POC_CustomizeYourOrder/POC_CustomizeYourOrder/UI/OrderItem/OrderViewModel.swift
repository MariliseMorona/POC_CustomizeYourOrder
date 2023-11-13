//
//  OrderViewModel.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

class OrderViewModel: OrderViewModelProtocol {
    
    weak var controller: OrderViewControllerProtocol?
    //    var model: OrderModel?
    
    //    init(model: OrderModel, controller: OrderViewControllerProtocol) {
    //        self.model = model
    //        self.controller = controller
    //    }
    
    init(controller: OrderViewControllerProtocol) {
        //        self.model = model
        self.controller = controller
    }
    
    private var privateAddress: Address = Address()
    var address: String? = Strings.defaultAddress.text {
        didSet {
            privateAddress.newAddress = address ?? Strings.defaultAddress.text
            guard let controller = controller else {
                return 
            }
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
            validateIfTheButtonShouldAppear()
        }
    }
    
    private let minLimitItem = 0
    private let limitItemForTrash = 1
    
    private var privateCountItem: Int = 0
    var countItem: Int? = 0 {
        didSet {
            privateCountItem = countItem ?? 0
            guard let controller = controller else {
                return
            }
            controller.updateCountItem()
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
            controller.updateCountItem()
        }
    }
    
    private var privateSelectedSection: [TypeProduct: Int] = [:]
    var selectedSection: [TypeProduct: Int]? = [:] {
        didSet {
            privateSelectedSection = selectedSection ?? [:]
        }
    }
    
    private var privateSelectedSize: SizeTag? = .middle
    var selectedSize: SizeTag? = .middle {
        didSet {
            privateSelectedSize = selectedSize ?? .middle
        }
    }
    
    private var privateSelectedCutlery: CutleryTag? = .hashi
    var selectedCutlery: CutleryTag? = .hashi {
        didSet {
            privateSelectedCutlery = selectedCutlery ?? .hashi
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
        }
    }
    
    private var selectedRollBtn: Bool = false
    var rollBtn: Bool? = false {
        didSet {
            selectedRollBtn = rollBtn ?? false
        }
    }
    
    private var privateMessageObs: String = Strings.empty.text
    var messageObs: String? = Strings.empty.text {
        didSet {
            privateMessageObs = messageObs ?? Strings.empty.text
            print("printando privateMessageObs: \(privateMessageObs)")
            guard let controller = controller else {
                return
            }
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
        } else if privateCountItem >= limitItemForTrash {
            countItem! += 1
            guard let controller = controller else {
                return
            }
            controller.changeForDecreaseBtn()
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
        guard let controller = controller else {
            return
        }
        tag == MoreItensTag.cookie.value ? (cookieBtn = !selectedCookieBtn) : (rollBtn = !selectedRollBtn)
        selectedRollBtn == true ? controller.changeForChecked() : controller.changeForUnchecked()
        selectedCookieBtn == true ? controller.changeForChecked() : controller.changeForUnchecked()
    }
    
    func getObservation(message: String) {
        messageObs = message
    }
    
    func getTotalCostOrder() {
        let costPlate = Double(privateCountItem) * selectedSize!.cost
        print("printando costPlate: \(costPlate)")
        var costSoda: Double = 0
        if privateCountSoda > 0  {
            costSoda = Double(privateCountSoda) * DrinkTag.soda.cost
        }
        print("printando costSoda: \(costSoda)")
        var costJuice: Double = 0
        if privateCountJuice > 0  {
            costJuice = Double(privateCountJuice) * DrinkTag.juice.cost
        }
        print("printando costJuice: \(costJuice)")
        var costWater: Double = 0
        if privateCountWater > 0  {
            costWater = Double(privateCountWater) * DrinkTag.water.cost
        }
        print("printando costWater: \(costWater)")
        var costCutlery: Double = 0
        if privateSelectedCutlery == .fork {
            costCutlery = CutleryTag.fork.cost
        }
        print("printando costCutlery: \(costCutlery)")
        var costMoreItens: Double = 0
        if selectedRollBtn {
            costMoreItens += MoreItensTag.rolls.cost
        }
        print("printando costMoreItens: \(costMoreItens)")
        if selectedCookieBtn {
            costMoreItens += MoreItensTag.cookie.cost
        }
        print("printando costMoreItens: \(costMoreItens)")
        totalCostOrder = costPlate + costSoda + costJuice + costWater + costCutlery + costMoreItens
        print("printando totalCostOrder: \(totalCostOrder)")
    }
}

