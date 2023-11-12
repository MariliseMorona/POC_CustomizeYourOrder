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
        let viewModel = OrderViewModel(controller: vc)
        guard let vcProtocol = vc as? OrderViewControllerProtocol else {
           fatalError(ErrorModel.notFound.text)
        }
        return vcProtocol as! OrderViewController
    }
}
