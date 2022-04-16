//
//  PageViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 05.04.2022.
//

import Foundation

class PageViewModel {
    
    let fetcher = NetworkDataFetcher(networkService: NetworkService())
    
    var rockets: Box<[Rocket]?> = Box(nil)
    var rocketsImageData: Box<[Data?]?> = Box(nil)
    
    func fetchRockets() {
        fetcher.getRocketsInfo { rockets in
            self.rockets.value = rockets
            self.fetchRocketImages()
        }
    }
    
    func fetchRocketImages() {
        guard let rockets = rockets.value else { return }
        let imageURLs = rockets.map { $0.imageUrlString }
        var operationsStatus = [Bool](repeating: false, count: rockets.count)
        var imagesData = [Data?](repeating: nil, count: rockets.count)
        for (index, urlString) in imageURLs.enumerated() {
            fetcher.fetchRocketImageData(withUrlString: urlString) { data in
                imagesData[index] = data
                operationsStatus[index] = true
                if !operationsStatus.contains(false) {
                    self.rocketsImageData.value = imagesData
                }
            }
        }
    }
    
    func numberOfTableViews() -> Int {
        return rockets.value?.count ?? 0
    }
    
    func tableViewViewModel(forPage page: Int) -> TableViewViewModel? {
        guard let rockets = rockets.value else { return nil }
        let currentRocket = rockets[page]
        let imageData = rocketsImageData.value?[page]
        return TableViewViewModel(rocket: currentRocket, currentPage: page, imageData: imageData)
    }
}
