//
//  ViewModel.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 23/09/23.
//

import Foundation
import RxRelay

protocol CoinListViewModelProtocol {
    var coinList: PublishRelay<[CoinListModel]> { get }
    func getCoinList()
}

final class CoinListViewModel: CoinListViewModelProtocol {
    var coinList = PublishRelay<[CoinListModel]>()
    private var networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func getCoinList() {
        networkService.getAssets {[weak self] response, error in
            guard let self = self else { return }
            if let response = response {
                self.coinList.accept(response.data)
                print(response.data)
            }
        }
    }
}
