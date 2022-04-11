//
//  TableViewThirdCellViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 04.04.2022.
//

import Foundation

class TableViewThirdCellViewModel: TableViewCellViewModelType {
    
    let rocket: Rocket
    
    var firstFlight: String {
        return rocket.firstFlight
    }
    
    var country: String {
        return rocket.country
    }
    
    var costPerLaunch: String {
        return "\(rocket.costPerLaunch)"
    }
    
    init(rocket: Rocket) {
        self.rocket = rocket
    }
}
