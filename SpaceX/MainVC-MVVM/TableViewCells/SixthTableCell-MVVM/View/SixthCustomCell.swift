//
//  SixthCustomCell.swift
//  SpaceX
//
//  Created by Сергей Коньков on 03.04.2022.
//

import UIKit

class SixthCustomCell: UITableViewCell {
    
    var viewModel: TableViewCellViewModelType?
    
    private lazy var launchesButton: UIButton = {
        let lb = UIButton(type: .system)
        lb.setTitle("Посмотреть запуски", for: .normal)
        lb.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        lb.setTitleColor(.white, for: .normal)
        lb.backgroundColor = .secondaryLabel
        lb.layer.cornerRadius = 10
        lb.addTarget(nil, action: #selector(MainViewController.didTapLaunchesButton), for: .touchUpInside)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
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

extension SixthCustomCell {
    
    private func configureContentView() {
        contentView.backgroundColor = .black
        contentView.addSubview(launchesButton)
        
        NSLayoutConstraint.activate([
            launchesButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            launchesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            launchesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            launchesButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
