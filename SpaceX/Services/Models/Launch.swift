//
//  Launch.swift
//  SpaceX
//
//  Created by Сергей Коньков on 09.04.2022.
//

import Foundation

struct Launch: Decodable {
    let rocket: String
    let success: Bool?
    let name: String
    let dateUtc: String
    
    var rocketId: String {
        return rocket
    }
    var launchName: String {
        return name
    }
}
