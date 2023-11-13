//
//  POC_CustomizeYourOrderTests.swift
//  POC_CustomizeYourOrderTests
//
//  Created by marilise morona on 10/11/23.
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

final class POC_CustomizeYourOrderTests: XCTestCase {
    
    private var viewModel: OrderViewModel?
    private var vc: POC_CustomizeYourOrderViewControllerTests?
    override func setUp(){
        super.setUp()
        vc = POC_CustomizeYourOrderViewControllerTests()
        viewModel = OrderViewModel(model: nil, controller: vc!)
    }

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testIfCountItemIsEqualLimit() {
        XCTAssertEqual(viewModel?.countItem, viewModel?.minLimitItem)
    }
    
    func testIfCountItemIsThanLimit() {
        if let count = viewModel?.countItem, let minValue = viewModel?.limitItemForTrash {
            XCTAssertLessThan(count, minValue)
        } else {
            XCTFail("Apresenta valor nil")
        }
    }
    
    func testIfCountSodaItemIsEqualLimit() {
        XCTAssertEqual(viewModel?.countSoda, viewModel?.minLimitItem)
    }
    
    func testIfCountSodaIsThanLimit() {
        if let count = viewModel?.countSoda, let minValue = viewModel?.limitItemForTrash {
            XCTAssertLessThan(count, minValue)
        } else {
            XCTFail("Apresenta valor nil")
        }
    }
    
    func testIfCountJuiceItemIsEqualLimit() {
        XCTAssertEqual(viewModel?.countJuice, viewModel?.minLimitItem)
    }
    
    func testIfCountJuiceIsThanLimit() {
        if let count = viewModel?.countJuice, let minValue = viewModel?.limitItemForTrash {
            XCTAssertLessThan(count, minValue)
        } else {
            XCTFail("Apresenta valor nil")
        }
    }
    
    func testIfCountWaterItemIsEqualLimit() {
        XCTAssertEqual(viewModel?.countWater, viewModel?.minLimitItem)
    }
    
    func testIfCountWaterIsThanLimit() {
        if let count = viewModel?.countWater, let minValue = viewModel?.limitItemForTrash {
            XCTAssertLessThan(count, minValue)
        } else {
            XCTFail("Apresenta valor nil")
        }
    }
    
    func testIsAddressIsEmpty(){
        if let address = viewModel?.address {
            XCTAssertEqual(address, "Rua Mandaguari, 198 >")
        }
    }
    
    func textIfInitialStateIsTotalCostIsZero(){
        if let plate = viewModel?.model?.costItem, let soda = viewModel?.model?.costSoda, let juice = viewModel?.model?.costJuice, let water = viewModel?.model?.costWater, let cutlery = viewModel?.model?.costCutlery, let cookie = viewModel?.model?.costCookie, let roll = viewModel?.model?.costRoll, let totalCost = viewModel?.model?.costTotal {
            let total = plate + soda + juice + water + cutlery + cookie + roll
            XCTAssertEqual(total, totalCost)
        } else {
            XCTFail("Apresenta valor nil")
        }
    }
}
