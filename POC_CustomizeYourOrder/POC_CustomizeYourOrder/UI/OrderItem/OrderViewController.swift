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
    }
    
    @objc private func tappedBranding(){
        print("Você será redirecinado a Home")
    }
    
    @objc private func tappedUser(){
        print("Você será redirecinado ao seu Profile")
    }
}
