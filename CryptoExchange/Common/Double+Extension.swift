//
//  Double+Extension.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 17/03/24.
//

import UIKit

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toDecimalPlaces places: Int) -> Double {
         let divisor = pow(10.0, Double(places))
         return (self * divisor).rounded() / divisor
     }
}

extension String {
    func toDouble() -> Double? {
        return Double(self)
    }
}

extension Double {
    func toString() -> String {
        return String(self)
    }
}
