//
//  CollectionViewCellViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 07.04.2022.
//

import Foundation

class CollectionViewCellViewModel {
    
    private var rocketParameter: RocketParameter
    
    var parameterName: String {
        return rocketParameter.parameterName
    }
    
    var parameterValue: String {
        return rocketParameter.parameterValue ?? "-"
    }
    
    init(rocketParameter: RocketParameter) {
        self.rocketParameter = rocketParameter
    }
}
