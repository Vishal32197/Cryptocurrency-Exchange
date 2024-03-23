//
//  CoinListModel.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 09/10/23.
//

import Foundation

struct Assets: Codable {
    let data: [CoinListModel]
}

struct CoinListModel: Codable {
    let id: String?
    let rank: String?
    let symbol: String?
    let name: String?
    let supply: String?
    let maxSupply: String?
    let marketCapUsd: String?
    let volumeUsd24Hr: String?
    let priceUsd: String?
    let changePercent24Hr: String?
    let vwap24Hr: String?
}
