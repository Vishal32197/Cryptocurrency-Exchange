//
//  Routing.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 20/03/24.
//

import Foundation
import UIKit

enum AppRoute {
    case home
    case profile
    case settings
    // Add more cases for other routes as needed
}

// Define a custom routing handler
struct NavigationRouter {
    static func navigate(to route: AppRoute) {
        guard let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else {
            fatalError("Root view controller is not a UINavigationController")
        }

//        switch route {
//        case .home:
//            // Navigate to the home screen
////            let homeVC = HomeViewController()
////            navigationController.pushViewController(homeVC, animated: true)
//        case .profile(let userID):
//            // Navigate to the profile screen for the given user ID
//            let profileVC = ProfileViewController()
//            navigationController.pushViewController(profileVC, animated: true)
//        case .settings:
//            // Navigate to the settings screen
//            let settingsVC = SettingsViewController()
//            navigationController.pushViewController(settingsVC, animated: true)
//        }
    }
}

// Example usage
class SomeViewController: UIViewController {
    func navigateToProfile(userID: String) {
       
    }
}
