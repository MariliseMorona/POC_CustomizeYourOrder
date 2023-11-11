//
//  String+Extension.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import UIKit

//extension NSAttributedString {
//    
//    internal convenience init?(html: String) {
//        guard let data = html.data(using: String.Encoding.utf16, allowLossyConversion: false) else {
//            return nil
//        }
//        
//        guard let attributedString = try? NSMutableAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) else {
//            return nil
//        }
//        
//        self.init(attributedString: attributedString)
//    }
//}


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
