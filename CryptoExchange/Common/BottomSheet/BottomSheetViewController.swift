//
//  BottomSheetViewController.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 25/12/23.
//

import UIKit
import Stevia
import RxSwift

class BottomSheetViewController: UIViewController {

    private let overlayView = UIView()
    private let bottomSheetView: BottomSheetView
    
    init(bottomSheetView: BottomSheetView) {
        self.bottomSheetView = bottomSheetView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overlayView.alpha = 0.7
        overlayView.backgroundColor = .black

        self.view.subviews {
            overlayView
            bottomSheetView
        }

        overlayView.Top == view.Top
        overlayView.Bottom == bottomSheetView.Top
        overlayView.fillHorizontally()
        bottomSheetView.Bottom == view.Bottom
        bottomSheetView.fillHorizontally()
    }
}
