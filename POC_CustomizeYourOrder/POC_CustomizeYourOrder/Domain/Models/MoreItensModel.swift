//
//  MoreItensModel.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 12/11/23.
//

import UIKit

enum MoreItensTag {
    case cookie
    case rolls

    var value: Int {
        switch self {
        case .cookie:
            return 1
        case .rolls:
            return 2
        }
    }
    
    var cost: Double {
        switch self {
        case .cookie:
            return 2.00
        case .rolls:
            return 8.00
        }
    }
    var text: String {
        switch self {
        case .cookie:
            return Strings.cookie.text
        case .rolls:
            return Strings.roll.text
        }
    }
}
