//
//  CoinListViewController.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 23/09/23.
//

import UIKit
import Stevia
import RxSwift

class CoinListViewController: UIViewController {
    
    private var viewModel: CoinListViewModelProtocol
    private let disposeBag = DisposeBag()
    
    private lazy var coinListTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(CoinListTableViewCell.self, forCellReuseIdentifier: "\(CoinListTableViewCell.self)")
        tableview.estimatedRowHeight = 42.0
        tableview.separatorStyle = .none
        tableview.rowHeight = UITableView.automaticDimension
        tableview.separatorInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        return tableview
    }()
    
    init(viewModel: CoinListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewLayout()
        addBindings()
        viewModel.getCoinList()
    }
    
    // MARK: // Private Methods
    private func setupViewLayout() {
        view.backgroundColor = .white
        
        view.subviews {
            coinListTableView
        }
        
        coinListTableView.fillContainer()
    }
    
    private func addBindings() {
        viewModel.coinList
            .bind(to: coinListTableView.rx.items(cellIdentifier: "\(CoinListTableViewCell.self)", cellType: CoinListTableViewCell.self)) {[weak self] row, element, cell in
                cell.model = element
            }.disposed(by: disposeBag)
        
        coinListTableView.rx.modelSelected(CoinListModel.self)
            .subscribe(onNext: { item in
//                let vm = CoinDetailViewModel()
//                let vc = CoinDetailViewController(viewModel: vm)
//                NavigationRouter.push(vc)
            })
            .disposed(by: disposeBag)
    }
}
