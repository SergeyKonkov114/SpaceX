//
//  LaunchCollectionViewCellViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 08.04.2022.
//

import Foundation

class LaunchCollectionViewCellViewModel {
    
    private let launch: Launch
    
    var launchName: String {
        return launch.launchName
    }
    
    var launchDate: String {
        return launch.dateUtc
    }
    
    var success: Bool? {
        return launch.success
    }
    
    init(launch: Launch) {
        self.launch = launch
    }
}
