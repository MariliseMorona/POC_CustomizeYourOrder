//
//  ErrorModel.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 12/11/23.
//

import Foundation

enum ErrorModel {
    case notFound
    
    var text: String {
        switch self {
        case .notFound:
            return "Unable to parse."
        }
    }
}
