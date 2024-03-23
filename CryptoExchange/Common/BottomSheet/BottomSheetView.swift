//
//  BottomSheetView.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 25/12/23.
//

import UIKit
import RxSwift
import RxCocoa
import Stevia

class BottomSheetView: UIView {
    let disposeBag = DisposeBag()
    var viewModel: BottomSheetViewModelProtocol
    
    init(viewModel: BottomSheetViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.setupViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bottomsheet"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "init(coder:) has not been implementedinit(coder:) has not been implementedinit(coder:) has not been implemented"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var curveView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12.0
        view.alpha = 1.0
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var button: PrimaryButton = {
        let button = PrimaryButton()
        button.backgroundColor = .green
        button.titleText = "Login"
        return button
    }()
    
    private func setupViewLayout() {
        self.alpha = 1.0
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.subviews {
            curveView
        }
        curveView.subviews {
            titleLabel
            descriptionLabel
            button
        }
        
        curveView.backgroundColor = .white
        curveView.fillContainer()
        
        titleLabel.CenterX == CenterX
        titleLabel.Top == curveView.Top + 12
        
        descriptionLabel.Top == titleLabel.Bottom + 24
        descriptionLabel.fillHorizontally(padding: 24)
        descriptionLabel.Bottom == button.Top - 40
 
        button.Bottom == Bottom - 32
        button.fillHorizontally(padding: 20)
        button.height(56)
    }
}
