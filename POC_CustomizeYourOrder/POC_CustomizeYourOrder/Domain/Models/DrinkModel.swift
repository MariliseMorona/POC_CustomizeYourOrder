//
//  DrinkModel.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 12/11/23.
//

import UIKit

enum DrinkTag {
    case soda
    case juice
    case water

    var value: Int {
        switch self {
        case .soda:
            return 1
        case .juice:
            return 2
        case .water:
            return 3
        }
    }
    
    var cost: Double {
        switch self {
        case .soda:
            return 5.00
        case .juice:
            return 6.00
        case .water:
            return 3.00
        }
    }
}
