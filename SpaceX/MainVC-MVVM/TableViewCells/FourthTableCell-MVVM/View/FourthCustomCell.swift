//
//  FourthCustomCell.swift
//  SpaceX
//
//  Created by Сергей Коньков on 03.04.2022.
//

import UIKit

class FourthCustomCell: UITableViewCell {
    
    var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel as? TableViewFourthCellViewModel else { return }
            titleLabel.text = viewModel.title
            countOfEnginesLabel.text = viewModel.countOfEngines
            fuelAmountTonsLabel.text = viewModel.fuelAmountTons
            burnTimeSecLabel.text = viewModel.burnTimeSec
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = configureLabel(with: "ПЕРВАЯ СТУПЕНЬ", fontName: "HelveticaNeue-Bold")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var countOfEnginesLabel: UILabel = configureLabel(with: "", fontName: "HelveticaNeue-Bold")
    private lazy var fuelAmountTonsLabel: UILabel = configureLabel(with: "", fontName: "HelveticaNeue-Bold")
    private lazy var burnTimeSecLabel: UILabel = configureLabel(with: "", fontName: "HelveticaNeue-Bold")
    
    private lazy var titlesStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .leading
        sv.distribution = .fillEqually
        sv.spacing = 16
        sv.addArrangedSubview(configureLabel(with: "Количество двигателей", fontName: "HelveticaNeue"))
        sv.addArrangedSubview(configureLabel(with: "Количество топлива", fontName: "HelveticaNeue"))
        sv.addArrangedSubview(configureLabel(with: "Время сгорания", fontName: "HelveticaNeue"))
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var valuesStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .trailing
        sv.distribution = .fillEqually
        sv.spacing = 16
        sv.addArrangedSubview(countOfEnginesLabel)
        sv.addArrangedSubview(fuelAmountTonsLabel)
        sv.addArrangedSubview(burnTimeSecLabel)
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var metricsStackView: UIStackView = {
        let sv = UIStackView()
        let plugLabel = configureLabel(with: "", fontName: "HelveticaNeue-Bold")
        let labelTon = configureLabel(with: "ton", fontName: "HelveticaNeue-Bold")
        labelTon.textColor = .gray
        let labelSec = configureLabel(with: "sec", fontName: "HelveticaNeue-Bold")
        labelSec.textColor = .gray
        sv.axis = .vertical
        sv.alignment = .trailing
        sv.distribution = .fillEqually
        sv.spacing = 16
        sv.addArrangedSubview(plugLabel)
        sv.addArrangedSubview(labelTon)
        sv.addArrangedSubview(labelSec)
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var valuesWithMetricsStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 8
        sv.addArrangedSubview(valuesStackView)
        sv.addArrangedSubview(metricsStackView)
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var mainInfoStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.addArrangedSubview(titlesStackView)
        sv.addArrangedSubview(valuesWithMetricsStackView)
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
}

//MARK: - Content View Configuration

extension FourthCustomCell {
    
    private func configureContentView() {
        
        contentView.backgroundColor = .black
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(mainInfoStackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),            
            
            mainInfoStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            mainInfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            mainInfoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            mainInfoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    private func configureLabel(with text: String, fontName: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: fontName, size: 16)
        label.text = text
        label.textColor = .white
        label.backgroundColor = .black
        return label
    }
}
