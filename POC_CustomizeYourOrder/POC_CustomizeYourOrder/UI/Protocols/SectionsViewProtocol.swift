//
//  SectionsViewProtocol.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 14/11/23.
//

import UIKit

protocol ObservationSectionDelegate: AnyObject {
    func textViewDidEndEditing(_ textView: UITextView)
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
}
