//
//  LaunchCollectionViewCell.swift
//  SpaceX
//
//  Created by Сергей Коньков on 08.04.2022.
//

import UIKit

class LaunchCollectionViewCell: UICollectionViewCell {
    
    var viewModel: LaunchCollectionViewCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            launchNameLabel.text = viewModel.launchName
            launchDateLabel.text = viewModel.launchDate
            if let success = viewModel.success {
                launchImageView.backgroundColor = success ? .green : .red
            } else {
                launchImageView.backgroundColor = .white
            }
        }
    }
    
    private lazy var launchNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = contentView.backgroundColor
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        label.textColor = .white
        label.text = "-"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var launchDateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = contentView.backgroundColor
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textColor = .gray
        label.text = "-"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var launchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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

extension LaunchCollectionViewCell {
    
    private func configureContentView() {
        contentView.backgroundColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
        contentView.layer.cornerRadius = 24
        
        contentView.addSubview(launchImageView)
        contentView.addSubview(launchNameLabel)
        contentView.addSubview(launchDateLabel)
        
        NSLayoutConstraint.activate([
            launchImageView.widthAnchor.constraint(equalToConstant: 30),
            launchImageView.heightAnchor.constraint(equalTo: launchImageView.widthAnchor),
            launchImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            launchImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -33),
            
            launchNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            launchNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            launchNameLabel.heightAnchor.constraint(equalToConstant: 28),
            launchNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: launchImageView.leadingAnchor, constant: -20),
            
            launchDateLabel.topAnchor.constraint(equalTo: launchNameLabel.bottomAnchor),
            launchDateLabel.leadingAnchor.constraint(equalTo: launchNameLabel.leadingAnchor),
            launchDateLabel.heightAnchor.constraint(equalToConstant: 24),
            launchDateLabel.trailingAnchor.constraint(lessThanOrEqualTo: launchImageView.leadingAnchor, constant: -20)
        ])
    }
}
