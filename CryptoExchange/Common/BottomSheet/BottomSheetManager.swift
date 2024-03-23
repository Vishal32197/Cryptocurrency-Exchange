//
//  BottomSheetManager.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 24/12/23.
//

import Foundation
import UIKit

enum BottomSheetType {
    case primary
}

struct BottomSheetData {
    let title: String
    let subTitle: String
    let description: String
    let buttonTitle: String
}

struct BottomSheetManager {
   static func presentBottomSheet(type: BottomSheetType, viewController: UIViewController) {
        switch type {
        case .primary:
            let bottomSheetModel = BottomSheetViewModel(titleText: "Username", subTitleText: "", buttonTitleText: "", descriptionText: "")
            let bottomSheetView = BottomSheetView(viewModel: bottomSheetModel)
            let bottomsheet = BottomSheetViewController(bottomSheetView: bottomSheetView)
            bottomsheet.modalPresentationStyle = .overCurrentContext
            ViewControllerPresenter.present(viewController: bottomsheet, from: viewController)
        }
    }
}

struct ViewControllerPresenter {
    static func present(viewController: UIViewController, from presentingViewController: UIViewController) {
        presentingViewController.present(viewController, animated: false, completion: nil)
    }
}
