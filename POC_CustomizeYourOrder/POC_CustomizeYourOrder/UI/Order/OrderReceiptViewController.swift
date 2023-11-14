//
//  OrderReceiptViewController.swiftController.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 13/11/23.
//

import UIKit

class OrderReceiptViewController: UIViewController {
    
    weak var delegate: OrderReceiptViewControllerProtocol?
    var viewModel: OrderViewModel?
    
    var order = [OrderReceiptItensModel]()
    var fullOrder = OrderReceiptModel()
    
    private var orderView = OrderReceiptView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = orderView
        orderView.footerButton.addTarget(self, action: #selector(tappedBtn), for: .touchUpInside)
        fetchedOrderItems()
        fetchedOrder()
    }
    
    @objc func tappedBtn(){
        let alertController = UIAlertController(
            title: Strings.receivedOrder.text,
            message: Strings.wait.text,
            preferredStyle: UIAlertController.Style.alert
        )
        let confirmAction = UIAlertAction(title: Strings.ok.text, style: .default) { _ in
            self.dismiss(animated: true)
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension OrderReceiptViewController: OrderReceiptViewControllerProtocol {
    
}

extension OrderReceiptViewController {
    fileprivate func fetchedOrderItems() {
        if let itensOrder = viewModel?.model {
            if itensOrder.countItem != 0{
                order.append(OrderReceiptItensModel(item: Strings.namePlate.text, quantity: String(itensOrder.countItem ?? 0), priceUnit: itensOrder.priceItem?.arredonda(casasDecimais: 2), costTotalItem: itensOrder.costItem?.arredonda(casasDecimais: 2)))
                if itensOrder.countSoda != 0 {
                    order.append(OrderReceiptItensModel(item: DrinkTag.soda.text, quantity: String(itensOrder.countSoda ?? 0), priceUnit: DrinkTag.soda.cost.arredonda(casasDecimais: 2), costTotalItem: itensOrder.costSoda?.arredonda(casasDecimais: 2)))
                }
                
                if itensOrder.countJuice != 0 {
                    order.append(OrderReceiptItensModel(item: DrinkTag.juice.text, quantity: String(itensOrder.countJuice ?? 0), priceUnit: String(DrinkTag.juice.cost), costTotalItem: itensOrder.costJuice?.arredonda(casasDecimais: 2)))
                }
                if itensOrder.countWater != 0 {
                    order.append(OrderReceiptItensModel(item: DrinkTag.water.text, quantity: String(itensOrder.countWater ?? 0), priceUnit: DrinkTag.water.cost.arredonda(casasDecimais: 2), costTotalItem: itensOrder.costWater?.arredonda(casasDecimais: 2)))
                }
                if itensOrder.costCutlery != 0 {
                    order.append(OrderReceiptItensModel(item: CutleryTag.fork.text, quantity: String(1), priceUnit: CutleryTag.fork.cost.arredonda(casasDecimais: 2), costTotalItem: itensOrder.costCutlery?.arredonda(casasDecimais: 2)))
                }
                if itensOrder.costCookie != 0 {
                    order.append(OrderReceiptItensModel(item: MoreItensTag.cookie.text, quantity: String(1), priceUnit: MoreItensTag.cookie.cost.arredonda(casasDecimais: 2), costTotalItem: itensOrder.costCookie?.arredonda(casasDecimais: 2)))
                }
                if itensOrder.costRoll != 0 {
                    order.append(OrderReceiptItensModel(item: MoreItensTag.rolls.text, quantity: String(1), priceUnit: MoreItensTag.rolls.cost.arredonda(casasDecimais: 2), costTotalItem: itensOrder.costRoll?.arredonda(casasDecimais: 2)))
                }
            }
        }
    }
    fileprivate func fetchedOrder() {
        if let itensOrder = viewModel?.model {
            if itensOrder.countItem != 0 {
                
                if let address = itensOrder.address {
                    fullOrder.address = address
                }
                
                if let obs = itensOrder.observation {
                    fullOrder.observation = obs
                }
                
                fullOrder.itens = order
                orderView.data = fullOrder
            }
        }
    }
}
