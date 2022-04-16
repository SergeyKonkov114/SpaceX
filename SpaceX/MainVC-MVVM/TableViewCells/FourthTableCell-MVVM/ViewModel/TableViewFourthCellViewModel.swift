//
//  TableViewFourthCellViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 04.04.2022.
//

import Foundation

class TableViewFourthCellViewModel: TableViewCellViewModelType {
    
    let rocket: Rocket
    
    var title: String {
        return "ПЕРВАЯ СТУПЕНЬ"
    }
    
    var countOfEngines: String {
        return "\(rocket.firstStage.engines)"
    }
    
    var fuelAmountTons: String {
        return "\(rocket.firstStage.fuelAmountTons)"
    }
    
    var burnTimeSec: String {
        guard let burnTime = rocket.firstStage.burnTimeSec else {
            return "-"
        }
        return "\(burnTime)"
    }
    
    init(rocket: Rocket) {
        self.rocket = rocket
    }
}

