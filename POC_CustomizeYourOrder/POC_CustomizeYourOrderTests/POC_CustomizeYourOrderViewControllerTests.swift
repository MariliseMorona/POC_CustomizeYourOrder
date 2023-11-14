//
//  POC_CustomizeYourOrderViewControllerTests.swift
//  POC_CustomizeYourOrderTests
//
//  Created by marilise morona on 14/11/23.
//

import XCTest
@testable import POC_CustomizeYourOrder

class POC_CustomizeYourOrderViewControllerTests: OrderViewControllerProtocol {
    func updateAddress(address: String) { }
    
    func changeAddress(_ completion: @escaping (Result<String, Error>) -> Void) { }
    
    func changeForPresentButton() { }
    
    func changeForPresentDfAddButton() { }
    
    func updateCountItem() { }
    
    func changeForDecreaseBtn() { }
    
    func changeForTrashBtn() { }
    
    func changeForInativedBtn() { }
    
    func changeForChecked() { }
    
    func changeForUnchecked() { }
    
    func updateObservation() { }
    
    func changeForDecreaseItemBtm(tag: Int) { }
    
    func openOrderReceipt() { }
    
    func updateTotalCost() { }
    
    
}
