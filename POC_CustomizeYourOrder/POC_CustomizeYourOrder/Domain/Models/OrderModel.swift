//
//  OrderModels.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 12/11/23.
//

import Foundation


struct OrderModel {
    var address: String?
    var observation: String?
    var countItem: Int?
    var sizeItem: SizeTag?
    var priceItem: Double?
    var costItem: Double?
    var countSoda: Int?
    var costSoda: Double?
    var countJuice: Int?
    var costJuice: Double?
    var countWater: Int?
    var costWater: Double?
    var costCutlery: Double?
    var costCookie: Double?
    var costRoll: Double?
    var costTotal: Double?
    
}

struct OrderTypeModel {
    var size: SizeTag?
    var drink: DrinkTag?
    var typeBtn: TypeProduct?
}

enum TypeProduct: Any {
    case plateSize
    case drinks
    case item
    case cutlery
    case moreItens
    
    var type: Any {
        switch self {
        case .plateSize:
            return SizeTag.self
        case .drinks:
            return DrinkTag.self
        case .item:
            return Item.self
        case .cutlery:
            return CutleryTag.self
        case .moreItens:
            return MoreItensTag.self
        }
    }
}

struct Address {
    var newAddress = "Rua Mandaguari, 198 >"
}

struct Item {
    var count: Int = 0
    
    
}

