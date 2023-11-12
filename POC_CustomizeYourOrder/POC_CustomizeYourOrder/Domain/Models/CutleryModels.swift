//
//  CutleryModels.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 12/11/23.
//

import UIKit

enum CutleryTag {
    case hashi
    case fork

    var value: Int {
        switch self {
        case .hashi:
            return 1
        case .fork:
            return 2
        }
    }
    
    var cost: Double {
        switch self {
        case .hashi:
            return 0
        case .fork:
            return 1.00
        }
    }
}
