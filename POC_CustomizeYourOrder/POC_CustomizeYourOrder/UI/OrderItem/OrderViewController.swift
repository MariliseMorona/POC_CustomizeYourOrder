//
//  OrderViewController.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 10/11/23.
//

import UIKit

class OrderViewController: UIViewController {

    weak var delegate: OrderViewControllerProtocol?
    var viewModel: OrderViewModel?
    
    private var orderView = OrderView()
    private var navigationView = NavigationView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = orderView
        view.backgroundColor = UIColor.purple
        self.viewModel = OrderViewModel(model: nil, controller: self)
        initialState()
       
    }

    func initialState() {
        fetchedNavigation()
        fetchedSizeView()
        fetchedFooterView()
        fetchedQuantifyView()
        fetchedDrinkView()
        fetchedCutleryView()
        fetchedMoreView()
        fetchedObservationView()
    }
}

extension OrderViewController: OrderViewControllerProtocol {
    func updateTotalCost() {
        if let cost = viewModel?.totalCost {
            var newCost = "R$ \(cost)"
            let quantity = QuantifySectionModel(title: Strings.howMuch.text, subtitle: Strings.total.text, value: newCost)
            orderView.quantifyItem.data = quantity
        } else {
            fetchedQuantifyView()
        }
    }
    
    func openOrderReceipt() {
        let controller = OrderViewFactory.openReceiptController(vc: self)
        controller.modalPresentationStyle = .popover
        present(controller, animated: true)
    }
    
    func changeForDecreaseItemBtm(tag: Int) {
        if tag == ItemTags.addBtn.value {
            orderView.quantifyItem.quantifyView.decreaseItem.setImage(UIImage.decreaseBtn, for: .normal)
        }
    }
    
    func updateObservation() {
        if let message = self.viewModel?.messageObs {
            let obs = ObservationSectionModel(message: message, placeholderP01: Strings.empty.text, placeholderP02: Strings.empty.text, placeholderP03: Strings.empty.text)
            orderView.observation.data = obs
        }
    }
    
    func changeForChecked() {
        if let (key, value) = viewModel?.selectedSection?.first {
            switch key {
            case .moreItens:
                value == MoreItensTag.cookie.value ? orderView.moreItem.cookieView.addItem.setImage(UIImage.checkedBox, for: .normal) : orderView.moreItem.rollView.addItem.setImage(UIImage.checkedBox, for: .normal)
            default:
                ErrorModel.notFound.text
            }
        }
    }
    
    func changeForUnchecked() {
        if let (key, value) = viewModel?.selectedSection?.first {
            switch key {
            case .moreItens:
                value == MoreItensTag.cookie.value ? orderView.moreItem.cookieView.addItem.setImage(UIImage.uncheckedBox, for: .normal) : orderView.moreItem.rollView.addItem.setImage(UIImage.uncheckedBox, for: .normal)
            default:
                ErrorModel.notFound.text
            }
        }
    }
    
    func updateCountDrinks() {
        orderView.drinkItem.firstCount = self.viewModel?.countSoda ?? 0
        orderView.drinkItem.secondCount = self.viewModel?.countJuice ?? 0
        orderView.drinkItem.thirdCount = self.viewModel?.countWater ?? 0
    }
    
    func changeForTrashBtn() {
        orderView.quantifyItem.quantifyView.decreaseItem.setImage(UIImage.iconTrash, for: .normal)
    }
    
    func changeForDecreaseBtn() {
        if let (key, value) = viewModel?.selectedSection?.first {
            switch key {
            case .plateSize:
                orderView.quantifyItem.quantifyView.decreaseItem.setImage(UIImage.decreaseBtn, for: .normal)
            case .drinks:
                switch value {
                case 1:
                    orderView.drinkItem.quantifyFirstDrinkView.decreaseItem.setImage(UIImage.decreaseBtn, for: .normal)
                case 2:
                    orderView.drinkItem.quantifySecondDrinkView.decreaseItem.setImage(UIImage.decreaseBtn, for: .normal)
                case 3:
                    orderView.drinkItem.quantifyThirdDrinkView.decreaseItem.setImage(UIImage.decreaseBtn, for: .normal)
                default:
                    ErrorModel.notFound.text
                }
            case .item:
                orderView.drinkItem.quantifyThirdDrinkView.decreaseItem.setImage(UIImage.decreaseBtn, for: .normal)
            default:
                ErrorModel.notFound.text
            }
        }
    }
    
