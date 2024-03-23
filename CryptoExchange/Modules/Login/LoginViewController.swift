//
//  LoginViewController.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 04/11/23.
//

import UIKit
import Stevia
import RxCocoa
import RxSwift

class LoginViewController: UIViewController, UITextFieldDelegate {

    private lazy var userIdTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "User Name"
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTF: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Password"
        textField.delegate = self
        return textField
    }()

    private let loginButton: PrimaryButton = {
        let button = PrimaryButton()
        button.titleText = "Login"
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        addButtonBinding()
    }

    let disposeBag = DisposeBag()
    
    func setupLayout() {
        view.backgroundColor = .white
        view.subviews {
            userIdTextField
            passwordTF
            loginButton
        }
        
        userIdTextField.CenterY == view.CenterY - 60
        userIdTextField.fillHorizontally(padding: 24)
        userIdTextField.height(52)
        
        passwordTF.Top == userIdTextField.Bottom + 12
        passwordTF.fillHorizontally(padding: 24)
        passwordTF.height(52)
        
        loginButton.Top == passwordTF.Bottom + 20
        loginButton.fillContainer(padding: 20)
        loginButton.height(56)
      }
    
    func addButtonBinding() {
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self  else { return }
//                let vm = HomeScreenViewModel()
//                let secondVC = HomeScreenViewController(viewModel: vm)
//                self?.navigationController?.pushViewController(secondVC, animated: true)
                let vm = HomeScreenViewModel()
                let vc = HomeScreenViewController(viewModel: vm)
                self.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
    }
}
