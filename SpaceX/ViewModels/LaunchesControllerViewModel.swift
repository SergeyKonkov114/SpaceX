//
//  LaunchesControllerViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 08.04.2022.
//

import Foundation

class LaunchesControllerViewModel {
    
    private var launches: [Launch]?
    
    private let fetcher = NetworkDataFetcher(networkService: NetworkService())
    
    func fetchLaunches(completion: @escaping () -> ()) {
        fetcher.getRocketLaunches { allLaunches in
            guard let allLaunches = allLaunches else { return }
            let launches = allLaunches.filter { $0.rocketId == self.rocketId && $0.success != nil }
            self.launches = launches
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    let rocketId: String
    let rocketName: String
    
    init(rocketId: String, rocketName: String) {
        self.rocketId = rocketId
        self.rocketName = rocketName
    }
    
    func numberOfItems() -> Int {
        return launches?.count ?? 0
    }
    
    func launchCollectionViewCellViewModel(forIndexPath indexPath: IndexPath) -> LaunchCollectionViewCellViewModel? {
        guard let launches = launches else { return nil }
        let currentLaunch = launches[indexPath.row]
        return LaunchCollectionViewCellViewModel(launch: currentLaunch)
    }
}
