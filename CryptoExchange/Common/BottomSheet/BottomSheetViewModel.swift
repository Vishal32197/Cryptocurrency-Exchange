//
//  BottomSheetViewModel.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 25/12/23.
//

import Foundation
import RxSwift

protocol BottomSheetViewModelProtocol {
    var titleText: String { get }
    var subTitleText: String { get }
    var descriptionText: String { get }
    var buttonTitleText: String { get }
}

class BottomSheetViewModel: BottomSheetViewModelProtocol {
    var descriptionText: String
    var titleText: String
    var subTitleText: String
    var buttonTitleText: String
    
    init(titleText: String, subTitleText: String, buttonTitleText: String, descriptionText: String) {
        self.titleText = titleText
        self.subTitleText = subTitleText
        self.buttonTitleText = buttonTitleText
        self.descriptionText = descriptionText
    }
}
