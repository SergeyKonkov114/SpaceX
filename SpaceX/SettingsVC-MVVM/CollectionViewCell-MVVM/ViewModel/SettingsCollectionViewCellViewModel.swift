//
//  SettingsCollectionViewCellViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 11.04.2022.
//

import Foundation

class SettingsCollectionViewCellViewModel {
    
    let parameterName: ParameterType
    let parameterMetrics: [String]
    let selectedIndex: Int
    
    init(parameter: ParameterType, index: Int) {
        self.parameterName = parameter
        self.parameterMetrics = parameter.parameterMetric
        self.selectedIndex = index
    }
}