    func changeForPresentDfAddButton() {
        orderView.quantifyItem.presentButton = ((self.viewModel?.dfAddBtn) != nil)
        orderView.footerView.presentButton = false
    }
    
    func changeForInativedBtn() {
        if let (key, value) = viewModel?.selectedSection?.first {
            switch key {
            case .drinks:
                switch value {
                case 1:
                    orderView.drinkItem.quantifyFirstDrinkView.decreaseItem.setImage(UIImage.inativedDecreaseBtn, for: .normal)
                case 2:
                    orderView.drinkItem.quantifySecondDrinkView.decreaseItem.setImage(UIImage.inativedDecreaseBtn, for: .normal)
                case 3:
                    orderView.drinkItem.quantifyThirdDrinkView.decreaseItem.setImage(UIImage.inativedDecreaseBtn, for: .normal)
                default:
                    ErrorModel.notFound.text
                }
            default:
                ErrorModel.notFound.text
            }
        }
    }
    
    func updateCountItem() {
        if let (key, value) = viewModel?.selectedSection?.first {
            switch key {
            case .drinks:
                switch value {
                case 1:
                    orderView.drinkItem.quantifyFirstDrinkView.qtdItem.text = String(self.viewModel?.countSoda ?? 0)
                case 2:
                    orderView.drinkItem.quantifySecondDrinkView.qtdItem.text = String(self.viewModel?.countJuice ?? 0)
                case 3:
                    orderView.drinkItem.quantifyThirdDrinkView.qtdItem.text = String(self.viewModel?.countWater ?? 0)
                default:
                    ErrorModel.notFound.text
                }
            case .item:
                orderView.quantifyItem.count = self.viewModel?.countItem ?? 0
                orderView.quantifyItem.presentButton = false
            default:
                ErrorModel.notFound.text
            }
        }
        
    }
    
    func changeForPresentButton() {
        orderView.footerView.presentButton = ((self.viewModel?.radioBtn) != nil)
    }
    
    func updateAddress(address: String) {
        navigationView.address = address
    }
    
    func changeAddress(_ completion: @escaping(Result<String, Error>) -> Void){

        let newAddress: String = ""
        let alertController = UIAlertController(
            title: Strings.hello.text,
            message: Strings.changeAddress.text,
            preferredStyle: UIAlertController.Style.alert
        )
        alertController.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = Strings.insertAddress.text
            textField.clearButtonMode = .whileEditing
        }
        
        let confirmAction = UIAlertAction(
            title: Strings.change.text, style: UIAlertAction.Style.default) { (action) in
                if let text = alertController.textFields?.first?.text, text != nil, text != Strings.empty.text {
                    completion(.success(text))
                }
                let error = NSError(domain: Strings.ops.text, code: 42, userInfo: nil)
                completion(.failure(error))
            }
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: Actions Methods
extension OrderViewController {
    @objc private func tappedNavigation() {
        self.viewModel?.alertChangeAddress()
    }
    
