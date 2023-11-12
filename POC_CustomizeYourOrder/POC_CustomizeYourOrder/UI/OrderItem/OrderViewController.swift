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
    
    private let minLimitItem = 0
    private let limitItemForTrash = 1
    
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
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = orderView
        view.backgroundColor = UIColor.grayToBackground
        self.viewModel = OrderViewModel(controller: self)
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
    
    func changeToSelectedRadioButton(tag: SizeTag) {
        tag == .middle ? orderView.sizeItem.middleRadioButton.setImage(UIImage.selectedRadioBtn, for: .normal) : orderView.sizeItem.largeRadioButton.setImage(UIImage.selectedRadioBtn, for: .normal)
    }
    
    func changeToDeselectedRadioButton(tag: SizeTag) {
        tag == .middle ? orderView.sizeItem.middleRadioButton.setImage(UIImage.deselectedRadioBtn, for: .normal) : orderView.sizeItem.largeRadioButton.setImage(UIImage.selectedRadioBtn, for: .normal)
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
        } else {
//            self.viewModel.add
        }
        
        self.navigationView.btnNavigation.addTarget(self, action: #selector(tappedNavigation), for: .touchUpInside)
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }
    
    fileprivate func fetchedSizeView() {
        orderView.sizeItem.middleRadioButton.addTarget(self, action: #selector(tappedRadioBtn), for: .touchUpInside)
        orderView.sizeItem.middleRadioButton.tag = SizeTag.middle.value
        orderView.sizeItem.largeRadioButton.addTarget(self, action: #selector(tappedRadioBtn), for: .touchUpInside)
        orderView.sizeItem.largeRadioButton.tag = SizeTag.large.value
        
        let htmlSize = """
                    <span style="font-family: Nunito-Bold; font-size: 16pt;">
                        \(Strings.whatSize.text)
                    </span><br>
                    <span style="font-family: Nunito-Bold; font-size: 12pt; color: #6D6F73">
                        \(Strings.selectedOne.text)
                    </span>
               """
        orderView.sizeItem.title =  NSAttributedString(html: htmlSize)
        
        let htmlValueMiddle = """
                    <span style="font-family: Nunito-Bold; font-size: 12pt; color: #6D6F73">
                                \(Strings.value2290.text)
                    </span><br>
               """
        orderView.sizeItem.middleValue = NSAttributedString(html: htmlValueMiddle)
    }
    
    fileprivate func fetchedFooterView() {
        let htmlAiq = """
                    <p style="text-align: center;">
                        <span style="font-family: Nunito-Bold; font-size: 12pt; color: #580F78">
                            \(Strings.makeWith.text) &hearts; \(Strings.maringa.text)
                        </span>
                    </p>
                """
        print("printando htmlAiq:\(htmlAiq)")
        orderView.footerView.footerLabel.attributedText =  NSAttributedString(html: htmlAiq)
        
        let htmlCopy = """
                   <p style="font-family: Nunito-Bold; font-size: 12pt; text-align: center; color: #580F78;">
                            \(Strings.footer.text)<br>
                            \(Strings.cnpj.text)<br></p>
               """
        orderView.footerView.footerCopyLabel.attributedText =  NSAttributedString(html: htmlCopy)
    }
    
    fileprivate func fetchedQuantifyView() {
        orderView.quantifyItem.quantifyView.defaultAddBtn.addTarget(self, action: #selector(tappedAddItem), for: .touchUpInside)
        orderView.quantifyItem.quantifyView.defaultAddBtn.tag = 1
        orderView.quantifyItem.quantifyView.addItem.addTarget(self, action: #selector(tappedAddItem), for: .touchUpInside)
        orderView.quantifyItem.quantifyView.addItem.tag = 2
        orderView.quantifyItem.quantifyView.decreaseItem.addTarget(self, action: #selector(tappedReduceItem), for: .touchUpInside)
        
        let htmlQuantify = """
                    <span style="font-family: Nunito-Bold; font-size: 16pt; color: #393A3C">
                        \(Strings.howMuch.text)
                    </span><br>
                    <span style="font-family: Nunito-SemiBold; font-size: 14pt; color: #6D6F73">
                        \(Strings.total.text)
                    </span>
                    <span style="font-family: Nunito-Bold; font-size: 14pt; color: #393A3C">
                       \(Strings.value2990.text)
                    </span>
               """
        orderView.quantifyItem.title = NSAttributedString(html: htmlQuantify)
        
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
        
        func configViews() {
            let htmlFork = """
                       <span style="font-family: Nunito-Bold; font-size: 16pt; color: #393A3C">
                            \(Strings.needFork.text)
                       </span><br>
                       <span style="font-family: Nunito-Bold; font-size: 12pt; color: #6D6F73">
                            \(Strings.selectedOne)
                       </span>
                   """
            orderView.cutleryItem.title = NSAttributedString(html: htmlFork)
        }
    }
    
    fileprivate func fetchedMoreView() {
        orderView.moreItem.cookieView.addItem.setImage(UIImage.uncheckedBox, for: .normal)
        orderView.moreItem.cookieView.addItem.addTarget(self, action: #selector(tappedCheckBox), for: .touchUpInside)
        orderView.moreItem.cookieView.addItem.tag = MoreItensTag.cookie.value
        
        orderView.moreItem.rollView.addItem.setImage(UIImage.uncheckedBox, for: .normal)
        orderView.moreItem.rollView.addItem.addTarget(self, action: #selector(tappedCheckBox), for: .touchUpInside)
        orderView.moreItem.rollView.addItem.tag = MoreItensTag.rolls.value
        
        func configViews() {
            let htmlMore = """
                       <span style="font-family: Nunito-Bold; font-size: 16pt; color: #393A3C">
                            \(Strings.moreItens.text)
                       </span><br>
                       <span style="font-family: Nunito-Bold; font-size: 12pt; color: #6D6F73">
                            \(Strings.selectedTwo.text)
                       </span>
                   """
            orderView.moreItem.title = NSAttributedString(html: htmlMore)
        }
        
    }
    
    func fetchedObservationView(){
        let htmlObservation = """
                   <span style="font-family: Nunito-SemiBold; font-size: 14pt; color: #6D6F73">
                        alguma observação do item? &bull; opcional
                   <br>
                        ex.: tirar algum ingrediente, ponto do prato
                   </span>
               """
        orderView.observation.title = NSAttributedString(html: htmlObservation)
    }
}
