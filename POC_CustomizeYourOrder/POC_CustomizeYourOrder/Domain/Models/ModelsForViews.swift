//
//  ModelsForViews.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 13/11/23.
//

import Foundation


struct QuantifySectionModel {
    var title: String
    var subtitle: String
    var value: String
}

struct ObservationSectionModel {
    var message: String
    var placeholderP01: String
    var placeholderP02: String
    var placeholderP03: String
}

struct SizeSectionModel {
    var title: String
    var subtitle: String
    var value: String
}

struct TitleSectionModel {
    var name: String
    var from: String
    var value: String
    var description: String
}

struct MoreSectionModel {
    var title: String
    var subtitle: String
}

struct CutlerySectionModel {
    var title: String
    var subtitle: String
}

struct FooterSectionModel {
    var make: String
    var city: String
    var copy: String
    var cnpj: String
}
