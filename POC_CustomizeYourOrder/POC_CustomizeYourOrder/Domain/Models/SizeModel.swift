//
//  SizeModel.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 12/11/23.
//

import UIKit

enum SizeTag {
    case middle
    case large
    case none

    var value: Int {
        switch self {
        case .middle:
            return 1
        case .large:
            return 2
        case .none:
            return 0
        }
    }
    
    var cost: Double {
        switch self {
        case .middle:
            return 19.90
        case .large:
            return 28.90
        case .none:
            return 0
        }
    }
}
