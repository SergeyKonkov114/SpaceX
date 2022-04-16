//
//  SettingsViewController.swift
//  SpaceX
//
//  Created by Сергей Коньков on 10.04.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var viewModel: SettingsControllerViewModel?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = view.backgroundColor
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textColor = .white
        label.text = "Настройки"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = view.backgroundColor
        button.setTitle("Закрыть", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        collectionView.register(SettingsCollectionViewCell.self, forCellWithReuseIdentifier: "parameterCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.topItem?.title = "Настройки"
    }
    

}

//MARK: - View Configuration

extension SettingsViewController {
    
    private func configureView() {
        view.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 18),
            titleLabel.heightAnchor.constraint(equalToConstant: 22),
            
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 18),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            closeButton.heightAnchor.constraint(equalToConstant: 22),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 72),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - Button Action

extension SettingsViewController {
    
    @objc func didTapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - Collection View Data Source

extension SettingsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "parameterCell", for: indexPath) as? SettingsCollectionViewCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel.settingsCollectionViewCellViewModel(forIndexPath: indexPath)
        return cell
    }
    
}

//MARK: - Collection View Delegate Flow Layout

extension SettingsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 56, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
    }
}
