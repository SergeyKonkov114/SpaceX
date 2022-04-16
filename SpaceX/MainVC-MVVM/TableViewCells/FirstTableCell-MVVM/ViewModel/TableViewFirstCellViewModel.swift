//
//  TableViewFirstCellViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 04.04.2022.
//

import Foundation

class TableViewFirstCellViewModel: TableViewCellViewModelType {
    
    let rocket: Rocket
    
    var rocketName: String {
        return rocket.name
    }
    
    init(rocket: Rocket) {
        self.rocket = rocket
    }
}
