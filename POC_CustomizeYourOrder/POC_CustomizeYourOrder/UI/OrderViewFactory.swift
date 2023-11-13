//
//  OrderViewFactory.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 12/11/23.
//

import UIKit

struct OrderViewFactory {
    public static func make() -> OrderViewController {
        let model = OrderModel()
        let vc = OrderViewController()
        let viewModel = OrderViewModel(model: model, controller: vc)
        guard let vcProtocol = vc as? OrderViewControllerProtocol else {
           fatalError(ErrorModel.notFound.text)
        }
        return vcProtocol as! OrderViewController
    }
    
    public static func openReceiptController(vc: OrderViewController) -> OrderReceiptViewController {
        if let vm = vc.viewModel {
            let model = vm.model
            let vc = OrderReceiptViewController()
            vc.viewModel = vm
            guard let vcProtocol = vc as? OrderReceiptViewControllerProtocol else {
               fatalError(ErrorModel.notFound.text)
            }
            return vcProtocol as! OrderReceiptViewController
        }
        return OrderReceiptViewController()
        
    }
}
