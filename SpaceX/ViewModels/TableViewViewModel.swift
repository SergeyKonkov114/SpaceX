//
//  TableViewViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 04.04.2022.
//

import Foundation
import UIKit

class TableViewViewModel {
    
//    private let fetcher  = NetworkDataFetcher(networkService: NetworkService())
    
    private var rocket: Rocket?
    private let countOfCells = 6
    private var currentPage: Int
    //private var rocketImage: UIImage?
    
//    private var weightMetric: WeightMetric
//    private var heightMetric: HeightMetric
    
    private var imageData: Data?
    
//    private var launchesButtonAction: (() -> ())?
    
//    init(rocket: Rocket, currentPage: Int, imageData: Data?, launchesButtonAction: (() -> ())?) {
    init(rocket: Rocket, currentPage: Int, imageData: Data?) {
        self.rocket = rocket
        self.currentPage = currentPage
        self.imageData = imageData
//        self.launchesButtonAction = launchesButtonAction
    }
    
//    init() {
//        fetcher.getRocketsInfo { rockets in
//            guard let rockets = rockets else { return }
//            self.rocket = rockets[0]
//        }
//    }
    
//    func fetchRockets(completion: @escaping () -> ()) {
//        fetcher.getRocketsInfo { rockets in
//            guard let rockets = rockets else { return }
//            self.rocket = rockets[1]
//            completion()
//        }
//    }
    
//    func fetchRocketImage(completion: @escaping () -> ()) {
//        let imageUrlString = rocket?.imageUrlString
//        fetcher.getRocketImage(withUrlString: imageUrlString) { image in
//            DispatchQueue.main.async {
//                self.rocketImage = image
//                completion()
//            }
//        }
//    }
    
    func numberOfRows() -> Int {
        return countOfCells
    }
    
    func getCurrentPage() -> Int {
        return currentPage
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        guard let rocket = rocket else { return nil }

        switch indexPath.row {
        case 0: return TableViewFirstCellViewModel(rocket: rocket)
        case 1:
            let rocketParams = prepareParameters(forRocket: rocket)
            return TableViewSecondCellViewModel(rocketParameters: rocketParams)
        case 2: return TableViewThirdCellViewModel(rocket: rocket)
        case 3: return TableViewFourthCellViewModel(rocket: rocket)
        case 4: return TableViewFifthCellViewModel(rocket: rocket)
        case 5:
//            return TableViewSixthCellViewModel(buttonAction: launchesButtonAction)
            return TableViewSixthCellViewModel(rocket: rocket)
        default: return nil
        }
    }
    
    private func prepareParameters(forRocket rocket: Rocket) -> RocketParameters {
        let height = rocket.height
        let diameter = rocket.diameter
        let mass = rocket.mass
        let currentPayloadWeight = rocket.payloadWeights.filter { $0.id == "leo" }.first
        var payloadWeight: Weight? = nil
        if let currentPayloadWeight = currentPayloadWeight {
            payloadWeight = Weight(kg: currentPayloadWeight.kg,
                                   lb: currentPayloadWeight.lb)
        }
        return RocketParameters(rocketHeight: height,
                                rocketDiameter: diameter,
                                rocketMass: mass,
                                payloadWeight: payloadWeight)
    }
    
    func headerViewModel() -> HeaderViewViewModel? {
        return HeaderViewViewModel(imageData: imageData)
    }
    
    func launchesViewControllerViewModel() -> LaunchesControllerViewModel? {
        guard let rocket = rocket else { return nil }
        return LaunchesControllerViewModel(rocketId: rocket.id, rocketName: rocket.name)
    }
    
    func settingsViewControllerViewModel() -> SettingsControllerViewModel? {
        return SettingsControllerViewModel()
    }
    
//    func headerViewModel(withCompletion completion: @escaping () -> ()) -> HeaderViewViewModel? {
//        //let imageUrlString = rocket?.imageUrlString
//
//        //let headerViewModel = HeaderViewViewModel(imageUrlString: imageUrlString)
//        //headerViewModel.fetchRocketImage {
//        //    DispatchQueue.main.async {
//        //        completion()
//        //    }
//        //}
//        //return headerViewModel
//        //return HeaderViewViewModel(imageUrlString: imageUrlString)
//        return HeaderViewViewModel()
//    }
}
