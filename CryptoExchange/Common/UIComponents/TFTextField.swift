//
//  TFTextField.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 24/12/23.
//

import UIKit

protocol CustomTextFieldDelegate: AnyObject {
    func customTextFieldDidBeginEditing(_ textField: CustomTextField)
    func customTextFieldDidEndEditing(_ textField: CustomTextField)
    func customTextFieldDidChange(_ textField: CustomTextField)
    func customTextFieldClearButtonTapped(_ textField: CustomTextField)
}

class CustomTextField: UITextField {

    // MARK: - Properties
    
    weak var customDelegate: CustomTextFieldDelegate?

    private let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = UIColor.white
        layer.cornerRadius = 5.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.gray.cgColor

        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.size.height))
        leftViewMode = .always

        // Set up clear button
        clearButtonMode = .whileEditing
        addTarget(self, action: #selector(clearButtonTapped), for: .editingChanged)
        
        // Set up other delegate methods
        delegate = self
    }

    // MARK: - Text Rect and Editing Rect Overrides

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    // MARK: - Custom Delegate Methods

    @objc private func clearButtonTapped() {
        customDelegate?.customTextFieldClearButtonTapped(self)
    }
}

// MARK: - UITextFieldDelegate

extension CustomTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customDelegate?.customTextFieldDidBeginEditing(self)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        customDelegate?.customTextFieldDidEndEditing(self)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Additional custom logic if needed
        customDelegate?.customTextFieldDidChange(self)
        return true
    }
}
