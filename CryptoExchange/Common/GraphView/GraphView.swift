//
//  GraphView.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 20/03/24.
//

import UIKit
import Stevia
import RxSwift

class GraphView: UIView {
    
    private let graphViewModel: GraphViewModelProtocol!
    private let dispoBag = DisposeBag()

    init(viewModel: GraphViewModelProtocol) {
        self.graphViewModel = viewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
