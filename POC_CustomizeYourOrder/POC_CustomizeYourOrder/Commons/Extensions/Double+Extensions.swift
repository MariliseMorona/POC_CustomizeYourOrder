//
//  Double+Extensions.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 13/11/23.
//

import UIKit

extension Double {
    
    func arredonda(casasDecimais: Int) -> String {
        var formatacao: String {
            let formatacao = NumberFormatter()
            formatacao.minimumFractionDigits = casasDecimais
            return formatacao.string(from: self as NSNumber)!
        }
        return formatacao
    }
}
