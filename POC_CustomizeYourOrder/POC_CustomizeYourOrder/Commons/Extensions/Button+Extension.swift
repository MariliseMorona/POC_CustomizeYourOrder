//
//  ButtonProps.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 11/11/23.
//

import Foundation

struct ButtonProps {
    enum ButtonStyle {
        case primary
        case secondary
        case icon(UIImage)
    }
    
    var title: String?
    var style: ButtonStyle
    var image: UIImage?
    var cornerRadius: CGFloat?
    var rounded: Bool
    
    init(style: ButtonStyle,
         title: String? = nil,
         image: UIImage? = nil,
         rounded: Bool = false,
         cornerRadius: CGFloat? = 8.0) {
        self.style = style
        self.title = title
        self.image = image
        self.rounded = false
        self.cornerRadius = cornerRadius
    }
}
