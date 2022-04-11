//
//  NetworkService.swift
//  SpaceX
//
//  Created by Сергей Коньков on 03.04.2022.
//

import Foundation

class NetworkService {
        
    func request(withUrlString urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            //DispatchQueue.main.async {
                completion(data, error)
            //}
        }
    }
}
