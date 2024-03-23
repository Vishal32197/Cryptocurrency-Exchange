//
//  PrimaryButton.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 24/12/23.
//

import UIKit

@IBDesignable
final class PrimaryButton: UIButton {

    var borderWidth: CGFloat = 2.0
    var borderColor = UIColor.white.cgColor

    @IBInspectable var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
            self.setTitleColor(UIColor.white,for: .normal)
        }
    }

    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.clipsToBounds = true
        self.backgroundColor = .green
        self.layer.cornerRadius = 20
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
}
