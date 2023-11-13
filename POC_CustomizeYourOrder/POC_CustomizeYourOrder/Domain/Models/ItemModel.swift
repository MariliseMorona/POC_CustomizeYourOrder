//
//  ItemModel.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 13/11/23.
//

import Foundation

enum ItemTags {
    case addBtnDf
    case addBtn
    case decreasebtn

    var value: Int {
        switch self {
        case .addBtnDf:
            return 1
        case .addBtn:
            return 2
        case .decreasebtn:
            return 3
        }
    }
}
