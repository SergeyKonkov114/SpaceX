//
//  PageViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 05.04.2022.
//

import Foundation

class PageViewModel {
    
//    private var rockets: [Rocket]? {
//        willSet(rockets) {
//            guard let rockets = rockets else { return }
//            let imageURLs = rockets.map { $0.imageUrlString }
//            for (index, urlString) in imageURLs.enumerated() {
//                fetcher.fetchRocketImageData(withUrlString: urlString) { data in
//                    self.rocketsImageData[index] = data
//                }
//            }
//        }
//    }
    
    private var rockets: [Rocket]?
    
    //private var rocketsImageData: [Data]?
    private lazy var rocketsImageData = [Data?] (repeating: nil, count: rockets?.count ?? 0) 
    
    
    
    let fetcher = NetworkDataFetcher(networkService: NetworkService())
    
    func fetchRockets(completion: @escaping () -> ()) {
        fetcher.getRocketsInfo { rockets in
            
            self.rockets = rockets
            //print(rockets)
            //print("\n\n\n\n\n")
        
            guard let rockets = rockets else { return }
            let imageURLs = rockets.map { $0.imageUrlString }
            
            var operationsStatus = [Bool](repeating: false, count: rockets.count)
            
            for (index, urlString) in imageURLs.enumerated() {
                self.fetcher.fetchRocketImageData(withUrlString: urlString) { data in
                    self.rocketsImageData[index] = data
                    operationsStatus[index] = true
                    
                    if !operationsStatus.contains(false) {
                        DispatchQueue.main.async {
                            completion()
                        }
                    }
                    
                    //print(operationsStatus)
                    //print(index)
                    //print(data)
                    //print("\n\n")
//                    if index == rockets.count - 1 {
//                        DispatchQueue.main.async {
//                            completion()
//                        }
//                    }
                }
            }
            //print(self.rocketsImageData)
            
//            DispatchQueue.main.async {
//                completion()
//            }
        }
    }
    
//    func fetchRocketsImages(completion: @escaping () -> ()) {
//        //guard rocketImageData == nil else { return }
//
//        fetcher.fetchRocketImageData(withUrlString: imageUrlString) { data in
//            self.rocketImageData = data
//            DispatchQueue.main.async {
//                completion()
//            }
//        }
//    }
    
    func numberOfTableViews() -> Int {
        return rockets?.count ?? 0
    }
    
    func tableViewViewModel(forPage page: Int) -> TableViewViewModel? {
        guard let rockets = rockets else { return nil }
        let currentRocket = rockets[page]
        let imageData = rocketsImageData[page]
        return TableViewViewModel(rocket: currentRocket, currentPage: page, imageData: imageData)
    }
}
