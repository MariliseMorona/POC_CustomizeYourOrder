//
//  AppDelegate.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 10/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = ViewController()
        let navigation = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigation
        
        return true
    }

}

