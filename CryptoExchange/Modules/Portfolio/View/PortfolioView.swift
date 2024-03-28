//
//  PortfolioView.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 24/03/24.
//

import UIKit
import Stevia

class PortfolioView: UIView {

    private var curveView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20.0
        view.backgroundColor = .yellow
        return view
    }()
    
    private var portfolioTitle: UILabel = {
        let label = UILabel()
        label.text = "Portfolio"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "USD 3000"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    private let profitlossView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private var profitLossTitle: UILabel = {
        let label = UILabel()
        label.text = "Profit/Loss"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private var profitLossValueLabel: UILabel = {
        let label = UILabel()
        label.text = "-900"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let capitalGainView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private var capitalGainTitle: UILabel = {
        let label = UILabel()
        label.text = "Profit/Loss"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private var capitalGainValueLabel: UILabel = {
        let label = UILabel()
        label.text = "-900"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private func setupViewLayout() {
        self.subviews {
            curveView
            
        }
    }
}
