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

    var value: Int {
        switch self {
        case .middle:
            return 1
        case .large:
            return 2
        }
    }
    
    var cost: Double {
        switch self {
        case .middle:
            return 19.90
        case .large:
            return 28.90
        }
    }
}
