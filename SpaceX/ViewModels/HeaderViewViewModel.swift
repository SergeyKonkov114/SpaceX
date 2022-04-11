//
//  HeaderViewViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 06.04.2022.
//

import Foundation

class HeaderViewViewModel {
    
    var imageData: Data?
    
//    private var imageUrlString: String?
//    private var rocketImageData: Data?
    
//    let fetcher = NetworkDataFetcher(networkService: NetworkService())
    
//    init(imageUrlString: String?) {
//        self.imageUrlString = imageUrlString
//    }
    
    init(imageData: Data?) {
        self.imageData = imageData
    }
    
//    func fetchRocketImage(completion: @escaping () -> ()) {
//        guard rocketImageData == nil else { return }
//        fetcher.fetchRocketImageData(withUrlString: imageUrlString) { data in
//            self.rocketImageData = data
//            DispatchQueue.main.async {
//                completion()
//            }
//        }
//    }
    
    
    
//    func getRocketImageData() -> Data? {
//        return rocketImageData
//    }
}
