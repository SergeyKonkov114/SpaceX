//
//  TableViewFifthCellViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 04.04.2022.
//

import Foundation

class TableViewFifthCellViewModel: TableViewCellViewModelType {
    
    let rocket: Rocket
    
    var title: String {
        return "ВТОРАЯ СТУПЕНЬ"
    }
    
    var countOfEngines: String {
        return "\(rocket.secondStage.engines)"
    }
    
    var fuelAmountTons: String {
        return "\(rocket.secondStage.fuelAmountTons)"
    }
    
    var burnTimeSec: String {
        guard let burnTime = rocket.secondStage.burnTimeSec else {
            return "-"
        }
        return "\(burnTime)"
    }
    
    init(rocket: Rocket) {
        self.rocket = rocket
    }
}
