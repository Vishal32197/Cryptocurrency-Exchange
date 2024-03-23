//
//  NetworkService.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 24/12/23.
//

import Foundation

protocol NetworkServiceProtocol {
    func getAssets(completion: @escaping (_ response: Assets?, _ error: Error?) -> ())
}

class NetworkService: NetworkServiceProtocol {

    let router = Router<CryptoAPI>()
    
    func getAssets(completion: @escaping (Assets?, Error?) -> ()) {
        router.request(.getAssets) { data, response, error in
            if error != nil {
                completion(nil, error)
            }
            
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(Assets.self, from: data)
                completion(response, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
