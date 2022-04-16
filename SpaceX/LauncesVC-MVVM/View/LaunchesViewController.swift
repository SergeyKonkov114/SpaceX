//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Сергей Коньков on 08.04.2022.
//

import UIKit

class LaunchesViewController: UIViewController {
    
    var viewModel: LaunchesControllerViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            viewModel.fetchLaunches {
                self.collectionView.reloadData()
            }
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        collectionView.register(LaunchCollectionViewCell.self, forCellWithReuseIdentifier: "launchCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.topItem?.title = viewModel?.rocketName
    }

}

//MARK: - View Configuration

extension LaunchesViewController {
    
    private func configureView() {
        view.addSubview(collectionView)
        view.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

//MARK: - Collection View Data Source

extension LaunchesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "launchCell", for: indexPath) as? LaunchCollectionViewCell,
        let viewModel = viewModel else { return UICollectionViewCell() }
        cell.viewModel = viewModel.launchCollectionViewCellViewModel(forIndexPath: indexPath)
        return cell
    }
}

//MARK: - Collection View Flow Layout

extension LaunchesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40, left: 32, bottom: 40, right: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 64, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
