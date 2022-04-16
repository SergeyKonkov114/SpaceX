//
//  NetworkDataFetcher.swift
//  SpaceX
//
//  Created by Сергей Коньков on 04.04.2022.
//

import Foundation
import UIKit

class NetworkDataFetcher {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getRocketLaunches(response: @escaping ([Launch]?) -> Void) {
        let urlString = "https://api.spacexdata.com/v4/launches"
        networkService.request(withUrlString: urlString) { data, error in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            } else {
                let decoded = self.parseJSON(type: [Launch].self, from: data)
                response(decoded)
            }
        }
    }
    
    func getRocketsInfo(response: @escaping ([Rocket]?) -> Void) {
        let urlString = "https://api.spacexdata.com/v4/rockets"
        networkService.request(withUrlString: urlString) { data, error in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            } else {
                let decoded = self.parseJSON(type: [Rocket].self, from: data)
                response(decoded)
            }
        }
    }
    
    func getRocketImage(withUrlString urlString: String?, response: @escaping (UIImage?) -> Void) {
        guard let urlString = urlString else { return }
        networkService.request(withUrlString: urlString) { data, error in
            if let error = error {
                print("Error received requesting image data: \(error.localizedDescription)")
                response(nil)
            } else {
                guard let data = data else {
                    print("Error with data")
                    response(nil)
                    return
                }
                guard let receivedImage = UIImage(data: data) else {
                    print("Error while converting data to image")
                    response(nil)
                    return
                }
                response(receivedImage)
            }
        }
    }
    
    func fetchRocketImageData(withUrlString urlString: String?, response: @escaping (Data?) -> Void) {
        guard let urlString = urlString else { return }
        networkService.request(withUrlString: urlString) { data, error in
            guard let data = data else { return }
            response(data)
        }
    }
    
    private func parseJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            guard let data = data else { return nil }
            let response = try decoder.decode(T.self, from: data)
            return response
        } catch {
            print("Error while unpacking data: \(error.localizedDescription)")
            return nil
        }
    }
}
