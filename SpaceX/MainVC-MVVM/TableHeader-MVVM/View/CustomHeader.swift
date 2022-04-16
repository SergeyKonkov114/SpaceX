//
//  CustomHeader.swift
//  SpaceX
//
//  Created by Сергей Коньков on 06.04.2022.
//

import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    
    var viewModel: HeaderViewViewModel? {
        willSet(viewModel) {
            if let data = viewModel?.imageData {
                imageView.image = UIImage(data: data)
            } else {
                imageView.image = UIImage(named: "Photo")
            }
        }
    }
    
    private lazy var imageView: UIImageView = {
        let iw = UIImageView()
        iw.contentMode = .scaleAspectFill
        iw.backgroundColor = UIColor.init(red: 0.3, green: 0.2, blue: 0.05, alpha: 0.1)
        iw.translatesAutoresizingMaskIntoConstraints = false
        return iw
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Content View Configuration

extension CustomHeader {
    
    private func configureContentView() {
        contentView.backgroundColor = .yellow
        
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
}
