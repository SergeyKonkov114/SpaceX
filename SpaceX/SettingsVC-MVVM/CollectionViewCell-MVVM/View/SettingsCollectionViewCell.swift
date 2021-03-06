//
//  SettingsCollectionViewCell.swift
//  SpaceX
//
//  Created by Сергей Коньков on 10.04.2022.
//

import UIKit

class SettingsCollectionViewCell: UICollectionViewCell {
    
    var viewModel: SettingsCollectionViewCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            parameterLabel.text = viewModel.parameterName.rawValue
            segmentedControl.setTitle(viewModel.parameterMetrics[0], forSegmentAt: 0)
            segmentedControl.setTitle(viewModel.parameterMetrics[1], forSegmentAt: 1)
            segmentedControl.selectedSegmentIndex = viewModel.selectedIndex
        }
    }
    
    private lazy var parameterLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = contentView.backgroundColor
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["", ""])
        sc.selectedSegmentTintColor = .white
        sc.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        sc.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
        sc.backgroundColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
        sc.addTarget(self, action: #selector(didChangedParameterType), for: .valueChanged)
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Content View Configuration

extension SettingsCollectionViewCell {
    
    private func configureContentView() {
        contentView.backgroundColor = .none
        
        contentView.addSubview(segmentedControl)
        contentView.addSubview(parameterLabel)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: contentView.topAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            segmentedControl.widthAnchor.constraint(equalToConstant: 115),
            
            parameterLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            parameterLabel.heightAnchor.constraint(equalToConstant: 24),
            parameterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            parameterLabel.trailingAnchor.constraint(lessThanOrEqualTo: segmentedControl.leadingAnchor, constant: -28)
        ])
        
    }
}

//MARK: - Change settings

extension SettingsCollectionViewCell {
    @objc func didChangedParameterType() {
        guard let viewModel = viewModel else { return }
        let userDefaults = UserDefaults.standard
        switch viewModel.parameterName {
        case .height:
            let currentValue = userDefaults.bool(forKey: "heightMetrics")
            userDefaults.set(!currentValue, forKey: "heightMetrics")
        case .diameter:
            let currentValue = userDefaults.bool(forKey: "diameterMetrics")
            userDefaults.set(!currentValue, forKey: "diameterMetrics")
        case .mass:
            let currentValue = userDefaults.bool(forKey: "massMetrics")
            userDefaults.set(!currentValue, forKey: "massMetrics")
        case .payloadWeight:
            let currentValue = userDefaults.bool(forKey: "payloadWeightMetrics")
            userDefaults.set(!currentValue, forKey: "payloadWeightMetrics")
        }
        self.inputViewController?.dismiss(animated: true)
    }
}
