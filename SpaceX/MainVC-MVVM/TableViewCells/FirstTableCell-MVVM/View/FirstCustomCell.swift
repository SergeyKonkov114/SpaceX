//
//  FirstCustomCell.swift
//  SpaceX
//
//  Created by Сергей Коньков on 03.04.2022.
//

import UIKit

class FirstCustomCell: UITableViewCell {
    
    var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel as? TableViewFirstCellViewModel else { return }
            rocketNameLabel.text = viewModel.rocketName
        }
    }
    
    private lazy var rocketNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 24)
        label.text = ""
        label.textColor = .white
        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "gearshape"), for: .normal)
        button.addTarget(nil, action: #selector(MainViewController.didTapSettingsButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

//MARK: - Content View Configuration

extension FirstCustomCell {
    
    private func configureContentView() {
        contentView.backgroundColor = .black
        contentView.addSubview(rocketNameLabel)
        contentView.addSubview(settingsButton)
        
        NSLayoutConstraint.activate([
            rocketNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 48),
            rocketNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            rocketNameLabel.widthAnchor.constraint(equalToConstant: 146),
            rocketNameLabel.heightAnchor.constraint(equalToConstant: 32),
            
            settingsButton.widthAnchor.constraint(equalToConstant: 25.71),
            settingsButton.heightAnchor.constraint(equalToConstant: 27.63),
            settingsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35.62),
            settingsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50.67)
        ])
    }
}
