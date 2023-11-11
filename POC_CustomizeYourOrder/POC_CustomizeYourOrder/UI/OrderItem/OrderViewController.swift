//
//  OrderViewController.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 10/11/23.
//

import UIKit

class OrderViewController: UIViewController {

    private var orderView = OrderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = orderView
    }
}
