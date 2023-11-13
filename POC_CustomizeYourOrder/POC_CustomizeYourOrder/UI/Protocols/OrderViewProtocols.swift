//
//  OrderViewProtocols.swift
//  POC_CustomizeYourOrder
//
//  Created by marilise morona on 12/11/23.
//

import Foundation


protocol OrderViewModelProtocol: AnyObject {
    var totalCost: String? { get set }
    var messageObs: String? { get set }
    var rollBtn: Bool? { get set }
    var cookieBtn: Bool? { get set }
    var selectedSection: [TypeProduct: Int]? { get set }
    var countWater: Int? { get set }
    var countJuice: Int? { get set }
    var countSoda: Int? { get set }
    var countItem: Int? { get set }
    var address: String? { get set }
    var radioBtn: Bool? { get set }
    var dfAddBtn: Bool? { get set }
    func alertChangeAddress()
    func selectedSizeItem(tag: Int)
    func addItem(tag: Int)
    func reduceItem(tag: Int)
    func addTypeDrink(tag: Int)
    func reduceTypeDrink(tag: Int)
    func addCutlery(tag: Int)
    func addMoreItens(tag: Int)
    func getObservation(message: String)
    func getTotalCostOrder()
    

}


protocol OrderViewControllerProtocol: AnyObject {
    func updateAddress(address: String)
    func changeAddress(_ completion: @escaping(Result<String, Error>) -> Void)
    func changeForPresentButton()
    func changeForPresentDfAddButton()
    func updateCountItem()
    func changeForDecreaseBtn()
    func changeForTrashBtn()
    func changeForInativedBtn()
    func changeForChecked()
    func changeForUnchecked()
    func updateObservation()
    func changeForDecreaseItemBtm(tag: Int)
    func openOrderReceipt()
    func updateTotalCost()
    
}
