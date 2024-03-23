//
//  Routing.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 20/03/24.
//

import Foundation
import UIKit

struct NavigationRouter {
    
    static var navigationController: UINavigationController = {
        let initialViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        guard let navigationController = initialViewController as? UINavigationController else {
            fatalError("Root view controller is not a UINavigationController")
        }
        return navigationController
    }()
    
    static func push(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    
    static func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
}
