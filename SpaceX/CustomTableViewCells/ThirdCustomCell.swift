//
//  ThirdCustomCell.swift
//  SpaceX
//
//  Created by Сергей Коньков on 03.04.2022.
//

import UIKit

class ThirdCustomCell: UITableViewCell {
    
    private lazy var titlesStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .leading
        sv.distribution = .fillEqually
        sv.spacing = 16
        sv.addArrangedSubview(configureTitleLabel(with: "Первый запуск"))
        sv.addArrangedSubview(configureTitleLabel(with: "Страна"))
        sv.addArrangedSubview(configureTitleLabel(with: "Стоимость запуска"))
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var firstFlightLabel: UILabel = configureTitleLabel(with: "")
    private lazy var countryLabel: UILabel = configureTitleLabel(with: "")
    private lazy var costPerLaunchLabel: UILabel = configureTitleLabel(with: "")
    
    private lazy var valuesStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .trailing
        sv.distribution = .fillEqually
        sv.spacing = 16
        sv.addArrangedSubview(firstFlightLabel)
        sv.addArrangedSubview(countryLabel)
        sv.addArrangedSubview(costPerLaunchLabel)
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var mainInfoStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.addArrangedSubview(titlesStackView)
        sv.addArrangedSubview(valuesStackView)
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
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
    
    var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel as? TableViewThirdCellViewModel else { return }
            firstFlightLabel.text = viewModel.firstFlight
            countryLabel.text = viewModel.country
            costPerLaunchLabel.text = viewModel.costPerLaunch
        }
    }
}

//MARK: - Content View Configuration

extension ThirdCustomCell {
    
    private func configureContentView() {
        
        contentView.backgroundColor = .black
        
        contentView.addSubview(mainInfoStackView)
        
        NSLayoutConstraint.activate([
            mainInfoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            mainInfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            mainInfoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            mainInfoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    private func configureTitleLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica Neue", size: 16)
        label.text = text
        label.textColor = .white
        label.backgroundColor = .black
        return label
    }
}