    @objc private func tappedBranding(){
        let alertController = UIAlertController(
            title: Strings.hello.text,
            message: Strings.moreInformation.text,
            preferredStyle: UIAlertController.Style.alert
        )
        
        let confirmAction = UIAlertAction(
            title: Strings.go.text, style: UIAlertAction.Style.default) { (action) in
                if let url = URL(string: Strings.aiqURL.text) {
                   UIApplication.shared.open(url, options: [:], completionHandler: nil)
               }
        }
        let cancel = UIAlertAction(
            title: Strings.back.text, style: .destructive, handler: { (action) -> Void in })

        alertController.addAction(confirmAction)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func tappedUser(){
        let alertController = UIAlertController(
            title: Strings.sorry.text,
            message: Strings.somethingWrong.text,
            preferredStyle: UIAlertController.Style.alert
        )
        
        let confirmAction = UIAlertAction(
            title: Strings.ok.text, style: UIAlertAction.Style.default, handler: { (action) -> Void in })
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func tappedRadioBtn(sender: UIButton) {
        sender.tag == SizeTag.middle.value ? (orderView.sizeItem.middleRadioButton.setImage(UIImage.selectedRadioBtn, for: .normal)) : (orderView.sizeItem.middleRadioButton.setImage(UIImage.deselectedRadioBtn, for: .normal))
        sender.tag == CutleryTag.fork.value ? (orderView.sizeItem.largeRadioButton.setImage(UIImage.selectedRadioBtn, for: .normal)) : (orderView.sizeItem.largeRadioButton.setImage(UIImage.deselectedRadioBtn, for: .normal))
        viewModel?.selectedSizeItem(tag: sender.tag)
    }
    
    @objc private func tappedAddItem(sender: UIButton){
        viewModel?.addItem(tag: sender.tag)
    }
    
    @objc private func tappedReduceItem(sender: UIButton){
        viewModel?.reduceItem(tag: sender.tag)
    }
    
    @objc private func tappedAddDrink(sender: UIButton){
        viewModel?.addTypeDrink(tag: sender.tag)
    }
    
    @objc private func tappedReduceDrink(sender: UIButton){
        viewModel?.reduceTypeDrink(tag: sender.tag)
    }
    
    @objc private func tappedCutleryRadioBtn(sender: UIButton){
        sender.tag == CutleryTag.hashi.value ? (orderView.cutleryItem.hashiView.addItem.setImage(UIImage.selectedRadioBtn, for: .normal)) : (orderView.cutleryItem.hashiView.addItem.setImage(UIImage.deselectedRadioBtn, for: .normal))
        sender.tag == CutleryTag.fork.value ? (orderView.cutleryItem.forkView.addItem.setImage(UIImage.selectedRadioBtn, for: .normal)) : (orderView.cutleryItem.forkView.addItem.setImage(UIImage.deselectedRadioBtn, for: .normal))
        
        viewModel?.addCutlery(tag: sender.tag)
    }
    
    @objc private func tappedCheckBox(sender: UIButton) {
        viewModel?.addMoreItens(tag: sender.tag)
    }
    
    @objc private func tappedFooterBtn() {
        viewModel?.getTotalCostOrder()
    }
}

extension OrderViewController {
    func fetchedNavigation(){
        self.navigationItem.titleView = navigationView
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage.aiqBranding,
            style: .plain,
            target: self,
            action: #selector(tappedBranding))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage.iconUser,
            style: .plain,
            target: self,
            action: #selector(tappedUser))
        if let address = self.viewModel?.address {
            self.navigationView.address = address
        }
        
        self.navigationView.btnNavigation.addTarget(self, action: #selector(tappedNavigation), for: .touchUpInside)
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }
    
    fileprivate func fetchedSizeView() {
        orderView.sizeItem.middleRadioButton.setImage(UIImage.deselectedRadioBtn, for: .normal)
        orderView.sizeItem.middleRadioButton.addTarget(self, action: #selector(tappedRadioBtn), for: .touchUpInside)
        orderView.sizeItem.middleRadioButton.tag = SizeTag.middle.value
        
        orderView.sizeItem.largeRadioButton.setImage(UIImage.deselectedRadioBtn, for: .normal)
        orderView.sizeItem.largeRadioButton.addTarget(self, action: #selector(tappedRadioBtn), for: .touchUpInside)
        orderView.sizeItem.largeRadioButton.tag = SizeTag.large.value
        
        let size = SizeSectionModel(title: Strings.whatSize.text, subtitle: Strings.selectedOne.text, value: Strings.empty.text)
        orderView.sizeItem.data =  size
        
        let sizeValue = SizeSectionModel(title: Strings.empty.text, subtitle: Strings.empty.text, value: Strings.value2290.text)
        orderView.sizeItem.dataValue =  sizeValue

    }
    
    fileprivate func fetchedFooterView() {
        orderView.footerView.footerButton.addTarget(self, action: #selector(tappedFooterBtn), for: .touchUpInside)
        
        let footerData = FooterSectionModel(make: Strings.makeWith.text, city: Strings.maringa.text, copy: Strings.footer.text, cnpj: Strings.cnpj.text)
        orderView.footerView.data = footerData
    }
    
    fileprivate func fetchedQuantifyView() {
        orderView.quantifyItem.quantifyView.defaultAddBtn.addTarget(self, action: #selector(tappedAddItem), for: .touchUpInside)
        orderView.quantifyItem.quantifyView.defaultAddBtn.tag = 1
        orderView.quantifyItem.quantifyView.addItem.addTarget(self, action: #selector(tappedAddItem), for: .touchUpInside)
        orderView.quantifyItem.quantifyView.addItem.tag = 2
        orderView.quantifyItem.quantifyView.decreaseItem.addTarget(self, action: #selector(tappedReduceItem), for: .touchUpInside)
        orderView.quantifyItem.quantifyView.decreaseItem.tag = 3
        
        let title = TitleSectionModel(name: Strings.namePlate.text, from: Strings.fromValue.text, value: Strings.value1990.text, description: Strings.descriptionPlate.text)
        orderView.titleItem.data = title
        
        let quantify = QuantifySectionModel(title: Strings.howMuch.text, subtitle: Strings.empty.text, value: Strings.empty.text)
        orderView.quantifyItem.data = quantify
        
    }
    
    fileprivate func fetchedDrinkView() {
        orderView.drinkItem.quantifyFirstDrinkView.decreaseItem.tag = DrinkTag.soda.value
        orderView.drinkItem.quantifyFirstDrinkView.addItem.tag = DrinkTag.soda.value
        orderView.drinkItem.quantifyFirstDrinkView.decreaseItem.setImage(UIImage.inativedDecreaseBtn, for: .normal)
        orderView.drinkItem.quantifyFirstDrinkView.addItem.addTarget(self, action: #selector(tappedAddDrink), for: .touchUpInside)
        orderView.drinkItem.quantifyFirstDrinkView.decreaseItem.addTarget(self, action: #selector(tappedReduceDrink), for: .touchUpInside)
        
        orderView.drinkItem.quantifySecondDrinkView.decreaseItem.tag = DrinkTag.juice.value
        orderView.drinkItem.quantifySecondDrinkView.addItem.tag = DrinkTag.juice.value
        orderView.drinkItem.quantifySecondDrinkView.decreaseItem.setImage(UIImage.inativedDecreaseBtn, for: .normal)
        orderView.drinkItem.quantifySecondDrinkView.addItem.addTarget(self, action: #selector(tappedAddDrink), for: .touchUpInside)
        orderView.drinkItem.quantifySecondDrinkView.decreaseItem.addTarget(self, action: #selector(tappedReduceDrink), for: .touchUpInside)
        
        orderView.drinkItem.quantifyThirdDrinkView.decreaseItem.tag = DrinkTag.water.value
        orderView.drinkItem.quantifyThirdDrinkView.addItem.tag = DrinkTag.water.value
        orderView.drinkItem.quantifyThirdDrinkView.decreaseItem.setImage(UIImage.inativedDecreaseBtn, for: .normal)
        orderView.drinkItem.quantifyThirdDrinkView.addItem.addTarget(self, action: #selector(tappedAddDrink), for: .touchUpInside)
        orderView.drinkItem.quantifyThirdDrinkView.decreaseItem.addTarget(self, action: #selector(tappedReduceDrink), for: .touchUpInside)
    }
    
    fileprivate func fetchedCutleryView() {
        orderView.cutleryItem.hashiView.addItem.addTarget(self, action: #selector(tappedCutleryRadioBtn), for: .touchUpInside)
        orderView.cutleryItem.hashiView.addItem.tag = CutleryTag.hashi.value
        
        orderView.cutleryItem.forkView.addItem.addTarget(self, action: #selector(tappedCutleryRadioBtn), for: .touchUpInside)
        orderView.cutleryItem.forkView.addItem.tag = CutleryTag.fork.value
    
        let cutData = CutlerySectionModel(title: Strings.needFork.text, subtitle: Strings.selectedOne.text)
        orderView.cutleryItem.data = cutData
    }
    
    fileprivate func fetchedMoreView() {
        orderView.moreItem.cookieView.addItem.setImage(UIImage.uncheckedBox, for: .normal)
        orderView.moreItem.cookieView.addItem.addTarget(self, action: #selector(tappedCheckBox), for: .touchUpInside)
        orderView.moreItem.cookieView.addItem.tag = MoreItensTag.cookie.value
        
        orderView.moreItem.rollView.addItem.setImage(UIImage.uncheckedBox, for: .normal)
        orderView.moreItem.rollView.addItem.addTarget(self, action: #selector(tappedCheckBox), for: .touchUpInside)
        orderView.moreItem.rollView.addItem.tag = MoreItensTag.rolls.value
        
        let moreData = MoreSectionModel(title: Strings.moreItens.text, subtitle: Strings.selectedTwo.text)
        orderView.moreItem.data = moreData
    }
    
    func fetchedObservationView(){
        let obs = ObservationSectionModel(message: Strings.empty.text, placeholderP01: Strings.whatObservation.text, placeholderP02: Strings.opcional.text , placeholderP03: Strings.changePlate.text)
        orderView.observation.data = obs
    }
}

extension OrderViewController: ObservationSectionDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        if let text = textView.text, text != Strings.empty.text {            self.viewModel?.getObservation(message: text)
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if let text = textView.text, text != Strings.empty.text {
            self.viewModel?.getObservation(message: text)
            return true
        }
        return false
    }
}
