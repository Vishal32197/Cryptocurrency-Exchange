//
//  TabBarViewController.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 24/03/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTabs()
    }

    
    private func setupTabs() {
           let vm = CoinListViewModel()
           let tab1ViewController = CoinListViewController(viewModel: vm)
           tab1ViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
           
           let tab2ViewController = PortfolioViewController()
           tab2ViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
           
           let tab3ViewController = WalletViewController()
           tab3ViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
           
           viewControllers = [tab1ViewController, tab2ViewController, tab3ViewController]
       }
}
