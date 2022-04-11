//
//  CollectionViewCell.swift
//  SpaceX
//
//  Created by Сергей Коньков on 07.04.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.textColor = .white
        //label.backgroundColor = .none
        label.text = "nil"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var parameterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        label.textColor = .gray
        //label.backgroundColor = .none
        label.text = "Величина, мм"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewModel: CollectionViewCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            parameterLabel.text = viewModel.parameterName
            valueLabel.text = viewModel.parameterValue
        }
    }

    
}

// MARK: - Collection View Cell Configuration

extension CollectionViewCell {
    
    private func configureContentView() {
        
        contentView.backgroundColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
        contentView.layer.cornerRadius = contentView.frame.width / 3
        
        contentView.addSubview(valueLabel)
        contentView.addSubview(parameterLabel)
        
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
            valueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            valueLabel.heightAnchor.constraint(equalToConstant: 24),
            
            parameterLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor),
            parameterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            parameterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            parameterLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
