//
//  String+Extensions.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

extension NSAttributedString {
    convenience init?(html: String) {
        guard let data = html.data(using: .utf8) else { return nil }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        try? self.init(data: data, options: options, documentAttributes: nil)
    }
}


extension String {
    var asURL: URL? {
        URL(string: self)
    }
}

enum Strings {
    case empty
    case hello
    case changeAddress
    case insertAddress
    case change
    case ops
    case moreInformation
    case go
    case aiqURL
    case back
    case sorry
    case somethingWrong
    case ok
    case whatSize
    case selectedOne
    case value2290
    case makeWith
    case maringa
    case footer
    case cnpj
    case ticket
    case howMuch
    case total
    case value2990
    case obrigatory
    case middle
    case value1990
    case large
    case value2890
    case soda
    case value10
    case juice
    case value6
    case water
    case value3
    case wantDrink
    case chooseQuantity
    case hashi
    case cutlery
    case value1
    case needFork
    case cookie
    case value2
    case roll
    case value8
    case moreItens
    case selectedTwo
    case defaultAddress
    case namePlate
    case fromValue
    case descriptionPlate
    case add
    case whatObservation
    case opcional
    case changePlate
    case confirmOrder
    case receivedOrder
    case wait
    
    var text: String {
        switch self {
        case .empty:
            return ""
        case .hello:
            return "oi fominha"
        case .changeAddress:
            return "você deseja alterar o endereço de entrega?"
        case .insertAddress:
            return "digite seu endereço"
        case .change:
            return "Trocar"
        case .ops:
            return "ops"
        case .moreInformation:
            return "para saber mais sobre nós, teremos que te levar para o nosso site ok?"
        case .go:
            return "vamos"
        case .aiqURL:
            return "https://www.parceiros.aiqfome.com"
        case .back:
            return "voltar"
        case .sorry:
            return "ops, desculpa"
        case .somethingWrong:
            return "mas algo de errado, não esta certo. estamos consertando isso, tente novamente mais tarde."
        case .ok:
            return "ok"
        case .whatSize:
            return "qual o tamanho?"
        case .selectedOne:
            return "escolha 1"
        case .value2290:
            return "de R$ 22,90 por"
        case .makeWith:
            return "feito com"
        case .maringa:
            return "em maringá-PR"
        case .footer:
            return "aiqfome.com © 2007-2023 aiqfome LTDA."
        case .cnpj:
            return "CNPJ: 09.186.786/0001-58"
        case .ticket:
            return "ver ticket"
        case .howMuch:
            return "quantos?"
        case .total:
            return "total"
        case .value2990:
            return "R$ 29,90"
        case .obrigatory:
            return "obrigatório"
        case .middle:
            return "médio"
        case .value1990:
            return "R$ 19,90"
        case .large:
            return "grande"
        case .value2890:
            return "R$ 28,90"
        case .soda:
            return "coca-cola"
        case .value10:
            return "+R$ 10,00"
        case .juice:
            return "suco prats laranja"
        case .value6:
            return "+R$ 6,00"
        case .water:
            return "água sem gás"
        case .value3:
            return "+R$ 3,00"
        case .wantDrink:
            return "vai querer bebida?"
        case .chooseQuantity:
            return "escolha quantas quiser"
        case .hashi:
            return "hashi"
        case .cutlery:
            return "garfo e faca descartável"
        case .value1:
            return "+R$ 1,00"
        case .needFork:
            return "precisa de talher?"
        case .cookie:
            return "biscoito da sorte"
        case .value2:
            return "+R$ 2,00"
        case .roll:
            return "rolinho primavera"
        case .value8:
            return "+R$ 8,00"
        case .moreItens:
            return "mais alguma coisa?"
        case .selectedTwo:
            return "escolha até 2"
        case .defaultAddress:
            return "Rua Mandaguari, 198 >"
        case .namePlate:
            return "Ceviche de salmão"
        case .fromValue:
            return "a partir de"
        case .descriptionPlate:
            return "salmão temperado com limão, cebola e pimenta"
        case .add:
            return "adicionar"
        case .whatObservation:
            return "alguma observação do item?"
        case .opcional:
            return "opcional"
        case .changePlate:
            return "ex.: tirar algum ingrediente, ponto do prato"
        case .confirmOrder:
            return "confirmar pedido"
        case .receivedOrder:
            return "uhuu, pedido feito."
        case .wait:
            return "aguarde que ele já esta chegando."
        }
    }
}
