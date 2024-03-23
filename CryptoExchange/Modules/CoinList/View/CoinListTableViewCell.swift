//
//  CoinListTableViewCell.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 23/09/23.
//

import UIKit
import Stevia

class CoinListTableViewCell: UITableViewCell {
    
    var model: CoinListModel? {
        didSet {
            setupCell()
        }
    }
    
    private let coinIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "btc")
        return imageView
    }()
    
    private let coinNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let coinSubNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let coinPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let gainLossLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = .red
        return label
    }()
    
    // MARK: // Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewLayout() {
        contentView.backgroundColor = .white
        
        contentView.subviews {
            coinIconImageView
            coinNameLabel
            coinSubNameLabel
            coinPriceLabel
            gainLossLabel
        }
        
        contentView.left(4)
        contentView.right(4)
        
        coinIconImageView.left(20)
        coinIconImageView.CenterY == coinNameLabel.Bottom
        coinIconImageView.bottom(8)
        coinIconImageView.size(48)
        
        coinNameLabel.Left == coinIconImageView.Right + 16
        coinNameLabel.Top == contentView.Top + 24
        
        coinSubNameLabel.Leading == coinNameLabel.Leading
        coinSubNameLabel.Top == coinNameLabel.Bottom + 8
        
        coinPriceLabel.right(20)
        coinPriceLabel.CenterY == coinNameLabel.CenterY
        
        gainLossLabel.Leading == coinPriceLabel.Leading
        gainLossLabel.Top == coinPriceLabel.Bottom + 2
    }
    
    private func setupCell() {
        guard let model = model else { return }
        coinNameLabel.text = model.name
        coinSubNameLabel.text = model.symbol
        let price = model.priceUsd?.toDouble()
        coinPriceLabel.text = price?.rounded(toDecimalPlaces: 3).toString()
    }
}
