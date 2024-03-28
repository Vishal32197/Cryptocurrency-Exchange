//
//  WalletViewController.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 24/03/24.
//

import UIKit

class WalletViewController: UIViewController {

    override func viewDidLoad() {
          super.viewDidLoad()
          setupUI()
          view.backgroundColor = .white
      }

      private func setupUI() {
          let stackView = UIStackView()
          stackView.axis = .vertical
          stackView.alignment = .leading
          stackView.spacing = 100
          stackView.translatesAutoresizingMaskIntoConstraints = false

          view.addSubview(stackView)

          NSLayoutConstraint.activate([
              stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
              stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
              stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -50)
          ])

          let steps = ["Step 1: Order placed", "Step 2: Order confirmed", "Step 3: Out for delivery", "Step 4: Delivered"]

          for (index, step) in steps.enumerated() {
              let stepView = StepView(step: step, isLastStep: index == steps.count - 1)
              stackView.addArrangedSubview(stepView)
          }
      }
}

class StepView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    private let dashedLineLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.black.cgColor
        layer.lineDashPattern = [2, 4] // Set the dash pattern
        return layer
    }()

    init(step: String, isLastStep: Bool) {
        super.init(frame: .zero)
        setupUI()
        titleLabel.text = step
        if !isLastStep {
            addDashedLine()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        addSubview(circleView)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            circleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -20),
            circleView.widthAnchor.constraint(equalToConstant: 20),
            circleView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        circleView.layer.cornerRadius = 10
    }
    
    private func addDashedLine() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.width / 2, y: 0))
        path.addLine(to: CGPoint(x: bounds.width / 2, y: bounds.height))
        
        dashedLineLayer.path = path.cgPath
        dashedLineLayer.lineWidth = 1
        dashedLineLayer.fillColor = nil
        dashedLineLayer.masksToBounds = true
        
        layer.addSublayer(dashedLineLayer)
    }
}
