//
//  Rocket.swift
//  SpaceX
//
//  Created by Сергей Коньков on 03.04.2022.
//

import Foundation

struct Rocket: Decodable {
    let height: Metrics
    let diameter: Metrics
    let mass: Weight
    let firstStage: FirstStage
    let secondStage: SecondStage
    let payloadWeights: [PayloadWeight]
    let flickrImages: [String]
    var imageUrlString: String? { return flickrImages.first }
    let name: String
    let costPerLaunch: Int
    let firstFlight: String
    let country: String
    let id: String
}

struct PayloadWeight: Decodable {
    let id: String
    let kg: Int
    let lb: Int
}

struct Metrics: Decodable {
    let meters: Double
    let feet: Double
}

struct Weight: Decodable {
    let kg: Int
    let lb: Int
}

struct FirstStage: Decodable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSec: Int?
}

struct SecondStage: Decodable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSec: Int?
}
